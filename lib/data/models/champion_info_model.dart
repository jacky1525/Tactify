// To parse this JSON data, do
//
//     final championInfoModel = championInfoModelFromJson(jsonString);

import 'dart:convert';

ChampionInfoModel championInfoModelFromJson(String str) =>
    ChampionInfoModel.fromJson(json.decode(str));

String championInfoModelToJson(ChampionInfoModel data) =>
    json.encode(data.toJson());

class ChampionInfoModel {
  String type;
  String format;
  String version;
  Map<String, ChampionDetail> data;

  ChampionInfoModel({
    required this.type,
    required this.format,
    required this.version,
    required this.data,
  });

  factory ChampionInfoModel.fromJson(Map<String, dynamic> json) {
    final rawData = json['data'] as Map<String, dynamic>;
    final dataMap = rawData.map(
      (key, value) => MapEntry(key, ChampionDetail.fromJson(value)),
    );

    return ChampionInfoModel(
      type: json['type'],
      format: json['format'],
      version: json['version'],
      data: dataMap,
    );
  }

  Map<String, dynamic> toJson() => {
    "type": type,
    "format": format,
    "version": version,
    "data": data.map((key, value) => MapEntry(key, value.toJson())),
  };
}

class ChampionDetail {
  String id;
  String key;
  String name;
  String title;
  Image image;
  List<Skin> skins;
  String lore;
  String blurb;
  List<String> allytips;
  List<String> enemytips;
  List<String> tags;
  String partype;
  Info info;
  Map<String, double> stats;
  List<Spell> spells;
  Passive passive;
  List<dynamic> recommended;

  ChampionDetail({
    required this.id,
    required this.key,
    required this.name,
    required this.title,
    required this.image,
    required this.skins,
    required this.lore,
    required this.blurb,
    required this.allytips,
    required this.enemytips,
    required this.tags,
    required this.partype,
    required this.info,
    required this.stats,
    required this.spells,
    required this.passive,
    required this.recommended,
  });

  factory ChampionDetail.fromJson(Map<String, dynamic> json) => ChampionDetail(
    id: json["id"],
    key: json["key"],
    name: json["name"],
    title: json["title"],
    image: Image.fromJson(json["image"]),
    skins: List<Skin>.from(json["skins"].map((x) => Skin.fromJson(x))),
    lore: json["lore"],
    blurb: json["blurb"],
    allytips: List<String>.from(json["allytips"].map((x) => x)),
    enemytips: List<String>.from(json["enemytips"].map((x) => x)),
    tags: List<String>.from(json["tags"].map((x) => x)),
    partype: json["partype"],
    info: Info.fromJson(json["info"]),
    stats: Map.from(
      json["stats"],
    ).map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
    spells: List<Spell>.from(json["spells"].map((x) => Spell.fromJson(x))),
    passive: Passive.fromJson(json["passive"]),
    recommended: List<dynamic>.from(json["recommended"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "key": key,
    "name": name,
    "title": title,
    "image": image.toJson(),
    "skins": List<dynamic>.from(skins.map((x) => x.toJson())),
    "lore": lore,
    "blurb": blurb,
    "allytips": List<dynamic>.from(allytips.map((x) => x)),
    "enemytips": List<dynamic>.from(enemytips.map((x) => x)),
    "tags": List<dynamic>.from(tags.map((x) => x)),
    "partype": partype,
    "info": info.toJson(),
    "stats": Map.from(stats).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "spells": List<dynamic>.from(spells.map((x) => x.toJson())),
    "passive": passive.toJson(),
    "recommended": List<dynamic>.from(recommended.map((x) => x)),
  };
}

class Image {
  String full;
  String sprite;
  String group;
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
    sprite: json["sprite"],
    group: json["group"],
    x: json["x"],
    y: json["y"],
    w: json["w"],
    h: json["h"],
  );

  Map<String, dynamic> toJson() => {
    "full": full,
    "sprite": sprite,
    "group": group,
    "x": x,
    "y": y,
    "w": w,
    "h": h,
  };
}

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

class Passive {
  String name;
  String description;
  Image image;

  Passive({required this.name, required this.description, required this.image});

