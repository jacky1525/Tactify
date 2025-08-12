enum LeagueQueue { solo, flex, tft }

class LeagueModel {
  final LeagueQueue queue;
  final String tier;         // e.g. DIAMOND, EMERALD
  final String rank;         // e.g. I, II, III, IV
  final int leaguePoints;
  final int wins;
  final int losses;

  const LeagueModel({
    required this.queue,
    required this.tier,
    required this.rank,
    required this.leaguePoints,
    required this.wins,
    required this.losses,
  });

  static LeagueQueue? _mapQueue(String s) {
    switch (s) {
      case 'RANKED_SOLO_5x5': return LeagueQueue.solo;
      case 'RANKED_FLEX_SR':  return LeagueQueue.flex;
      case 'RANKED_TFT':      return LeagueQueue.tft;
    }
    return null;
  }

  factory LeagueModel.fromJson(Map<String, dynamic> json) {
    final q = _mapQueue(json['queueType'] as String? ?? '');
    if (q == null) {
      throw ArgumentError('Unknown queueType: ${json['queueType']}');
    }
    return LeagueModel(
      queue: q,
      tier: (json['tier'] ?? '').toString(),
      rank: (json['rank'] ?? '').toString(),
      leaguePoints: json['leaguePoints'] ?? 0,
      wins: json['wins'] ?? 0,
      losses: json['losses'] ?? 0,
    );
  }

  String get pretty => '$tier $rank • $leaguePoints LP';
}

class LeaguesSummary {
  final LeagueModel? solo;
  final LeagueModel? flex;
  final LeagueModel? tft;

  const LeaguesSummary({this.solo, this.flex, this.tft});

  LeaguesSummary copyWith({
    LeagueModel? solo,
    LeagueModel? flex,
    LeagueModel? tft,
  }) => LeaguesSummary(
        solo: solo ?? this.solo,
        flex: flex ?? this.flex,
        tft:  tft  ?? this.tft,
      );

  bool get isEmpty => solo == null && flex == null && tft == null;
}