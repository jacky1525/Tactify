  class MatchDetailLiteModel {
    final String matchId;
    final int queueId;           // 420/440/450/900...
    final String gameMode;       // ARAM / CLASSIC / URF...
    final int gameDurationSec;   // saniye
    final int gameEndTs;         // epoch ms (0 olabilir)
    final List<MatchParticipantLiteModel> participants;

    const MatchDetailLiteModel({
      required this.matchId,
      required this.queueId,
      required this.gameMode,
      required this.gameDurationSec,
      required this.gameEndTs,
      required this.participants,
    });
  }

  class MatchParticipantLiteModel {
    final String puuid;
    final String championName;
    final int champLevel;
    final bool win;

    // Combat
    final int kills;
    final int deaths;
    final int assists;

    // Economy / Farming
    final int goldEarned;
    final int cs;                // totalMinionsKilled + neutralMinionsKilled

    // Build
    final List<int> items;       // item0..6
    final int spell1Id;          // summoner1Id
    final int spell2Id;          // summoner2Id

    // Runes
    final int primaryStyleId;    // styles[].style (primary)
    final int subStyleId;        // styles[].style (sub)
    final List<int> runePerkIds; // primary + sub selections (perk id’leri)

    // Team
    final int teamId;            // 100 / 200

    const MatchParticipantLiteModel({
      required this.puuid,
      required this.championName,
      required this.champLevel,
      required this.win,
      required this.kills,
      required this.deaths,
      required this.assists,
      required this.goldEarned,
      required this.cs,
      required this.items,
      required this.spell1Id,
      required this.spell2Id,
      required this.primaryStyleId,
      required this.subStyleId,
      required this.runePerkIds,
      required this.teamId,
    });
  }