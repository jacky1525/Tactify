// To parse this JSON data, do
//
//     final spellsModel = spellsModelFromJson(jsonString);

import 'dart:convert';

SpellsModel spellsModelFromJson(String str) => SpellsModel.fromJson(json.decode(str));

String spellsModelToJson(SpellsModel data) => json.encode(data.toJson());

class SpellsModel {
    String type;
    String version;
    Map<String, Datum> data;

    SpellsModel({
        required this.type,
        required this.version,
        required this.data,
    });

    factory SpellsModel.fromJson(Map<String, dynamic> json) => SpellsModel(
        type: json["type"],
        version: json["version"],
        data: Map.from(json["data"]).map((k, v) => MapEntry<String, Datum>(k, Datum.fromJson(v))),
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "version": version,
        "data": Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    };
}

class Datum {
    String id;
    String name;
    String description;
    String tooltip;
    int maxrank;
    List<double> cooldown;
    String cooldownBurn;
    List<int> cost;
    String costBurn;
    Datavalues datavalues;
    List<List<int>?> effect;
    List<String?> effectBurn;
    List<dynamic> vars;
    String key;
    int summonerLevel;
    List<String> modes;
    CostType costType;
    String maxammo;
    List<int> range;
    String rangeBurn;
    Image image;
    CostType resource;

    Datum({
        required this.id,
        required this.name,
        required this.description,
        required this.tooltip,
        required this.maxrank,
        required this.cooldown,
        required this.cooldownBurn,
        required this.cost,
        required this.costBurn,
        required this.datavalues,
        required this.effect,
        required this.effectBurn,
        required this.vars,
        required this.key,
        required this.summonerLevel,
        required this.modes,
        required this.costType,
        required this.maxammo,
        required this.range,
        required this.rangeBurn,
        required this.image,
        required this.resource,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        tooltip: json["tooltip"],
        maxrank: json["maxrank"],
        cooldown: List<double>.from(json["cooldown"].map((x) => x?.toDouble())),
        cooldownBurn: json["cooldownBurn"],
        cost: List<int>.from(json["cost"].map((x) => x)),
        costBurn: json["costBurn"],
        datavalues: Datavalues.fromJson(json["datavalues"]),
        effect: List<List<int>?>.from(json["effect"].map((x) => x == null ? null : List<int>.from(x.map((e) => e ?? 0)))),
        effectBurn: List<String?>.from(json["effectBurn"].map((x) => x)),
        vars: List<dynamic>.from(json["vars"].map((x) => x)),
        key: json["key"],
        summonerLevel: json["summonerLevel"],
        modes: List<String>.from(json["modes"].map((x) => x)),
        costType: costTypeValues.map[json["costType"]]!,
        maxammo: json["maxammo"],
        range: List<int>.from(json["range"].map((x) => x ?? 0)),
        rangeBurn: json["rangeBurn"],
        image: Image.fromJson(json["image"]),
        resource: costTypeValues.map[json["resource"]]!,
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "tooltip": tooltip,
        "maxrank": maxrank,
        "cooldown": List<dynamic>.from(cooldown.map((x) => x)),
        "cooldownBurn": cooldownBurn,
        "cost": List<dynamic>.from(cost.map((x) => x)),
        "costBurn": costBurn,
        "datavalues": datavalues.toJson(),
        "effect": List<dynamic>.from(effect.map((x) => x == null ? [] : List<dynamic>.from(x.map((x) => x)))),
        "effectBurn": List<dynamic>.from(effectBurn.map((x) => x)),
        "vars": List<dynamic>.from(vars.map((x) => x)),
        "key": key,
        "summonerLevel": summonerLevel,
        "modes": List<dynamic>.from(modes.map((x) => x)),
        "costType": costTypeValues.reverse[costType],
        "maxammo": maxammo,
        "range": List<dynamic>.from(range.map((x) => x)),
        "rangeBurn": rangeBurn,
        "image": image.toJson(),
        "resource": costTypeValues.reverse[resource],
    };
}

enum CostType {
    BEDELSIZ,
    NBSP
}

final costTypeValues = EnumValues({
    "Bedelsiz": CostType.BEDELSIZ,
    "&nbsp;": CostType.NBSP
});

class Datavalues {
    Datavalues();

    factory Datavalues.fromJson(Map<String, dynamic> json) => Datavalues(
    );

    Map<String, dynamic> toJson() => {
    };
}

class Image {
    String full;
    Sprite sprite;
    Group group;
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
        group: groupValues.map[json["group"]]!,
        x: json["x"],
        y: json["y"],
        w: json["w"],
        h: json["h"],
    );

    Map<String, dynamic> toJson() => {
        "full": full,
        "sprite": spriteValues.reverse[sprite],
        "group": groupValues.reverse[group],
        "x": x,
        "y": y,
        "w": w,
        "h": h,
    };
}

enum Group {
    SPELL
}

final groupValues = EnumValues({
    "spell": Group.SPELL
});

enum Sprite {
    SPELL0_PNG
}

final spriteValues = EnumValues({
    "spell0.png": Sprite.SPELL0_PNG
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
