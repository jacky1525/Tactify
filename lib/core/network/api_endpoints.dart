import 'package:tactify/core/constants/constants.dart';

class ApiEndpoints {
  // Şampiyonları çekmek için endpoint
  static const String champions =
      "https://ddragon.leagueoflegends.com/cdn/15.14.1/data/tr_TR/champion.json";
  // Sihirdar büyülerini çekmek için endpoint
  static const String spells =
      "https://ddragon.leagueoflegends.com/cdn/15.14.1/data/tr_TR/summoner.json";
  // Rünleri çekmek için endpoint
  static const String runes =
      "https://ddragon.leagueoflegends.com/cdn/15.14.1/data/tr_TR/runesReforged.json";
  // İtemleri çekmek için endpoint
  static const String items =
      "https://ddragon.leagueoflegends.com/cdn/15.14.1/data/tr_TR/item.json";

  // rastgele hesap için endpoint
  static const String featuredGames =
      '${Constants.baseUrl}/lol/spectator/v5/featured-games';

  // hesap adı ve tag ile puuid almak için endpoint
  static String getAccountByRiotId(
    String region,
    String gameName,
    String tagLine,
  ) =>
      'https://$region.api.riotgames.com/riot/account/v1/accounts/by-riot-id/$gameName/$tagLine';

  // puuuid ile hesap bölgesini almak için endpoint
  static String getRegionByPuuid(String region,String puuid) =>
      'https://$region.api.riotgames.com/riot/account/v1/region/by-game/lol/by-puuid/$puuid';

  // puuid ile hesap bilgilerini almak için endpoint
  static String summonerInfo(String region, String puuid) =>
      'https://$region.api.riotgames.com/lol/summoner/v4/summoners/by-puuid/$puuid';

  // puuid ile tft lig bilgilerini almak için endpoint
  static String summonerTftLeague(String region, String puuid) =>
      'https://$region.api.riotgames.com/tft/league/v1/by-puuid/$puuid';
  // puuid ile lol lig bilgilerini almak için endpoint
  static String summonerLolLeague(String region, String puuid) =>
      'https://$region.api.riotgames.com/lol/league/v4/entries/by-puuid/$puuid';
  // puuid ile şampiyon ustalığını almak için endpoint
  static String summonerChampionsMastery(String region, String puuid) =>
      'https://$region.api.riotgames.com/lol/champion-mastery/v4/champion-masteries/by-puuid/$puuid/top';
  // puuid ile maç detaylarını almak için endpoint
  static String summonerMatchDetails(String region, String matchId) =>
      'https://$region.api.riotgames.com/lol/match/v5/matches/$matchId';

}
