// To parse this JSON data, do
//
//     final championsModel = championsModelFromJson(jsonString);

import 'dart:convert';

ChampionsModel championsModelFromJson(String str) => ChampionsModel.fromJson(json.decode(str));

String championsModelToJson(ChampionsModel data) => json.encode(data.toJson());

class ChampionsModel {
    Type type;
    String format;
    Version version;
    Map<String, Datum> data;

    ChampionsModel({
        required this.type,
        required this.format,
        required this.version,
        required this.data,
    });

    factory ChampionsModel.fromJson(Map<String, dynamic> json) => ChampionsModel(
        type: typeValues.map[json["type"]]!,
        format: json["format"],
        version: versionValues.map[json["version"]]!,
        data: Map.from(json["data"]).map((k, v) => MapEntry<String, Datum>(k, Datum.fromJson(v))),
    );

    Map<String, dynamic> toJson() => {
        "type": typeValues.reverse[type],
        "format": format,
        "version": versionValues.reverse[version],
        "data": Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    };
}

class Datum {
    Version version;
    String id;
    String key;
    String name;
    String title;
    String blurb;
    Info info;
    Image image;
    List<Tag> tags;
    String partype;
    Map<String, double> stats;

    Datum({
        required this.version,
        required this.id,
        required this.key,
        required this.name,
        required this.title,
        required this.blurb,
        required this.info,
        required this.image,
        required this.tags,
        required this.partype,
        required this.stats,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        version: versionValues.map[json["version"]]!,
        id: json["id"],
        key: json["key"],
        name: json["name"],
        title: json["title"],
        blurb: json["blurb"],
        info: Info.fromJson(json["info"]),
        image: Image.fromJson(json["image"]),
        tags: List<Tag>.from(json["tags"].map((x) => tagValues.map[x]!)),
        partype: json["partype"],
        stats: Map.from(json["stats"]).map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
    );

    Map<String, dynamic> toJson() => {
        "version": versionValues.reverse[version],
        "id": id,
        "key": key,
        "name": name,
        "title": title,
        "blurb": blurb,
        "info": info.toJson(),
        "image": image.toJson(),
        "tags": List<dynamic>.from(tags.map((x) => tagValues.reverse[x])),
        "partype": partype,
        "stats": Map.from(stats).map((k, v) => MapEntry<String, dynamic>(k, v)),
    };
}

class Image {
    String full;
    Sprite sprite;
    Type group;
    int x;
    int y;
    int w;
    int h;

    Image({
        required this.full,
        required this.sprite,
        required this.group,
        required this.x,
        required this.y,
        required this.w,
        required this.h,
    });

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        full: json["full"],
        sprite: spriteValues.map[json["sprite"]]!,
        group: typeValues.map[json["group"]]!,
        x: json["x"],
        y: json["y"],
        w: json["w"],
        h: json["h"],
    );

    Map<String, dynamic> toJson() => {
        "full": full,
        "sprite": spriteValues.reverse[sprite],
        "group": typeValues.reverse[group],
        "x": x,
        "y": y,
        "w": w,
        "h": h,
    };
}

enum Type {
    CHAMPION
}

final typeValues = EnumValues({
    "champion": Type.CHAMPION
});

enum Sprite {
    CHAMPION0_PNG,
    CHAMPION1_PNG,
    CHAMPION2_PNG,
    CHAMPION3_PNG,
    CHAMPION4_PNG,
    CHAMPION5_PNG
}

final spriteValues = EnumValues({
    "champion0.png": Sprite.CHAMPION0_PNG,
    "champion1.png": Sprite.CHAMPION1_PNG,
    "champion2.png": Sprite.CHAMPION2_PNG,
    "champion3.png": Sprite.CHAMPION3_PNG,
    "champion4.png": Sprite.CHAMPION4_PNG,
    "champion5.png": Sprite.CHAMPION5_PNG
});

class Info {
    int attack;
    int defense;
    int magic;
    int difficulty;

    Info({
        required this.attack,
        required this.defense,
        required this.magic,
        required this.difficulty,
    });

    factory Info.fromJson(Map<String, dynamic> json) => Info(
        attack: json["attack"],
        defense: json["defense"],
        magic: json["magic"],
        difficulty: json["difficulty"],
    );

    Map<String, dynamic> toJson() => {
        "attack": attack,
        "defense": defense,
        "magic": magic,
        "difficulty": difficulty,
    };
}

enum Tag {
    ASSASSIN,
    FIGHTER,
    MAGE,
    MARKSMAN,
    SUPPORT,
    TANK
}

final tagValues = EnumValues({
    "Assassin": Tag.ASSASSIN,
    "Fighter": Tag.FIGHTER,
    "Mage": Tag.MAGE,
    "Marksman": Tag.MARKSMAN,
    "Support": Tag.SUPPORT,
    "Tank": Tag.TANK
});

enum Version {
    THE_15141
}

final versionValues = EnumValues({
    "15.14.1": Version.THE_15141
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
