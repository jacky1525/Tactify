import 'dart:convert';

class MatchDetailModel {
    Metadata? metadata;
    Info? info;

    MatchDetailModel({
        this.metadata,
        this.info,
    });

    factory MatchDetailModel.fromRawJson(String str) => MatchDetailModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory MatchDetailModel.fromJson(Map<String, dynamic> json) => MatchDetailModel(
        metadata: json["metadata"] == null ? null : Metadata.fromJson(json["metadata"]),
        info: json["info"] == null ? null : Info.fromJson(json["info"]),
    );

    Map<String, dynamic> toJson() => {
        "metadata": metadata?.toJson(),
        "info": info?.toJson(),
    };
}

class Info {
    String? endOfGameResult;
    int? gameCreation;
    int? gameDuration;
    int? gameEndTimestamp;
    int? gameId;
    String? gameMode;
    String? gameName;
    int? gameStartTimestamp;
    String? gameType;
    String? gameVersion;
    int? mapId;
    List<Participant>? participants;
    String? platformId;
    int? queueId;
    List<Team>? teams;
    String? tournamentCode;

    Info({
        this.endOfGameResult,
        this.gameCreation,
        this.gameDuration,
        this.gameEndTimestamp,
        this.gameId,
        this.gameMode,
        this.gameName,
        this.gameStartTimestamp,
        this.gameType,
        this.gameVersion,
        this.mapId,
        this.participants,
        this.platformId,
        this.queueId,
        this.teams,
        this.tournamentCode,
    });

    factory Info.fromRawJson(String str) => Info.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Info.fromJson(Map<String, dynamic> json) => Info(
        endOfGameResult: json["endOfGameResult"],
        gameCreation: json["gameCreation"],
        gameDuration: json["gameDuration"],
        gameEndTimestamp: json["gameEndTimestamp"],
        gameId: json["gameId"],
        gameMode: json["gameMode"],
        gameName: json["gameName"],
        gameStartTimestamp: json["gameStartTimestamp"],
        gameType: json["gameType"],
        gameVersion: json["gameVersion"],
        mapId: json["mapId"],
        participants: json["participants"] == null ? [] : List<Participant>.from(json["participants"]!.map((x) => Participant.fromJson(x))),
        platformId: json["platformId"],
        queueId: json["queueId"],
        teams: json["teams"] == null ? [] : List<Team>.from(json["teams"]!.map((x) => Team.fromJson(x))),
        tournamentCode: json["tournamentCode"],
    );

    Map<String, dynamic> toJson() => {
        "endOfGameResult": endOfGameResult,
        "gameCreation": gameCreation,
        "gameDuration": gameDuration,
        "gameEndTimestamp": gameEndTimestamp,
        "gameId": gameId,
        "gameMode": gameMode,
        "gameName": gameName,
        "gameStartTimestamp": gameStartTimestamp,
        "gameType": gameType,
        "gameVersion": gameVersion,
        "mapId": mapId,
        "participants": participants == null ? [] : List<dynamic>.from(participants!.map((x) => x.toJson())),
        "platformId": platformId,
        "queueId": queueId,
        "teams": teams == null ? [] : List<dynamic>.from(teams!.map((x) => x.toJson())),
        "tournamentCode": tournamentCode,
    };
}

class Participant {
    int? playerScore0;
    int? playerScore1;
    int? playerScore10;
    int? playerScore11;
    int? playerScore2;
    int? playerScore3;
    int? playerScore4;
    int? playerScore5;
    int? playerScore6;
    int? playerScore7;
    int? playerScore8;
    int? playerScore9;
    int? allInPings;
    int? assistMePings;
    int? assists;
    int? baronKills;
    int? basicPings;
    Challenges? challenges;
    int? champExperience;
    int? champLevel;
    int? championId;
    String? championName;
    int? championTransform;
    int? commandPings;
    int? consumablesPurchased;
    int? damageDealtToBuildings;
    int? damageDealtToObjectives;
    int? damageDealtToTurrets;
    int? damageSelfMitigated;
    int? dangerPings;
    int? deaths;
    int? detectorWardsPlaced;
    int? doubleKills;
    int? dragonKills;
    bool? eligibleForProgression;
    int? enemyMissingPings;
    int? enemyVisionPings;
    bool? firstBloodAssist;
    bool? firstBloodKill;
    bool? firstTowerAssist;
    bool? firstTowerKill;
    bool? gameEndedInEarlySurrender;
    bool? gameEndedInSurrender;
    int? getBackPings;
    int? goldEarned;
    int? goldSpent;
    int? holdPings;
    String? individualPosition;
    int? inhibitorKills;
    int? inhibitorTakedowns;
    int? inhibitorsLost;
    int? item0;
    int? item1;
    int? item2;
    int? item3;
    int? item4;
    int? item5;
    int? item6;
    int? itemsPurchased;
    int? killingSprees;
    int? kills;
    String? lane;
    int? largestCriticalStrike;
    int? largestKillingSpree;
    int? largestMultiKill;
    int? longestTimeSpentLiving;
    int? magicDamageDealt;
    int? magicDamageDealtToChampions;
    int? magicDamageTaken;
    Map<String, int>? missions;
    int? needVisionPings;
    int? neutralMinionsKilled;
    int? nexusKills;
    int? nexusLost;
    int? nexusTakedowns;
    int? objectivesStolen;
    int? objectivesStolenAssists;
    int? onMyWayPings;
    int? participantId;
    int? pentaKills;
    Perks? perks;
    int? physicalDamageDealt;
    int? physicalDamageDealtToChampions;
    int? physicalDamageTaken;
    int? placement;
    int? playerAugment1;
    int? playerAugment2;
    int? playerAugment3;
    int? playerAugment4;
    int? playerAugment5;
    int? playerAugment6;
    int? playerSubteamId;
    int? profileIcon;
    int? pushPings;
    String? puuid;
    int? quadraKills;
    int? retreatPings;
    String? riotIdGameName;
    String? riotIdTagline;
    String? role;
    int? sightWardsBoughtInGame;
    int? spell1Casts;
    int? spell2Casts;
    int? spell3Casts;
    int? spell4Casts;
    int? subteamPlacement;
    int? summoner1Casts;
    int? summoner1Id;
    int? summoner2Casts;
    int? summoner2Id;
    String? summonerId;
    int? summonerLevel;
    String? summonerName;
    bool? teamEarlySurrendered;
    int? teamId;
    String? teamPosition;
    int? timeCCingOthers;
    int? timePlayed;
    int? totalAllyJungleMinionsKilled;
    int? totalDamageDealt;
    int? totalDamageDealtToChampions;
    int? totalDamageShieldedOnTeammates;
    int? totalDamageTaken;
    int? totalEnemyJungleMinionsKilled;
    int? totalHeal;
    int? totalHealsOnTeammates;
    int? totalMinionsKilled;
    int? totalTimeCcDealt;
    int? totalTimeSpentDead;
    int? totalUnitsHealed;
    int? tripleKills;
    int? trueDamageDealt;
    int? trueDamageDealtToChampions;
    int? trueDamageTaken;
    int? turretKills;
    int? turretTakedowns;
    int? turretsLost;
    int? unrealKills;
    int? visionClearedPings;
    int? visionScore;
    int? visionWardsBoughtInGame;
    int? wardsKilled;
    int? wardsPlaced;
    bool? win;

