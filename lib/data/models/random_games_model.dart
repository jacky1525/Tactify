// To parse this JSON data, do
//
//     final randomGames = randomGamesFromJson(jsonString);

import 'dart:convert';

RandomGames randomGamesFromJson(String str) => RandomGames.fromJson(json.decode(str));

String randomGamesToJson(RandomGames data) => json.encode(data.toJson());

class RandomGames {
    List<GameList> gameList;

    RandomGames({
        required this.gameList,
    });

    factory RandomGames.fromJson(Map<String, dynamic> json) => RandomGames(
        gameList: List<GameList>.from(json["gameList"].map((x) => GameList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "gameList": List<dynamic>.from(gameList.map((x) => x.toJson())),
    };
}

class GameList {
    int gameId;
    int mapId;
    String gameMode;
    String gameType;
    int gameQueueConfigId;
    List<Participant> participants;
    Observers observers;
    String platformId;
    List<BannedChampion> bannedChampions;
    int gameLength;

    GameList({
        required this.gameId,
        required this.mapId,
        required this.gameMode,
        required this.gameType,
        required this.gameQueueConfigId,
        required this.participants,
        required this.observers,
        required this.platformId,
        required this.bannedChampions,
        required this.gameLength,
    });

    factory GameList.fromJson(Map<String, dynamic> json) => GameList(
        gameId: json["gameId"],
        mapId: json["mapId"],
        gameMode: json["gameMode"],
        gameType: json["gameType"],
        gameQueueConfigId: json["gameQueueConfigId"],
        participants: List<Participant>.from(json["participants"].map((x) => Participant.fromJson(x))),
        observers: Observers.fromJson(json["observers"]),
        platformId: json["platformId"],
        bannedChampions: List<BannedChampion>.from(json["bannedChampions"].map((x) => BannedChampion.fromJson(x))),
        gameLength: json["gameLength"],
    );

    Map<String, dynamic> toJson() => {
        "gameId": gameId,
        "mapId": mapId,
        "gameMode": gameMode,
        "gameType": gameType,
        "gameQueueConfigId": gameQueueConfigId,
        "participants": List<dynamic>.from(participants.map((x) => x.toJson())),
        "observers": observers.toJson(),
        "platformId": platformId,
        "bannedChampions": List<dynamic>.from(bannedChampions.map((x) => x.toJson())),
        "gameLength": gameLength,
    };
}

class BannedChampion {
    int championId;
    int teamId;
    int pickTurn;

    BannedChampion({
        required this.championId,
        required this.teamId,
        required this.pickTurn,
    });

    factory BannedChampion.fromJson(Map<String, dynamic> json) => BannedChampion(
        championId: json["championId"],
        teamId: json["teamId"],
        pickTurn: json["pickTurn"],
    );

    Map<String, dynamic> toJson() => {
        "championId": championId,
        "teamId": teamId,
        "pickTurn": pickTurn,
    };
}

class Observers {
    String encryptionKey;

    Observers({
        required this.encryptionKey,
    });

    factory Observers.fromJson(Map<String, dynamic> json) => Observers(
        encryptionKey: json["encryptionKey"],
    );

    Map<String, dynamic> toJson() => {
        "encryptionKey": encryptionKey,
    };
}

class Participant {
    String puuid;
    int teamId;
    int spell1Id;
    int spell2Id;
    int championId;
    int profileIconId;
    String riotId;
    bool bot;

    Participant({
        required this.puuid,
        required this.teamId,
        required this.spell1Id,
        required this.spell2Id,
        required this.championId,
        required this.profileIconId,
        required this.riotId,
        required this.bot,
    });

    factory Participant.fromJson(Map<String, dynamic> json) => Participant(
        puuid: json["puuid"],
        teamId: json["teamId"],
        spell1Id: json["spell1Id"],
        spell2Id: json["spell2Id"],
        championId: json["championId"],
        profileIconId: json["profileIconId"],
        riotId: json["riotId"],
        bot: json["bot"],
    );

    Map<String, dynamic> toJson() => {
        "puuid": puuid,
        "teamId": teamId,
        "spell1Id": spell1Id,
        "spell2Id": spell2Id,
        "championId": championId,
        "profileIconId": profileIconId,
        "riotId": riotId,
        "bot": bot,
    };
}
