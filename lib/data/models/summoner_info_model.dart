import 'package:equatable/equatable.dart';

class SummonerInfoModel extends Equatable {
  final String puuid;
  final int profileIconId;
  final int summonerLevel;
  final int revisionDate;

  const SummonerInfoModel({
    required this.puuid,
    required this.profileIconId,
    required this.summonerLevel,
    required this.revisionDate,
  });

  factory SummonerInfoModel.fromJson(Map<String, dynamic> json) {
    return SummonerInfoModel(
      puuid: json['puuid'],
      profileIconId: json['profileIconId'],
      summonerLevel: json['summonerLevel'],
      revisionDate: json['revisionDate'],
    );
  }

  @override
  List<Object> get props => [puuid, profileIconId, summonerLevel, revisionDate];
}