    Participant({
        this.playerScore0,
        this.playerScore1,
        this.playerScore10,
        this.playerScore11,
        this.playerScore2,
        this.playerScore3,
        this.playerScore4,
        this.playerScore5,
        this.playerScore6,
        this.playerScore7,
        this.playerScore8,
        this.playerScore9,
        this.allInPings,
        this.assistMePings,
        this.assists,
        this.baronKills,
        this.basicPings,
        this.challenges,
        this.champExperience,
        this.champLevel,
        this.championId,
        this.championName,
        this.championTransform,
        this.commandPings,
        this.consumablesPurchased,
        this.damageDealtToBuildings,
        this.damageDealtToObjectives,
        this.damageDealtToTurrets,
        this.damageSelfMitigated,
        this.dangerPings,
        this.deaths,
        this.detectorWardsPlaced,
        this.doubleKills,
        this.dragonKills,
        this.eligibleForProgression,
        this.enemyMissingPings,
        this.enemyVisionPings,
        this.firstBloodAssist,
        this.firstBloodKill,
        this.firstTowerAssist,
        this.firstTowerKill,
        this.gameEndedInEarlySurrender,
        this.gameEndedInSurrender,
        this.getBackPings,
        this.goldEarned,
        this.goldSpent,
        this.holdPings,
        this.individualPosition,
        this.inhibitorKills,
        this.inhibitorTakedowns,
        this.inhibitorsLost,
        this.item0,
        this.item1,
        this.item2,
        this.item3,
        this.item4,
        this.item5,
        this.item6,
        this.itemsPurchased,
        this.killingSprees,
        this.kills,
        this.lane,
        this.largestCriticalStrike,
        this.largestKillingSpree,
        this.largestMultiKill,
        this.longestTimeSpentLiving,
        this.magicDamageDealt,
        this.magicDamageDealtToChampions,
        this.magicDamageTaken,
        this.missions,
        this.needVisionPings,
        this.neutralMinionsKilled,
        this.nexusKills,
        this.nexusLost,
        this.nexusTakedowns,
        this.objectivesStolen,
        this.objectivesStolenAssists,
        this.onMyWayPings,
        this.participantId,
        this.pentaKills,
        this.perks,
        this.physicalDamageDealt,
        this.physicalDamageDealtToChampions,
        this.physicalDamageTaken,
        this.placement,
        this.playerAugment1,
        this.playerAugment2,
        this.playerAugment3,
        this.playerAugment4,
        this.playerAugment5,
        this.playerAugment6,
        this.playerSubteamId,
        this.profileIcon,
        this.pushPings,
        this.puuid,
        this.quadraKills,
        this.retreatPings,
        this.riotIdGameName,
        this.riotIdTagline,
        this.role,
        this.sightWardsBoughtInGame,
        this.spell1Casts,
        this.spell2Casts,
        this.spell3Casts,
        this.spell4Casts,
        this.subteamPlacement,
        this.summoner1Casts,
        this.summoner1Id,
        this.summoner2Casts,
        this.summoner2Id,
        this.summonerId,
        this.summonerLevel,
        this.summonerName,
        this.teamEarlySurrendered,
        this.teamId,
        this.teamPosition,
        this.timeCCingOthers,
        this.timePlayed,
        this.totalAllyJungleMinionsKilled,
        this.totalDamageDealt,
        this.totalDamageDealtToChampions,
        this.totalDamageShieldedOnTeammates,
        this.totalDamageTaken,
        this.totalEnemyJungleMinionsKilled,
        this.totalHeal,
        this.totalHealsOnTeammates,
        this.totalMinionsKilled,
        this.totalTimeCcDealt,
        this.totalTimeSpentDead,
        this.totalUnitsHealed,
        this.tripleKills,
        this.trueDamageDealt,
        this.trueDamageDealtToChampions,
        this.trueDamageTaken,
        this.turretKills,
        this.turretTakedowns,
        this.turretsLost,
        this.unrealKills,
        this.visionClearedPings,
        this.visionScore,
        this.visionWardsBoughtInGame,
        this.wardsKilled,
        this.wardsPlaced,
        this.win,
    });

    factory Participant.fromRawJson(String str) => Participant.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Participant.fromJson(Map<String, dynamic> json) => Participant(
        playerScore0: json["PlayerScore0"],
        playerScore1: json["PlayerScore1"],
        playerScore10: json["PlayerScore10"],
        playerScore11: json["PlayerScore11"],
        playerScore2: json["PlayerScore2"],
        playerScore3: json["PlayerScore3"],
        playerScore4: json["PlayerScore4"],
        playerScore5: json["PlayerScore5"],
        playerScore6: json["PlayerScore6"],
        playerScore7: json["PlayerScore7"],
        playerScore8: json["PlayerScore8"],
        playerScore9: json["PlayerScore9"],
        allInPings: json["allInPings"],
        assistMePings: json["assistMePings"],
        assists: json["assists"],
        baronKills: json["baronKills"],
        basicPings: json["basicPings"],
        challenges: json["challenges"] == null ? null : Challenges.fromJson(json["challenges"]),
        champExperience: json["champExperience"],
        champLevel: json["champLevel"],
        championId: json["championId"],
        championName: json["championName"],
        championTransform: json["championTransform"],
        commandPings: json["commandPings"],
        consumablesPurchased: json["consumablesPurchased"],
        damageDealtToBuildings: json["damageDealtToBuildings"],
        damageDealtToObjectives: json["damageDealtToObjectives"],
        damageDealtToTurrets: json["damageDealtToTurrets"],
        damageSelfMitigated: json["damageSelfMitigated"],
        dangerPings: json["dangerPings"],
        deaths: json["deaths"],
        detectorWardsPlaced: json["detectorWardsPlaced"],
        doubleKills: json["doubleKills"],
        dragonKills: json["dragonKills"],
        eligibleForProgression: json["eligibleForProgression"],
        enemyMissingPings: json["enemyMissingPings"],
        enemyVisionPings: json["enemyVisionPings"],
        firstBloodAssist: json["firstBloodAssist"],
        firstBloodKill: json["firstBloodKill"],
        firstTowerAssist: json["firstTowerAssist"],
        firstTowerKill: json["firstTowerKill"],
        gameEndedInEarlySurrender: json["gameEndedInEarlySurrender"],
        gameEndedInSurrender: json["gameEndedInSurrender"],
        getBackPings: json["getBackPings"],
        goldEarned: json["goldEarned"],
        goldSpent: json["goldSpent"],
        holdPings: json["holdPings"],
        individualPosition: json["individualPosition"],
        inhibitorKills: json["inhibitorKills"],
        inhibitorTakedowns: json["inhibitorTakedowns"],
        inhibitorsLost: json["inhibitorsLost"],
        item0: json["item0"],
        item1: json["item1"],
        item2: json["item2"],
        item3: json["item3"],
        item4: json["item4"],
        item5: json["item5"],
        item6: json["item6"],
        itemsPurchased: json["itemsPurchased"],
        killingSprees: json["killingSprees"],
        kills: json["kills"],
        lane: json["lane"],
        largestCriticalStrike: json["largestCriticalStrike"],
        largestKillingSpree: json["largestKillingSpree"],
        largestMultiKill: json["largestMultiKill"],
        longestTimeSpentLiving: json["longestTimeSpentLiving"],
        magicDamageDealt: json["magicDamageDealt"],
        magicDamageDealtToChampions: json["magicDamageDealtToChampions"],
        magicDamageTaken: json["magicDamageTaken"],
        missions: Map.from(json["missions"]!).map((k, v) => MapEntry<String, int>(k, v)),
        needVisionPings: json["needVisionPings"],
        neutralMinionsKilled: json["neutralMinionsKilled"],
        nexusKills: json["nexusKills"],
        nexusLost: json["nexusLost"],
        nexusTakedowns: json["nexusTakedowns"],
        objectivesStolen: json["objectivesStolen"],
        objectivesStolenAssists: json["objectivesStolenAssists"],
        onMyWayPings: json["onMyWayPings"],
        participantId: json["participantId"],
        pentaKills: json["pentaKills"],
        perks: json["perks"] == null ? null : Perks.fromJson(json["perks"]),
        physicalDamageDealt: json["physicalDamageDealt"],
        physicalDamageDealtToChampions: json["physicalDamageDealtToChampions"],
        physicalDamageTaken: json["physicalDamageTaken"],
        placement: json["placement"],
        playerAugment1: json["playerAugment1"],
        playerAugment2: json["playerAugment2"],
        playerAugment3: json["playerAugment3"],
        playerAugment4: json["playerAugment4"],
        playerAugment5: json["playerAugment5"],
        playerAugment6: json["playerAugment6"],
        playerSubteamId: json["playerSubteamId"],
        profileIcon: json["profileIcon"],
        pushPings: json["pushPings"],
        puuid: json["puuid"],
        quadraKills: json["quadraKills"],
        retreatPings: json["retreatPings"],
        riotIdGameName: json["riotIdGameName"],
        riotIdTagline: json["riotIdTagline"],
        role: json["role"],
        sightWardsBoughtInGame: json["sightWardsBoughtInGame"],
        spell1Casts: json["spell1Casts"],
        spell2Casts: json["spell2Casts"],
        spell3Casts: json["spell3Casts"],
        spell4Casts: json["spell4Casts"],
        subteamPlacement: json["subteamPlacement"],
        summoner1Casts: json["summoner1Casts"],
        summoner1Id: json["summoner1Id"],
        summoner2Casts: json["summoner2Casts"],
        summoner2Id: json["summoner2Id"],
        summonerId: json["summonerId"],
        summonerLevel: json["summonerLevel"],
        summonerName: json["summonerName"],
        teamEarlySurrendered: json["teamEarlySurrendered"],
        teamId: json["teamId"],
        teamPosition: json["teamPosition"],
        timeCCingOthers: json["timeCCingOthers"],
        timePlayed: json["timePlayed"],
        totalAllyJungleMinionsKilled: json["totalAllyJungleMinionsKilled"],
        totalDamageDealt: json["totalDamageDealt"],
        totalDamageDealtToChampions: json["totalDamageDealtToChampions"],
        totalDamageShieldedOnTeammates: json["totalDamageShieldedOnTeammates"],
        totalDamageTaken: json["totalDamageTaken"],
        totalEnemyJungleMinionsKilled: json["totalEnemyJungleMinionsKilled"],
        totalHeal: json["totalHeal"],
        totalHealsOnTeammates: json["totalHealsOnTeammates"],
        totalMinionsKilled: json["totalMinionsKilled"],
        totalTimeCcDealt: json["totalTimeCCDealt"],
        totalTimeSpentDead: json["totalTimeSpentDead"],
        totalUnitsHealed: json["totalUnitsHealed"],
        tripleKills: json["tripleKills"],
        trueDamageDealt: json["trueDamageDealt"],
        trueDamageDealtToChampions: json["trueDamageDealtToChampions"],
        trueDamageTaken: json["trueDamageTaken"],
        turretKills: json["turretKills"],
        turretTakedowns: json["turretTakedowns"],
        turretsLost: json["turretsLost"],
        unrealKills: json["unrealKills"],
        visionClearedPings: json["visionClearedPings"],
        visionScore: json["visionScore"],
        visionWardsBoughtInGame: json["visionWardsBoughtInGame"],
        wardsKilled: json["wardsKilled"],
        wardsPlaced: json["wardsPlaced"],
        win: json["win"],
    );

