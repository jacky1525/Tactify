// To parse this JSON data, do
//
//     final runesModel = runesModelFromJson(jsonString);

import 'dart:convert';

List<RunesModel> runesModelFromJson(String str) =>
    List<RunesModel>.from(json.decode(str).map((x) => RunesModel.fromJson(x)));

String runesModelToJson(List<RunesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RunesModel {
  int id;
  String key;
  String icon;
  String name;
  List<Slot> slots;

  RunesModel({
    required this.id,
    required this.key,
    required this.icon,
    required this.name,
    required this.slots,
  });

  factory RunesModel.fromJson(Map<String, dynamic> json) => RunesModel(
    id: json["id"],
    key: json["key"],
    icon: json["icon"],
    name: json["name"],
    slots: List<Slot>.from(json["slots"].map((x) => Slot.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "key": key,
    "icon": icon,
    "name": name,
    "slots": List<dynamic>.from(slots.map((x) => x.toJson())),
  };
}

class Slot {
  List<Rune> runes;

  Slot({required this.runes});

  factory Slot.fromJson(Map<String, dynamic> json) =>
      Slot(runes: List<Rune>.from(json["runes"].map((x) => Rune.fromJson(x))));

  Map<String, dynamic> toJson() => {
    "runes": List<dynamic>.from(runes.map((x) => x.toJson())),
  };
}

class Rune {
  int id;
  String key;
  String icon;
  String name;
  String shortDesc;
  String longDesc;

  Rune({
    required this.id,
    required this.key,
    required this.icon,
    required this.name,
    required this.shortDesc,
    required this.longDesc,
  });

  factory Rune.fromJson(Map<String, dynamic> json) => Rune(
    id: json["id"] ?? 0,
    key: json["key"] ?? '',
    icon: json["icon"] ?? '',
    name: json["name"] ?? '',
    shortDesc: json["shortDesc"]?.toString() ?? '',
    longDesc: json["longDesc"]?.toString() ?? '',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "key": key,
    "icon": icon,
    "name": name,
    "shortDesc": shortDesc,
    "longDesc": longDesc,
  };
}
