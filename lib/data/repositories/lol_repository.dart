import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:tactify/core/network/api_endpoints.dart';
import 'package:tactify/core/network/dio_clients.dart';
import 'package:tactify/data/models/champion_info_model.dart';
import 'package:tactify/data/models/champion_mastery_model.dart';
import 'package:tactify/data/models/champions_model.dart';
import 'package:tactify/data/models/items_model.dart' as items_model;
import 'package:tactify/data/models/league_model.dart';
import 'package:tactify/data/models/match_detail_lite_model.dart';
import 'package:tactify/data/models/match_detail_model.dart';
import 'package:tactify/data/models/puuid_model.dart';
import 'package:tactify/data/models/random_games_model.dart';
import 'package:tactify/data/models/runes_model.dart';
import 'package:tactify/data/models/spells_model.dart';
import 'package:tactify/data/models/summoner_info_model.dart';

class RateLimitException implements Exception {
  final int retryAfterSeconds;
  const RateLimitException(this.retryAfterSeconds);

  @override
  String toString() => 'RateLimitException($retryAfterSeconds s)';
}

class LolRepository {
  final Dio _dio = DioClient.instance;

  // Tüm şampiyonları almak için fonksiyon
  Future<ChampionsModel?> getChampions() async {
    try {
      final response = await _dio.get(ApiEndpoints.champions);
      if (response.statusCode == 200) {
        return ChampionsModel.fromJson(response.data);
      }
      return null;
    } catch (e) {
      print("Champion fetch error: $e");
      return null;
    }
  }

  // Şampiyon detaylarını almak için fonksiyon
  Future<ChampionDetail?> fetchChampionDetail(String championName) async {
    try {
      final response = await _dio.get(
        "https://ddragon.leagueoflegends.com/cdn/15.14.1/data/tr_TR/champion/$championName.json",
      );
      if (response.statusCode == 200) {
        final data = ChampionInfoModel.fromJson(response.data);
        return data.data.values.first;
      }
      return null;
    } catch (e) {
      print("Champion detail fetch error: $e");
      return null;
    }
  }

  // Sihirdar Büyülerini almak için fonksiyon
  Future<SpellsModel?> getSpells() async {
    try {
      final response = await _dio.get(ApiEndpoints.spells);
      if (response.statusCode == 200) {
        return SpellsModel.fromJson(response.data);
      }
      return null;
    } catch (e) {
      print("Spells fetch error: $e");
      return null;
    }
  }

  // Rünleri almak için fonksiyon
  Future<List<RunesModel>?> getRunes() async {
    try {
      final response = await _dio.get(ApiEndpoints.runes);

      if (response.statusCode == 200) {
        final List<dynamic> rawList = response.data;
        final List<RunesModel> runes = rawList
            .map((item) => RunesModel.fromJson(item))
            .toList();
        return runes;
      } else {
        throw Exception(
          'Rün verisi alınamadı (status code: ${response.statusCode})',
        );
      }
    } catch (e) {
      throw Exception('Rün verisi alınırken hata oluştu: $e');
    }
  }

  // Eşyaları almak için fonksiyon
  Future<List<items_model.Datum>?> getItems() async {
    try {
      final response = await _dio.get(ApiEndpoints.items);
      if (response.statusCode == 200) {
        final itemsModel = items_model.itemsModelFromJson(
          jsonEncode(response.data),
        );
        return itemsModel.data.values.toList(); // Listeye çeviriyoruz
      } else {
        throw Exception('Eşya verisi alınamadı');
      }
    } catch (e) {
      throw Exception('Eşya verisi alınırken hata oluştu: $e');
    }
  }

  // Rastgele hesap almak için fonksiyon
  Future<RandomGames> getFeaturedGames() async {
    final response = await DioClient.getWithRiotKey(ApiEndpoints.featuredGames);
    return RandomGames.fromJson(response.data);
  }

  // Hesap adı ve tag ile puuid almak için fonksiyon
  Future<PuuidModel> getAccountInfo({
    required String region,
    required String gameName,
    required String tagLine,
  }) async {
    final response = await DioClient.getWithRiotKey(
      ApiEndpoints.getAccountByRiotId(region, gameName, tagLine),
    );
    return PuuidModel.fromJson(response.data);
  }