    Map<String, dynamic> toJson() => {
        "PlayerScore0": playerScore0,
        "PlayerScore1": playerScore1,
        "PlayerScore10": playerScore10,
        "PlayerScore11": playerScore11,
        "PlayerScore2": playerScore2,
        "PlayerScore3": playerScore3,
        "PlayerScore4": playerScore4,
        "PlayerScore5": playerScore5,
        "PlayerScore6": playerScore6,
        "PlayerScore7": playerScore7,
        "PlayerScore8": playerScore8,
        "PlayerScore9": playerScore9,
        "allInPings": allInPings,
        "assistMePings": assistMePings,
        "assists": assists,
        "baronKills": baronKills,
        "basicPings": basicPings,
        "challenges": challenges?.toJson(),
        "champExperience": champExperience,
        "champLevel": champLevel,
        "championId": championId,
        "championName": championName,
        "championTransform": championTransform,
        "commandPings": commandPings,
        "consumablesPurchased": consumablesPurchased,
        "damageDealtToBuildings": damageDealtToBuildings,
        "damageDealtToObjectives": damageDealtToObjectives,
        "damageDealtToTurrets": damageDealtToTurrets,
        "damageSelfMitigated": damageSelfMitigated,
        "dangerPings": dangerPings,
        "deaths": deaths,
        "detectorWardsPlaced": detectorWardsPlaced,
        "doubleKills": doubleKills,
        "dragonKills": dragonKills,
        "eligibleForProgression": eligibleForProgression,
        "enemyMissingPings": enemyMissingPings,
        "enemyVisionPings": enemyVisionPings,
        "firstBloodAssist": firstBloodAssist,
        "firstBloodKill": firstBloodKill,
        "firstTowerAssist": firstTowerAssist,
        "firstTowerKill": firstTowerKill,
        "gameEndedInEarlySurrender": gameEndedInEarlySurrender,
        "gameEndedInSurrender": gameEndedInSurrender,
        "getBackPings": getBackPings,
        "goldEarned": goldEarned,
        "goldSpent": goldSpent,
        "holdPings": holdPings,
        "individualPosition": individualPosition,
        "inhibitorKills": inhibitorKills,
        "inhibitorTakedowns": inhibitorTakedowns,
        "inhibitorsLost": inhibitorsLost,
        "item0": item0,
        "item1": item1,
        "item2": item2,
        "item3": item3,
        "item4": item4,
        "item5": item5,
        "item6": item6,
        "itemsPurchased": itemsPurchased,
        "killingSprees": killingSprees,
        "kills": kills,
        "lane": lane,
        "largestCriticalStrike": largestCriticalStrike,
        "largestKillingSpree": largestKillingSpree,
        "largestMultiKill": largestMultiKill,
        "longestTimeSpentLiving": longestTimeSpentLiving,
        "magicDamageDealt": magicDamageDealt,
        "magicDamageDealtToChampions": magicDamageDealtToChampions,
        "magicDamageTaken": magicDamageTaken,
        "missions": Map.from(missions!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "needVisionPings": needVisionPings,
        "neutralMinionsKilled": neutralMinionsKilled,
        "nexusKills": nexusKills,
        "nexusLost": nexusLost,
        "nexusTakedowns": nexusTakedowns,
        "objectivesStolen": objectivesStolen,
        "objectivesStolenAssists": objectivesStolenAssists,
        "onMyWayPings": onMyWayPings,
        "participantId": participantId,
        "pentaKills": pentaKills,
        "perks": perks?.toJson(),
        "physicalDamageDealt": physicalDamageDealt,
        "physicalDamageDealtToChampions": physicalDamageDealtToChampions,
        "physicalDamageTaken": physicalDamageTaken,
        "placement": placement,
        "playerAugment1": playerAugment1,
        "playerAugment2": playerAugment2,
        "playerAugment3": playerAugment3,
        "playerAugment4": playerAugment4,
        "playerAugment5": playerAugment5,
        "playerAugment6": playerAugment6,
        "playerSubteamId": playerSubteamId,
        "profileIcon": profileIcon,
        "pushPings": pushPings,
        "puuid": puuid,
        "quadraKills": quadraKills,
        "retreatPings": retreatPings,
        "riotIdGameName": riotIdGameName,
        "riotIdTagline": riotIdTagline,
        "role": role,
        "sightWardsBoughtInGame": sightWardsBoughtInGame,
        "spell1Casts": spell1Casts,
        "spell2Casts": spell2Casts,
        "spell3Casts": spell3Casts,
        "spell4Casts": spell4Casts,
        "subteamPlacement": subteamPlacement,
        "summoner1Casts": summoner1Casts,
        "summoner1Id": summoner1Id,
        "summoner2Casts": summoner2Casts,
        "summoner2Id": summoner2Id,
        "summonerId": summonerId,
        "summonerLevel": summonerLevel,
        "summonerName": summonerName,
        "teamEarlySurrendered": teamEarlySurrendered,
        "teamId": teamId,
        "teamPosition": teamPosition,
        "timeCCingOthers": timeCCingOthers,
        "timePlayed": timePlayed,
        "totalAllyJungleMinionsKilled": totalAllyJungleMinionsKilled,
        "totalDamageDealt": totalDamageDealt,
        "totalDamageDealtToChampions": totalDamageDealtToChampions,
        "totalDamageShieldedOnTeammates": totalDamageShieldedOnTeammates,
        "totalDamageTaken": totalDamageTaken,
        "totalEnemyJungleMinionsKilled": totalEnemyJungleMinionsKilled,
        "totalHeal": totalHeal,
        "totalHealsOnTeammates": totalHealsOnTeammates,
        "totalMinionsKilled": totalMinionsKilled,
        "totalTimeCCDealt": totalTimeCcDealt,
        "totalTimeSpentDead": totalTimeSpentDead,
        "totalUnitsHealed": totalUnitsHealed,
        "tripleKills": tripleKills,
        "trueDamageDealt": trueDamageDealt,
        "trueDamageDealtToChampions": trueDamageDealtToChampions,
        "trueDamageTaken": trueDamageTaken,
        "turretKills": turretKills,
        "turretTakedowns": turretTakedowns,
        "turretsLost": turretsLost,
        "unrealKills": unrealKills,
        "visionClearedPings": visionClearedPings,
        "visionScore": visionScore,
        "visionWardsBoughtInGame": visionWardsBoughtInGame,
        "wardsKilled": wardsKilled,
        "wardsPlaced": wardsPlaced,
        "win": win,
    };
}

class Challenges {
    int? the12AssistStreakCount;
    double? healFromMapSources;
    int? infernalScalePickup;
    int? swarmDefeatAatrox;
    int? swarmDefeatBriar;
    int? swarmDefeatMiniBosses;
    int? swarmEvolveWeapon;
    int? swarmHave3Passives;
    int? swarmKillEnemy;
    int? swarmPickupGold;
    int? swarmReachLevel50;
    int? swarmSurvive15Min;
    int? swarmWinWith5EvolvedWeapons;
    int? abilityUses;
    int? acesBefore15Minutes;
    int? alliedJungleMonsterKills;
    int? baronTakedowns;
    int? blastConeOppositeOpponentCount;
    double? bountyGold;
    int? buffsStolen;
    int? completeSupportQuestInTime;
    int? controlWardsPlaced;
    double? damagePerMinute;
    double? damageTakenOnTeamPercentage;
    int? dancedWithRiftHerald;
    int? deathsByEnemyChamps;
    int? dodgeSkillShotsSmallWindow;
    int? doubleAces;
    int? dragonTakedowns;
    double? earliestBaron;
    int? earlyLaningPhaseGoldExpAdvantage;
    double? effectiveHealAndShielding;
    int? elderDragonKillsWithOpposingSoul;
    int? elderDragonMultikills;
    int? enemyChampionImmobilizations;
    int? enemyJungleMonsterKills;
    int? epicMonsterKillsNearEnemyJungler;
    int? epicMonsterKillsWithin30SecondsOfSpawn;
    int? epicMonsterSteals;
    int? epicMonsterStolenWithoutSmite;
    int? firstTurretKilled;
    int? fistBumpParticipation;
    int? flawlessAces;
    int? fullTeamTakedown;
    double? gameLength;
    int? getTakedownsInAllLanesEarlyJungleAsLaner;
    double? goldPerMinute;
    int? hadOpenNexus;
    int? immobilizeAndKillWithAlly;
    int? initialBuffCount;
    int? initialCrabCount;
    double? jungleCsBefore10Minutes;
    int? junglerTakedownsNearDamagedEpicMonster;
    int? kTurretsDestroyedBeforePlatesFall;
    double? kda;
    int? killAfterHiddenWithAlly;
    double? killParticipation;
    int? killedChampTookFullTeamDamageSurvived;
    int? killingSprees;
    int? killsNearEnemyTurret;
    int? killsOnOtherLanesEarlyJungleAsLaner;
    int? killsOnRecentlyHealedByAramPack;
    int? killsUnderOwnTurret;
    int? killsWithHelpFromEpicMonster;
    int? knockEnemyIntoTeamAndKill;
    int? landSkillShotsEarlyGame;
    int? laneMinionsFirst10Minutes;
    int? laningPhaseGoldExpAdvantage;
    int? legendaryCount;
    List<int>? legendaryItemUsed;
    int? lostAnInhibitor;
    double? maxCsAdvantageOnLaneOpponent;
    int? maxKillDeficit;
    int? maxLevelLeadLaneOpponent;
    int? mejaisFullStackInTime;
    double? moreEnemyJungleThanOpponent;
    int? multiKillOneSpell;
    int? multiTurretRiftHeraldCount;
    int? multikills;
    int? multikillsAfterAggressiveFlash;
    int? outerTurretExecutesBefore10Minutes;
    int? outnumberedKills;
    int? outnumberedNexusKill;
    int? perfectDragonSoulsTaken;
    int? perfectGame;
    int? pickKillWithAlly;
    int? playedChampSelectPosition;
    int? poroExplosions;
    int? quickCleanse;
    int? quickFirstTurret;
    int? quickSoloKills;
    int? riftHeraldTakedowns;
    int? saveAllyFromDeath;
    int? scuttleCrabKills;
    int? skillshotsDodged;
    int? skillshotsHit;
    int? snowballsHit;
    int? soloBaronKills;
    int? soloKills;
    int? soloTurretsLategame;
    int? stealthWardsPlaced;
    int? survivedSingleDigitHpCount;
    int? survivedThreeImmobilizesInFight;
    int? takedownOnFirstTurret;
    int? takedowns;
    int? takedownsAfterGainingLevelAdvantage;
    int? takedownsBeforeJungleMinionSpawn;
    int? takedownsFirstXMinutes;
    int? takedownsInAlcove;
    int? takedownsInEnemyFountain;
    int? teamBaronKills;
    double? teamDamagePercentage;
    int? teamElderDragonKills;
    int? teamRiftHeraldKills;
    int? tookLargeDamageSurvived;
    int? turretPlatesTaken;
    int? turretTakedowns;
    int? turretsTakenWithRiftHerald;
    int? twentyMinionsIn3SecondsCount;
    int? twoWardsOneSweeperCount;
    int? unseenRecalls;
    double? visionScoreAdvantageLaneOpponent;
    double? visionScorePerMinute;
    int? voidMonsterKill;
    int? wardTakedowns;
    int? wardTakedownsBefore20M;
    int? wardsGuarded;
    double? earliestDragonTakedown;
    int? junglerKillsEarlyJungle;
    int? killsOnLanersEarlyJungleAsJungler;
    double? shortestTimeToAceFromFirstTakedown;
    double? controlWardTimeCoverageInRiverOrEnemyHalf;
    double? firstTurretKilledTime;
    int? highestCrowdControlScore;
    int? highestChampionDamage;
    int? highestWardKills;