  factory Passive.fromJson(Map<String, dynamic> json) => Passive(
    name: json["name"],
    description: json["description"],
    image: Image.fromJson(json["image"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "description": description,
    "image": image.toJson(),
  };
}

class Skin {
  String id;
  int num;
  String name;
  bool chromas;

  Skin({
    required this.id,
    required this.num,
    required this.name,
    required this.chromas,
  });

  factory Skin.fromJson(Map<String, dynamic> json) => Skin(
    id: json["id"],
    num: json["num"],
    name: json["name"],
    chromas: json["chromas"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "num": num,
    "name": name,
    "chromas": chromas,
  };
}

class Spell {
  String id;
  String name;
  String description;
  String tooltip;
  Leveltip leveltip;
  int maxrank;
  List<int> cooldown;
  String cooldownBurn;
  List<int> cost;
  String costBurn;
  Datavalues datavalues;
  List<List<int>?> effect;
  List<String?> effectBurn;
  List<dynamic> vars;
  String costType;
  String maxammo;
  List<int> range;
  String rangeBurn;
  Image image;
  String resource;

  Spell({
    required this.id,
    required this.name,
    required this.description,
    required this.tooltip,
    required this.leveltip,
    required this.maxrank,
    required this.cooldown,
    required this.cooldownBurn,
    required this.cost,
    required this.costBurn,
    required this.datavalues,
    required this.effect,
    required this.effectBurn,
    required this.vars,
    required this.costType,
    required this.maxammo,
    required this.range,
    required this.rangeBurn,
    required this.image,
    required this.resource,
  });

  factory Spell.fromJson(Map<String, dynamic> json) => Spell(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    tooltip: json["tooltip"],
    leveltip: Leveltip.fromJson(json["leveltip"]),
    maxrank: json["maxrank"],
    cooldown: List<int>.from(json["cooldown"].map((x) => (x ?? 0).toInt())),
    cooldownBurn: json["cooldownBurn"],
    cost: List<int>.from(json["cost"].map((x) => (x ?? 0).toInt())),
    costBurn: json["costBurn"],
    datavalues: Datavalues.fromJson(json["datavalues"]),
    effect: List<List<int>?>.from(
      json["effect"].map(
        (x) =>
            x == null ? null : List<int>.from(x.map((e) => (e ?? 0).toInt())),
      ),
    ),

    effectBurn: List<String?>.from(json["effectBurn"].map((x) => x)),
    vars: List<dynamic>.from(json["vars"].map((x) => x)),
    costType: json["costType"],
    maxammo: json["maxammo"],
    range: List<int>.from(json["range"].map((x) => x)),
    rangeBurn: json["rangeBurn"],
    image: Image.fromJson(json["image"]),
    resource: json["resource"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "tooltip": tooltip,
    "leveltip": leveltip.toJson(),
    "maxrank": maxrank,
    "cooldown": List<dynamic>.from(cooldown.map((x) => x)),
    "cooldownBurn": cooldownBurn,
    "cost": List<dynamic>.from(cost.map((x) => x)),
    "costBurn": costBurn,
    "datavalues": datavalues.toJson(),
    "effect": List<dynamic>.from(
      effect.map((x) => x == null ? [] : List<dynamic>.from(x.map((x) => x))),
    ),
    "effectBurn": List<dynamic>.from(effectBurn.map((x) => x)),
    "vars": List<dynamic>.from(vars.map((x) => x)),
    "costType": costType,
    "maxammo": maxammo,
    "range": List<dynamic>.from(range.map((x) => x)),
    "rangeBurn": rangeBurn,
    "image": image.toJson(),
    "resource": resource,
  };
}

class Datavalues {
  Datavalues();

  factory Datavalues.fromJson(Map<String, dynamic> json) => Datavalues();

  Map<String, dynamic> toJson() => {};
}

class Leveltip {
  List<String> label;
  List<String> effect;

  Leveltip({required this.label, required this.effect});

  factory Leveltip.fromJson(Map<String, dynamic> json) => Leveltip(
    label: List<String>.from(json["label"].map((x) => x)),
    effect: List<String>.from(json["effect"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "label": List<dynamic>.from(label.map((x) => x)),
    "effect": List<dynamic>.from(effect.map((x) => x)),
  };
}
