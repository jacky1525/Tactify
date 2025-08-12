class ChampionMastery {
  final int championId;
  final int championLevel;
  final int championPoints;
  final int lastPlayTime; // ms epoch

  ChampionMastery({
    required this.championId,
    required this.championLevel,
    required this.championPoints,
    required this.lastPlayTime,
  });

  factory ChampionMastery.fromJson(Map<String, dynamic> j) => ChampionMastery(
        championId: j['championId'],
        championLevel: j['championLevel'],
        championPoints: j['championPoints'],
        lastPlayTime: j['lastPlayTime'],
      );
}