    Challenges({
        this.the12AssistStreakCount,
        this.healFromMapSources,
        this.infernalScalePickup,
        this.swarmDefeatAatrox,
        this.swarmDefeatBriar,
        this.swarmDefeatMiniBosses,
        this.swarmEvolveWeapon,
        this.swarmHave3Passives,
        this.swarmKillEnemy,
        this.swarmPickupGold,
        this.swarmReachLevel50,
        this.swarmSurvive15Min,
        this.swarmWinWith5EvolvedWeapons,
        this.abilityUses,
        this.acesBefore15Minutes,
        this.alliedJungleMonsterKills,
        this.baronTakedowns,
        this.blastConeOppositeOpponentCount,
        this.bountyGold,
        this.buffsStolen,
        this.completeSupportQuestInTime,
        this.controlWardsPlaced,
        this.damagePerMinute,
        this.damageTakenOnTeamPercentage,
        this.dancedWithRiftHerald,
        this.deathsByEnemyChamps,
        this.dodgeSkillShotsSmallWindow,
        this.doubleAces,
        this.dragonTakedowns,
        this.earliestBaron,
        this.earlyLaningPhaseGoldExpAdvantage,
        this.effectiveHealAndShielding,
        this.elderDragonKillsWithOpposingSoul,
        this.elderDragonMultikills,
        this.enemyChampionImmobilizations,
        this.enemyJungleMonsterKills,
        this.epicMonsterKillsNearEnemyJungler,
        this.epicMonsterKillsWithin30SecondsOfSpawn,
        this.epicMonsterSteals,
        this.epicMonsterStolenWithoutSmite,
        this.firstTurretKilled,
        this.fistBumpParticipation,
        this.flawlessAces,
        this.fullTeamTakedown,
        this.gameLength,
        this.getTakedownsInAllLanesEarlyJungleAsLaner,
        this.goldPerMinute,
        this.hadOpenNexus,
        this.immobilizeAndKillWithAlly,
        this.initialBuffCount,
        this.initialCrabCount,
        this.jungleCsBefore10Minutes,
        this.junglerTakedownsNearDamagedEpicMonster,
        this.kTurretsDestroyedBeforePlatesFall,
        this.kda,
        this.killAfterHiddenWithAlly,
        this.killParticipation,
        this.killedChampTookFullTeamDamageSurvived,
        this.killingSprees,
        this.killsNearEnemyTurret,
        this.killsOnOtherLanesEarlyJungleAsLaner,
        this.killsOnRecentlyHealedByAramPack,
        this.killsUnderOwnTurret,
        this.killsWithHelpFromEpicMonster,
        this.knockEnemyIntoTeamAndKill,
        this.landSkillShotsEarlyGame,
        this.laneMinionsFirst10Minutes,
        this.laningPhaseGoldExpAdvantage,
        this.legendaryCount,
        this.legendaryItemUsed,
        this.lostAnInhibitor,
        this.maxCsAdvantageOnLaneOpponent,
        this.maxKillDeficit,
        this.maxLevelLeadLaneOpponent,
        this.mejaisFullStackInTime,
        this.moreEnemyJungleThanOpponent,
        this.multiKillOneSpell,
        this.multiTurretRiftHeraldCount,
        this.multikills,
        this.multikillsAfterAggressiveFlash,
        this.outerTurretExecutesBefore10Minutes,
        this.outnumberedKills,
        this.outnumberedNexusKill,
        this.perfectDragonSoulsTaken,
        this.perfectGame,
        this.pickKillWithAlly,
        this.playedChampSelectPosition,
        this.poroExplosions,
        this.quickCleanse,
        this.quickFirstTurret,
        this.quickSoloKills,
        this.riftHeraldTakedowns,
        this.saveAllyFromDeath,
        this.scuttleCrabKills,
        this.skillshotsDodged,
        this.skillshotsHit,
        this.snowballsHit,
        this.soloBaronKills,
        this.soloKills,
        this.soloTurretsLategame,
        this.stealthWardsPlaced,
        this.survivedSingleDigitHpCount,
        this.survivedThreeImmobilizesInFight,
        this.takedownOnFirstTurret,
        this.takedowns,
        this.takedownsAfterGainingLevelAdvantage,
        this.takedownsBeforeJungleMinionSpawn,
        this.takedownsFirstXMinutes,
        this.takedownsInAlcove,
        this.takedownsInEnemyFountain,
        this.teamBaronKills,
        this.teamDamagePercentage,
        this.teamElderDragonKills,
        this.teamRiftHeraldKills,
        this.tookLargeDamageSurvived,
        this.turretPlatesTaken,
        this.turretTakedowns,
        this.turretsTakenWithRiftHerald,
        this.twentyMinionsIn3SecondsCount,
        this.twoWardsOneSweeperCount,
        this.unseenRecalls,
        this.visionScoreAdvantageLaneOpponent,
        this.visionScorePerMinute,
        this.voidMonsterKill,
        this.wardTakedowns,
        this.wardTakedownsBefore20M,
        this.wardsGuarded,
        this.earliestDragonTakedown,
        this.junglerKillsEarlyJungle,
        this.killsOnLanersEarlyJungleAsJungler,
        this.shortestTimeToAceFromFirstTakedown,
        this.controlWardTimeCoverageInRiverOrEnemyHalf,
        this.firstTurretKilledTime,
        this.highestCrowdControlScore,
        this.highestChampionDamage,
        this.highestWardKills,
    });