  // Hesap bölge adı almamız için fonksiyon
  Future<String> getRegionByPuuid({
    required String region,
    required String puuid,
  }) async {
    final url = ApiEndpoints.getRegionByPuuid(region, puuid);
    final response = await DioClient.getWithRiotKey(url);
    return response.data['region'];
  }

  // PUUID ile hesap bilgilerini almak için fonksiyon
  Future<SummonerInfoModel> getSummonerInfo({
    required String region,
    required String puuid,
  }) async {
    final url = ApiEndpoints.summonerInfo(region, puuid);
    print("APIENDPONITS FOR PUUİD ACCOUNT : $url");
    final response = await DioClient.getWithRiotKey(url);
    print('SUMMONER INFO RESPONSE: ${response.data}');
    return SummonerInfoModel.fromJson(response.data);
  }

  // PUUID ile TFT ve Lol lig bilgilerini almak için fonksiyon
  Future<LeaguesSummary> getLeagues({
    required String platformRegion, // tr1 / euw1 / na1 ... (platform code)
    required String puuid, // encryptedSummonerId
  }) async {
    LeagueModel? solo;
    LeagueModel? flex;
    LeagueModel? tft;

    // LoL (solo/flex)
    final lolUrl = ApiEndpoints.summonerLolLeague(platformRegion, puuid);

    try {
      final r = await DioClient.getWithRiotKey(lolUrl);
      final list = (r.data as List).cast<dynamic>();
      for (final e in list) {
        final entry = LeagueModel.fromJson(e as Map<String, dynamic>);
        if (entry.queue == LeagueQueue.solo) solo = entry;
        if (entry.queue == LeagueQueue.flex) flex = entry;
      }
    } on DioException catch (e) {
      // 404 veya [] geldiğinde boş say
      if (e.response?.statusCode != 404) rethrow;
    }

    // TFT
    final tftUrl = ApiEndpoints.summonerTftLeague(platformRegion, puuid);

    try {
      final r = await DioClient.getWithRiotKey(tftUrl);
      final list = (r.data as List).cast<dynamic>();
      for (final e in list) {
        final entry = LeagueModel.fromJson(e as Map<String, dynamic>);
        if (entry.queue == LeagueQueue.tft) tft = entry;
      }
    } on DioException catch (e) {
      if (e.response?.statusCode != 404) rethrow;
    }

    return LeaguesSummary(solo: solo, flex: flex, tft: tft);
  }

  // PUUID ile şampiyon ustalığını almak için fonksiyon
  Future<List<ChampionMastery>> getTopChampionMasteries({
    required String platformRegion, // tr1, euw1, na1...
    required String puuid,
  }) async {
    final url = ApiEndpoints.summonerChampionsMastery(platformRegion, puuid);
    final res = await DioClient.getWithRiotKey(url);
    final list = (res.data as List).cast<Map<String, dynamic>>();
    return list.map(ChampionMastery.fromJson).toList();
  }

  // PUUID ile maç ID'lerini almak için fonksiyon
  Future<List<String>> getMatchIds({
    required String routingRegion,
    required String puuid,
    int start = 0,
    int count = 10,
  }) async {
    final url =
        'https://$routingRegion.api.riotgames.com/lol/match/v5/matches/by-puuid/$puuid/ids?start=$start&count=$count';

    try {
      final res = await DioClient.getWithRiotKey(url);
      final data = (res.data as List).cast<dynamic>();
      return data.map((e) => e.toString()).toList();
    } on DioException catch (e) {
      // 429 rate limit
      if (e.response?.statusCode == 429) {
        // header büyük/küçük fark etmeyebilir; ikisini de dene
        final retryStr =
            e.response?.headers.value('Retry-After') ??
            e.response?.headers.value('retry-after');
        final retry = int.tryParse(retryStr ?? '') ?? 2; // fallback 2 sn
        throw RateLimitException(retry);
      }
      rethrow;
    }
  }

  // Maç ID'leri ile maç detayları çekmek için fonksiyon
  Future<MatchDetailModel> getMatchDetail({
    required String routingRegion, // "europe/americas/asia"
    required String matchId, // "TR1_123456789"
  }) async {
    final url =
        'https://$routingRegion.api.riotgames.com/lol/match/v5/matches/$matchId';
    final res = await DioClient.getWithRiotKey(url);
    // Tüm JSON’u parse et
    return MatchDetailModel.fromJson(res.data as Map<String, dynamic>);
  }
}