    factory Challenges.fromRawJson(String str) => Challenges.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Challenges.fromJson(Map<String, dynamic> json) => Challenges(
        the12AssistStreakCount: json["12AssistStreakCount"],
        healFromMapSources: json["HealFromMapSources"]?.toDouble(),
        infernalScalePickup: json["InfernalScalePickup"],
        swarmDefeatAatrox: json["SWARM_DefeatAatrox"],
        swarmDefeatBriar: json["SWARM_DefeatBriar"],
        swarmDefeatMiniBosses: json["SWARM_DefeatMiniBosses"],
        swarmEvolveWeapon: json["SWARM_EvolveWeapon"],
        swarmHave3Passives: json["SWARM_Have3Passives"],
        swarmKillEnemy: json["SWARM_KillEnemy"],
        swarmPickupGold: json["SWARM_PickupGold"],
        swarmReachLevel50: json["SWARM_ReachLevel50"],
        swarmSurvive15Min: json["SWARM_Survive15Min"],
        swarmWinWith5EvolvedWeapons: json["SWARM_WinWith5EvolvedWeapons"],
        abilityUses: json["abilityUses"],
        acesBefore15Minutes: json["acesBefore15Minutes"],
        alliedJungleMonsterKills: json["alliedJungleMonsterKills"],
        baronTakedowns: json["baronTakedowns"],
        blastConeOppositeOpponentCount: json["blastConeOppositeOpponentCount"],
        bountyGold: json["bountyGold"]?.toDouble(),
        buffsStolen: json["buffsStolen"],
        completeSupportQuestInTime: json["completeSupportQuestInTime"],
        controlWardsPlaced: json["controlWardsPlaced"],
        damagePerMinute: json["damagePerMinute"]?.toDouble(),
        damageTakenOnTeamPercentage: json["damageTakenOnTeamPercentage"]?.toDouble(),
        dancedWithRiftHerald: json["dancedWithRiftHerald"],
        deathsByEnemyChamps: json["deathsByEnemyChamps"],
        dodgeSkillShotsSmallWindow: json["dodgeSkillShotsSmallWindow"],
        doubleAces: json["doubleAces"],
        dragonTakedowns: json["dragonTakedowns"],
        earliestBaron: json["earliestBaron"]?.toDouble(),
        earlyLaningPhaseGoldExpAdvantage: json["earlyLaningPhaseGoldExpAdvantage"],
        effectiveHealAndShielding: json["effectiveHealAndShielding"]?.toDouble(),
        elderDragonKillsWithOpposingSoul: json["elderDragonKillsWithOpposingSoul"],
        elderDragonMultikills: json["elderDragonMultikills"],
        enemyChampionImmobilizations: json["enemyChampionImmobilizations"],
        enemyJungleMonsterKills: json["enemyJungleMonsterKills"],
        epicMonsterKillsNearEnemyJungler: json["epicMonsterKillsNearEnemyJungler"],
        epicMonsterKillsWithin30SecondsOfSpawn: json["epicMonsterKillsWithin30SecondsOfSpawn"],
        epicMonsterSteals: json["epicMonsterSteals"],
        epicMonsterStolenWithoutSmite: json["epicMonsterStolenWithoutSmite"],
        firstTurretKilled: json["firstTurretKilled"],
        fistBumpParticipation: json["fistBumpParticipation"],
        flawlessAces: json["flawlessAces"],
        fullTeamTakedown: json["fullTeamTakedown"],
        gameLength: json["gameLength"]?.toDouble(),
        getTakedownsInAllLanesEarlyJungleAsLaner: json["getTakedownsInAllLanesEarlyJungleAsLaner"],
        goldPerMinute: json["goldPerMinute"]?.toDouble(),
        hadOpenNexus: json["hadOpenNexus"],
        immobilizeAndKillWithAlly: json["immobilizeAndKillWithAlly"],
        initialBuffCount: json["initialBuffCount"],
        initialCrabCount: json["initialCrabCount"],
        jungleCsBefore10Minutes: json["jungleCsBefore10Minutes"]?.toDouble(),
        junglerTakedownsNearDamagedEpicMonster: json["junglerTakedownsNearDamagedEpicMonster"],
        kTurretsDestroyedBeforePlatesFall: json["kTurretsDestroyedBeforePlatesFall"],
        kda: json["kda"]?.toDouble(),
        killAfterHiddenWithAlly: json["killAfterHiddenWithAlly"],
        killParticipation: json["killParticipation"]?.toDouble(),
        killedChampTookFullTeamDamageSurvived: json["killedChampTookFullTeamDamageSurvived"],
        killingSprees: json["killingSprees"],
        killsNearEnemyTurret: json["killsNearEnemyTurret"],
        killsOnOtherLanesEarlyJungleAsLaner: json["killsOnOtherLanesEarlyJungleAsLaner"],
        killsOnRecentlyHealedByAramPack: json["killsOnRecentlyHealedByAramPack"],
        killsUnderOwnTurret: json["killsUnderOwnTurret"],
        killsWithHelpFromEpicMonster: json["killsWithHelpFromEpicMonster"],
        knockEnemyIntoTeamAndKill: json["knockEnemyIntoTeamAndKill"],
        landSkillShotsEarlyGame: json["landSkillShotsEarlyGame"],
        laneMinionsFirst10Minutes: json["laneMinionsFirst10Minutes"],
        laningPhaseGoldExpAdvantage: json["laningPhaseGoldExpAdvantage"],
        legendaryCount: json["legendaryCount"],
        legendaryItemUsed: json["legendaryItemUsed"] == null ? [] : List<int>.from(json["legendaryItemUsed"]!.map((x) => x)),
        lostAnInhibitor: json["lostAnInhibitor"],
        maxCsAdvantageOnLaneOpponent: json["maxCsAdvantageOnLaneOpponent"]?.toDouble(),
        maxKillDeficit: json["maxKillDeficit"],
        maxLevelLeadLaneOpponent: json["maxLevelLeadLaneOpponent"],
        mejaisFullStackInTime: json["mejaisFullStackInTime"],
        moreEnemyJungleThanOpponent: json["moreEnemyJungleThanOpponent"]?.toDouble(),
        multiKillOneSpell: json["multiKillOneSpell"],
        multiTurretRiftHeraldCount: json["multiTurretRiftHeraldCount"],
        multikills: json["multikills"],
        multikillsAfterAggressiveFlash: json["multikillsAfterAggressiveFlash"],
        outerTurretExecutesBefore10Minutes: json["outerTurretExecutesBefore10Minutes"],
        outnumberedKills: json["outnumberedKills"],
        outnumberedNexusKill: json["outnumberedNexusKill"],
        perfectDragonSoulsTaken: json["perfectDragonSoulsTaken"],
        perfectGame: json["perfectGame"],
        pickKillWithAlly: json["pickKillWithAlly"],
        playedChampSelectPosition: json["playedChampSelectPosition"],
        poroExplosions: json["poroExplosions"],
        quickCleanse: json["quickCleanse"],
        quickFirstTurret: json["quickFirstTurret"],
        quickSoloKills: json["quickSoloKills"],
        riftHeraldTakedowns: json["riftHeraldTakedowns"],
        saveAllyFromDeath: json["saveAllyFromDeath"],
        scuttleCrabKills: json["scuttleCrabKills"],
        skillshotsDodged: json["skillshotsDodged"],
        skillshotsHit: json["skillshotsHit"],
        snowballsHit: json["snowballsHit"],
        soloBaronKills: json["soloBaronKills"],
        soloKills: json["soloKills"],
        soloTurretsLategame: json["soloTurretsLategame"],
        stealthWardsPlaced: json["stealthWardsPlaced"],
        survivedSingleDigitHpCount: json["survivedSingleDigitHpCount"],
        survivedThreeImmobilizesInFight: json["survivedThreeImmobilizesInFight"],
        takedownOnFirstTurret: json["takedownOnFirstTurret"],
        takedowns: json["takedowns"],
        takedownsAfterGainingLevelAdvantage: json["takedownsAfterGainingLevelAdvantage"],
        takedownsBeforeJungleMinionSpawn: json["takedownsBeforeJungleMinionSpawn"],
        takedownsFirstXMinutes: json["takedownsFirstXMinutes"],
        takedownsInAlcove: json["takedownsInAlcove"],
        takedownsInEnemyFountain: json["takedownsInEnemyFountain"],
        teamBaronKills: json["teamBaronKills"],
        teamDamagePercentage: json["teamDamagePercentage"]?.toDouble(),
        teamElderDragonKills: json["teamElderDragonKills"],
        teamRiftHeraldKills: json["teamRiftHeraldKills"],
        tookLargeDamageSurvived: json["tookLargeDamageSurvived"],
        turretPlatesTaken: json["turretPlatesTaken"],
        turretTakedowns: json["turretTakedowns"],
        turretsTakenWithRiftHerald: json["turretsTakenWithRiftHerald"],
        twentyMinionsIn3SecondsCount: json["twentyMinionsIn3SecondsCount"],
        twoWardsOneSweeperCount: json["twoWardsOneSweeperCount"],
        unseenRecalls: json["unseenRecalls"],
        visionScoreAdvantageLaneOpponent: json["visionScoreAdvantageLaneOpponent"]?.toDouble(),
        visionScorePerMinute: json["visionScorePerMinute"]?.toDouble(),
        voidMonsterKill: json["voidMonsterKill"],
        wardTakedowns: json["wardTakedowns"],
        wardTakedownsBefore20M: json["wardTakedownsBefore20M"],
        wardsGuarded: json["wardsGuarded"],
        earliestDragonTakedown: json["earliestDragonTakedown"]?.toDouble(),
        junglerKillsEarlyJungle: json["junglerKillsEarlyJungle"],
        killsOnLanersEarlyJungleAsJungler: json["killsOnLanersEarlyJungleAsJungler"],
        shortestTimeToAceFromFirstTakedown: json["shortestTimeToAceFromFirstTakedown"]?.toDouble(),
        controlWardTimeCoverageInRiverOrEnemyHalf: json["controlWardTimeCoverageInRiverOrEnemyHalf"]?.toDouble(),
        firstTurretKilledTime: json["firstTurretKilledTime"]?.toDouble(),
        highestCrowdControlScore: json["highestCrowdControlScore"],
        highestChampionDamage: json["highestChampionDamage"],
        highestWardKills: json["highestWardKills"],
    );

    Map<String, dynamic> toJson() => {
        "12AssistStreakCount": the12AssistStreakCount,
        "HealFromMapSources": healFromMapSources,
        "InfernalScalePickup": infernalScalePickup,
        "SWARM_DefeatAatrox": swarmDefeatAatrox,
        "SWARM_DefeatBriar": swarmDefeatBriar,
        "SWARM_DefeatMiniBosses": swarmDefeatMiniBosses,
        "SWARM_EvolveWeapon": swarmEvolveWeapon,
        "SWARM_Have3Passives": swarmHave3Passives,
        "SWARM_KillEnemy": swarmKillEnemy,
        "SWARM_PickupGold": swarmPickupGold,
        "SWARM_ReachLevel50": swarmReachLevel50,
        "SWARM_Survive15Min": swarmSurvive15Min,
        "SWARM_WinWith5EvolvedWeapons": swarmWinWith5EvolvedWeapons,
        "abilityUses": abilityUses,
        "acesBefore15Minutes": acesBefore15Minutes,
        "alliedJungleMonsterKills": alliedJungleMonsterKills,
        "baronTakedowns": baronTakedowns,
        "blastConeOppositeOpponentCount": blastConeOppositeOpponentCount,
        "bountyGold": bountyGold,
        "buffsStolen": buffsStolen,
        "completeSupportQuestInTime": completeSupportQuestInTime,
        "controlWardsPlaced": controlWardsPlaced,
        "damagePerMinute": damagePerMinute,
        "damageTakenOnTeamPercentage": damageTakenOnTeamPercentage,
        "dancedWithRiftHerald": dancedWithRiftHerald,
        "deathsByEnemyChamps": deathsByEnemyChamps,
        "dodgeSkillShotsSmallWindow": dodgeSkillShotsSmallWindow,
        "doubleAces": doubleAces,
        "dragonTakedowns": dragonTakedowns,
        "earliestBaron": earliestBaron,
        "earlyLaningPhaseGoldExpAdvantage": earlyLaningPhaseGoldExpAdvantage,
        "effectiveHealAndShielding": effectiveHealAndShielding,
        "elderDragonKillsWithOpposingSoul": elderDragonKillsWithOpposingSoul,
        "elderDragonMultikills": elderDragonMultikills,
        "enemyChampionImmobilizations": enemyChampionImmobilizations,
        "enemyJungleMonsterKills": enemyJungleMonsterKills,
        "epicMonsterKillsNearEnemyJungler": epicMonsterKillsNearEnemyJungler,
        "epicMonsterKillsWithin30SecondsOfSpawn": epicMonsterKillsWithin30SecondsOfSpawn,
        "epicMonsterSteals": epicMonsterSteals,
        "epicMonsterStolenWithoutSmite": epicMonsterStolenWithoutSmite,
        "firstTurretKilled": firstTurretKilled,
        "fistBumpParticipation": fistBumpParticipation,
        "flawlessAces": flawlessAces,
        "fullTeamTakedown": fullTeamTakedown,
        "gameLength": gameLength,
        "getTakedownsInAllLanesEarlyJungleAsLaner": getTakedownsInAllLanesEarlyJungleAsLaner,
        "goldPerMinute": goldPerMinute,
        "hadOpenNexus": hadOpenNexus,
        "immobilizeAndKillWithAlly": immobilizeAndKillWithAlly,
        "initialBuffCount": initialBuffCount,
        "initialCrabCount": initialCrabCount,
        "jungleCsBefore10Minutes": jungleCsBefore10Minutes,
        "junglerTakedownsNearDamagedEpicMonster": junglerTakedownsNearDamagedEpicMonster,
        "kTurretsDestroyedBeforePlatesFall": kTurretsDestroyedBeforePlatesFall,
        "kda": kda,
        "killAfterHiddenWithAlly": killAfterHiddenWithAlly,
        "killParticipation": killParticipation,
        "killedChampTookFullTeamDamageSurvived": killedChampTookFullTeamDamageSurvived,
        "killingSprees": killingSprees,
        "killsNearEnemyTurret": killsNearEnemyTurret,
        "killsOnOtherLanesEarlyJungleAsLaner": killsOnOtherLanesEarlyJungleAsLaner,
        "killsOnRecentlyHealedByAramPack": killsOnRecentlyHealedByAramPack,
        "killsUnderOwnTurret": killsUnderOwnTurret,
        "killsWithHelpFromEpicMonster": killsWithHelpFromEpicMonster,
        "knockEnemyIntoTeamAndKill": knockEnemyIntoTeamAndKill,
        "landSkillShotsEarlyGame": landSkillShotsEarlyGame,
        "laneMinionsFirst10Minutes": laneMinionsFirst10Minutes,
        "laningPhaseGoldExpAdvantage": laningPhaseGoldExpAdvantage,
        "legendaryCount": legendaryCount,
        "legendaryItemUsed": legendaryItemUsed == null ? [] : List<dynamic>.from(legendaryItemUsed!.map((x) => x)),
        "lostAnInhibitor": lostAnInhibitor,
        "maxCsAdvantageOnLaneOpponent": maxCsAdvantageOnLaneOpponent,
        "maxKillDeficit": maxKillDeficit,
        "maxLevelLeadLaneOpponent": maxLevelLeadLaneOpponent,
        "mejaisFullStackInTime": mejaisFullStackInTime,
        "moreEnemyJungleThanOpponent": moreEnemyJungleThanOpponent,
        "multiKillOneSpell": multiKillOneSpell,
        "multiTurretRiftHeraldCount": multiTurretRiftHeraldCount,
        "multikills": multikills,
        "multikillsAfterAggressiveFlash": multikillsAfterAggressiveFlash,
        "outerTurretExecutesBefore10Minutes": outerTurretExecutesBefore10Minutes,
        "outnumberedKills": outnumberedKills,
        "outnumberedNexusKill": outnumberedNexusKill,
        "perfectDragonSoulsTaken": perfectDragonSoulsTaken,
        "perfectGame": perfectGame,
        "pickKillWithAlly": pickKillWithAlly,
        "playedChampSelectPosition": playedChampSelectPosition,
        "poroExplosions": poroExplosions,
        "quickCleanse": quickCleanse,
        "quickFirstTurret": quickFirstTurret,
        "quickSoloKills": quickSoloKills,
        "riftHeraldTakedowns": riftHeraldTakedowns,
        "saveAllyFromDeath": saveAllyFromDeath,
        "scuttleCrabKills": scuttleCrabKills,
        "skillshotsDodged": skillshotsDodged,
        "skillshotsHit": skillshotsHit,
        "snowballsHit": snowballsHit,
        "soloBaronKills": soloBaronKills,
        "soloKills": soloKills,
        "soloTurretsLategame": soloTurretsLategame,
        "stealthWardsPlaced": stealthWardsPlaced,
        "survivedSingleDigitHpCount": survivedSingleDigitHpCount,
        "survivedThreeImmobilizesInFight": survivedThreeImmobilizesInFight,
        "takedownOnFirstTurret": takedownOnFirstTurret,
        "takedowns": takedowns,
        "takedownsAfterGainingLevelAdvantage": takedownsAfterGainingLevelAdvantage,
        "takedownsBeforeJungleMinionSpawn": takedownsBeforeJungleMinionSpawn,
        "takedownsFirstXMinutes": takedownsFirstXMinutes,
        "takedownsInAlcove": takedownsInAlcove,
        "takedownsInEnemyFountain": takedownsInEnemyFountain,
        "teamBaronKills": teamBaronKills,
        "teamDamagePercentage": teamDamagePercentage,
        "teamElderDragonKills": teamElderDragonKills,
        "teamRiftHeraldKills": teamRiftHeraldKills,
        "tookLargeDamageSurvived": tookLargeDamageSurvived,
        "turretPlatesTaken": turretPlatesTaken,
        "turretTakedowns": turretTakedowns,
        "turretsTakenWithRiftHerald": turretsTakenWithRiftHerald,
        "twentyMinionsIn3SecondsCount": twentyMinionsIn3SecondsCount,
        "twoWardsOneSweeperCount": twoWardsOneSweeperCount,
        "unseenRecalls": unseenRecalls,
        "visionScoreAdvantageLaneOpponent": visionScoreAdvantageLaneOpponent,
        "visionScorePerMinute": visionScorePerMinute,
        "voidMonsterKill": voidMonsterKill,
        "wardTakedowns": wardTakedowns,
        "wardTakedownsBefore20M": wardTakedownsBefore20M,
        "wardsGuarded": wardsGuarded,
        "earliestDragonTakedown": earliestDragonTakedown,
        "junglerKillsEarlyJungle": junglerKillsEarlyJungle,
        "killsOnLanersEarlyJungleAsJungler": killsOnLanersEarlyJungleAsJungler,
        "shortestTimeToAceFromFirstTakedown": shortestTimeToAceFromFirstTakedown,
        "controlWardTimeCoverageInRiverOrEnemyHalf": controlWardTimeCoverageInRiverOrEnemyHalf,
        "firstTurretKilledTime": firstTurretKilledTime,
        "highestCrowdControlScore": highestCrowdControlScore,
        "highestChampionDamage": highestChampionDamage,
        "highestWardKills": highestWardKills,
    };
}

class Perks {
    StatPerks? statPerks;
    List<Style>? styles;

    Perks({
        this.statPerks,
        this.styles,
    });

    factory Perks.fromRawJson(String str) => Perks.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Perks.fromJson(Map<String, dynamic> json) => Perks(
        statPerks: json["statPerks"] == null ? null : StatPerks.fromJson(json["statPerks"]),
        styles: json["styles"] == null ? [] : List<Style>.from(json["styles"]!.map((x) => Style.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "statPerks": statPerks?.toJson(),
        "styles": styles == null ? [] : List<dynamic>.from(styles!.map((x) => x.toJson())),
    };
}

class StatPerks {
    int? defense;
    int? flex;
    int? offense;

    StatPerks({
        this.defense,
        this.flex,
        this.offense,
    });

    factory StatPerks.fromRawJson(String str) => StatPerks.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory StatPerks.fromJson(Map<String, dynamic> json) => StatPerks(
        defense: json["defense"],
        flex: json["flex"],
        offense: json["offense"],
    );

    Map<String, dynamic> toJson() => {
        "defense": defense,
        "flex": flex,
        "offense": offense,
    };
}

class Style {
    Description? description;
    List<Selection>? selections;
    int? style;

    Style({
        this.description,
        this.selections,
        this.style,
    });

    factory Style.fromRawJson(String str) => Style.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Style.fromJson(Map<String, dynamic> json) => Style(
        description: descriptionValues.map[json["description"]]!,
        selections: json["selections"] == null ? [] : List<Selection>.from(json["selections"]!.map((x) => Selection.fromJson(x))),
        style: json["style"],
    );

    Map<String, dynamic> toJson() => {
        "description": descriptionValues.reverse[description],
        "selections": selections == null ? [] : List<dynamic>.from(selections!.map((x) => x.toJson())),
        "style": style,
    };
}

enum Description {
    PRIMARY_STYLE,
    SUB_STYLE
}

final descriptionValues = EnumValues({
    "primaryStyle": Description.PRIMARY_STYLE,
    "subStyle": Description.SUB_STYLE
});

class Selection {
    int? perk;
    int? var1;
    int? var2;
    int? var3;

    Selection({
        this.perk,
        this.var1,
        this.var2,
        this.var3,
    });

    factory Selection.fromRawJson(String str) => Selection.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Selection.fromJson(Map<String, dynamic> json) => Selection(
        perk: json["perk"],
        var1: json["var1"],
        var2: json["var2"],
        var3: json["var3"],
    );

    Map<String, dynamic> toJson() => {
        "perk": perk,
        "var1": var1,
        "var2": var2,
        "var3": var3,
    };
}

class Team {
    List<Ban>? bans;
    Feats? feats;
    Objectives? objectives;
    int? teamId;
    bool? win;

    Team({
        this.bans,
        this.feats,
        this.objectives,
        this.teamId,
        this.win,
    });

    factory Team.fromRawJson(String str) => Team.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Team.fromJson(Map<String, dynamic> json) => Team(
        bans: json["bans"] == null ? [] : List<Ban>.from(json["bans"]!.map((x) => Ban.fromJson(x))),
        feats: json["feats"] == null ? null : Feats.fromJson(json["feats"]),
        objectives: json["objectives"] == null ? null : Objectives.fromJson(json["objectives"]),
        teamId: json["teamId"],
        win: json["win"],
    );

    Map<String, dynamic> toJson() => {
        "bans": bans == null ? [] : List<dynamic>.from(bans!.map((x) => x.toJson())),
        "feats": feats?.toJson(),
        "objectives": objectives?.toJson(),
        "teamId": teamId,
        "win": win,
    };
}

class Ban {
    int? championId;
    int? pickTurn;

    Ban({
        this.championId,
        this.pickTurn,
    });

    factory Ban.fromRawJson(String str) => Ban.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Ban.fromJson(Map<String, dynamic> json) => Ban(
        championId: json["championId"],
        pickTurn: json["pickTurn"],
    );

    Map<String, dynamic> toJson() => {
        "championId": championId,
        "pickTurn": pickTurn,
    };
}

class Feats {
    EpicMonsterKill? epicMonsterKill;
    EpicMonsterKill? firstBlood;
    EpicMonsterKill? firstTurret;

    Feats({
        this.epicMonsterKill,
        this.firstBlood,
        this.firstTurret,
    });

    factory Feats.fromRawJson(String str) => Feats.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Feats.fromJson(Map<String, dynamic> json) => Feats(
        epicMonsterKill: json["EPIC_MONSTER_KILL"] == null ? null : EpicMonsterKill.fromJson(json["EPIC_MONSTER_KILL"]),
        firstBlood: json["FIRST_BLOOD"] == null ? null : EpicMonsterKill.fromJson(json["FIRST_BLOOD"]),
        firstTurret: json["FIRST_TURRET"] == null ? null : EpicMonsterKill.fromJson(json["FIRST_TURRET"]),
    );

    Map<String, dynamic> toJson() => {
        "EPIC_MONSTER_KILL": epicMonsterKill?.toJson(),
        "FIRST_BLOOD": firstBlood?.toJson(),
        "FIRST_TURRET": firstTurret?.toJson(),
    };
}

class EpicMonsterKill {
    int? featState;

    EpicMonsterKill({
        this.featState,
    });

    factory EpicMonsterKill.fromRawJson(String str) => EpicMonsterKill.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory EpicMonsterKill.fromJson(Map<String, dynamic> json) => EpicMonsterKill(
        featState: json["featState"],
    );

    Map<String, dynamic> toJson() => {
        "featState": featState,
    };
}

class Objectives {
    Atakhan? atakhan;
    Atakhan? baron;
    Atakhan? champion;
    Atakhan? dragon;
    Atakhan? horde;
    Atakhan? inhibitor;
    Atakhan? riftHerald;
    Atakhan? tower;

    Objectives({
        this.atakhan,
        this.baron,
        this.champion,
        this.dragon,
        this.horde,
        this.inhibitor,
        this.riftHerald,
        this.tower,
    });

    factory Objectives.fromRawJson(String str) => Objectives.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Objectives.fromJson(Map<String, dynamic> json) => Objectives(
        atakhan: json["atakhan"] == null ? null : Atakhan.fromJson(json["atakhan"]),
        baron: json["baron"] == null ? null : Atakhan.fromJson(json["baron"]),
        champion: json["champion"] == null ? null : Atakhan.fromJson(json["champion"]),
        dragon: json["dragon"] == null ? null : Atakhan.fromJson(json["dragon"]),
        horde: json["horde"] == null ? null : Atakhan.fromJson(json["horde"]),
        inhibitor: json["inhibitor"] == null ? null : Atakhan.fromJson(json["inhibitor"]),
        riftHerald: json["riftHerald"] == null ? null : Atakhan.fromJson(json["riftHerald"]),
        tower: json["tower"] == null ? null : Atakhan.fromJson(json["tower"]),
    );

    Map<String, dynamic> toJson() => {
        "atakhan": atakhan?.toJson(),
        "baron": baron?.toJson(),
        "champion": champion?.toJson(),
        "dragon": dragon?.toJson(),
        "horde": horde?.toJson(),
        "inhibitor": inhibitor?.toJson(),
        "riftHerald": riftHerald?.toJson(),
        "tower": tower?.toJson(),
    };
}

class Atakhan {
    bool? first;
    int? kills;

    Atakhan({
        this.first,
        this.kills,
    });

    factory Atakhan.fromRawJson(String str) => Atakhan.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Atakhan.fromJson(Map<String, dynamic> json) => Atakhan(
        first: json["first"],
        kills: json["kills"],
    );

    Map<String, dynamic> toJson() => {
        "first": first,
        "kills": kills,
    };
}

class Metadata {
    String? dataVersion;
    String? matchId;
    List<String>? participants;

    Metadata({
        this.dataVersion,
        this.matchId,
        this.participants,
    });

    factory Metadata.fromRawJson(String str) => Metadata.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
        dataVersion: json["dataVersion"],
        matchId: json["matchId"],
        participants: json["participants"] == null ? [] : List<String>.from(json["participants"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "dataVersion": dataVersion,
        "matchId": matchId,
        "participants": participants == null ? [] : List<dynamic>.from(participants!.map((x) => x)),
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
