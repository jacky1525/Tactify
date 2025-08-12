// To parse this JSON data, do
//
//     final itemsModel = itemsModelFromJson(jsonString);

import 'dart:convert';

ItemsModel itemsModelFromJson(String str) => ItemsModel.fromJson(json.decode(str));

String itemsModelToJson(ItemsModel data) => json.encode(data.toJson());

class ItemsModel {
    Type type;
    String version;
    Basic basic;
    Map<String, Datum> data;
    List<Group> groups;
    List<Tree> tree;

    ItemsModel({
        required this.type,
        required this.version,
        required this.basic,
        required this.data,
        required this.groups,
        required this.tree,
    });

    factory ItemsModel.fromJson(Map<String, dynamic> json) => ItemsModel(
        type: typeValues.map[json["type"]]!,
        version: json["version"],
        basic: Basic.fromJson(json["basic"]),
        data: Map.from(json["data"]).map((k, v) => MapEntry<String, Datum>(k, Datum.fromJson(v))),
        groups: List<Group>.from(json["groups"].map((x) => Group.fromJson(x))),
        tree: List<Tree>.from(json["tree"].map((x) => Tree.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "type": typeValues.reverse[type],
        "version": version,
        "basic": basic.toJson(),
        "data": Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "groups": List<dynamic>.from(groups.map((x) => x.toJson())),
        "tree": List<dynamic>.from(tree.map((x) => x.toJson())),
    };
}

class Basic {
    String name;
    Rune rune;
    Gold gold;
    String group;
    String description;
    String colloq;
    String plaintext;
    bool consumed;
    int stacks;
    int depth;
    bool consumeOnFull;
    List<dynamic> from;
    List<dynamic> into;
    int specialRecipe;
    bool inStore;
    bool hideFromAll;
    String requiredChampion;
    String requiredAlly;
    Map<String, int> stats;
    List<dynamic> tags;
    Map<String, bool> maps;

    Basic({
        required this.name,
        required this.rune,
        required this.gold,
        required this.group,
        required this.description,
        required this.colloq,
        required this.plaintext,
        required this.consumed,
        required this.stacks,
        required this.depth,
        required this.consumeOnFull,
        required this.from,
        required this.into,
        required this.specialRecipe,
        required this.inStore,
        required this.hideFromAll,
        required this.requiredChampion,
        required this.requiredAlly,
        required this.stats,
        required this.tags,
        required this.maps,
    });

    factory Basic.fromJson(Map<String, dynamic> json) => Basic(
        name: json["name"],
        rune: Rune.fromJson(json["rune"]),
        gold: Gold.fromJson(json["gold"]),
        group: json["group"],
        description: json["description"],
        colloq: json["colloq"],
        plaintext: json["plaintext"],
        consumed: json["consumed"],
        stacks: json["stacks"],
        depth: json["depth"],
        consumeOnFull: json["consumeOnFull"],
        from: List<dynamic>.from(json["from"].map((x) => x)),
        into: List<dynamic>.from(json["into"].map((x) => x)),
        specialRecipe: json["specialRecipe"],
        inStore: json["inStore"],
        hideFromAll: json["hideFromAll"],
        requiredChampion: json["requiredChampion"],
        requiredAlly: json["requiredAlly"],
        stats: Map.from(json["stats"]).map((k, v) => MapEntry<String, int>(k, v)),
        tags: List<dynamic>.from(json["tags"].map((x) => x)),
        maps: Map.from(json["maps"]).map((k, v) => MapEntry<String, bool>(k, v)),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "rune": rune.toJson(),
        "gold": gold.toJson(),
        "group": group,
        "description": description,
        "colloq": colloq,
        "plaintext": plaintext,
        "consumed": consumed,
        "stacks": stacks,
        "depth": depth,
        "consumeOnFull": consumeOnFull,
        "from": List<dynamic>.from(from.map((x) => x)),
        "into": List<dynamic>.from(into.map((x) => x)),
        "specialRecipe": specialRecipe,
        "inStore": inStore,
        "hideFromAll": hideFromAll,
        "requiredChampion": requiredChampion,
        "requiredAlly": requiredAlly,
        "stats": Map.from(stats).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "maps": Map.from(maps).map((k, v) => MapEntry<String, dynamic>(k, v)),
    };
}

class Gold {
    int base;
    int total;
    int sell;
    bool purchasable;

    Gold({
        required this.base,
        required this.total,
        required this.sell,
        required this.purchasable,
    });

    factory Gold.fromJson(Map<String, dynamic> json) => Gold(
        base: json["base"],
        total: json["total"],
        sell: json["sell"],
        purchasable: json["purchasable"],
    );

    Map<String, dynamic> toJson() => {
        "base": base,
        "total": total,
        "sell": sell,
        "purchasable": purchasable,
    };
}

class Rune {
    bool isrune;
    int tier;
    String type;

    Rune({
        required this.isrune,
        required this.tier,
        required this.type,
    });

    factory Rune.fromJson(Map<String, dynamic> json) => Rune(
        isrune: json["isrune"],
        tier: json["tier"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "isrune": isrune,
        "tier": tier,
        "type": type,
    };
}

class Datum {
    String name;
    String description;
    String colloq;
    String plaintext;
    List<String>? into;
    Image image;
    Gold gold;
    List<Tag> tags;
    Map<String, bool> maps;
    Map<String, double> stats;
    List<String>? from;
    int? depth;
    bool? inStore;
    Effect? effect;
    bool? consumed;
    int? stacks;
    bool? hideFromAll;
    bool? consumeOnFull;
    int? specialRecipe;
    String? requiredChampion;

    Datum({
        required this.name,
        required this.description,
        required this.colloq,
        required this.plaintext,
        this.into,
        required this.image,
        required this.gold,
        required this.tags,
        required this.maps,
        required this.stats,
        this.from,
        this.depth,
        this.inStore,
        this.effect,
        this.consumed,
        this.stacks,
        this.hideFromAll,
        this.consumeOnFull,
        this.specialRecipe,
        this.requiredChampion,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        name: json["name"],
        description: json["description"],
        colloq: json["colloq"],
        plaintext: json["plaintext"],
        into: json["into"] == null ? [] : List<String>.from(json["into"]!.map((x) => x)),
        image: Image.fromJson(json["image"]),
        gold: Gold.fromJson(json["gold"]),
        tags: List<Tag>.from(json["tags"].map((x) => tagValues.map[x]!)),
        maps: Map.from(json["maps"]).map((k, v) => MapEntry<String, bool>(k, v)),
        stats: Map.from(json["stats"]).map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
        from: json["from"] == null ? [] : List<String>.from(json["from"]!.map((x) => x)),
        depth: json["depth"],
        inStore: json["inStore"],
        effect: json["effect"] == null ? null : Effect.fromJson(json["effect"]),
        consumed: json["consumed"],
        stacks: json["stacks"],
        hideFromAll: json["hideFromAll"],
        consumeOnFull: json["consumeOnFull"],
        specialRecipe: json["specialRecipe"],
        requiredChampion: json["requiredChampion"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "colloq": colloq,
        "plaintext": plaintext,
        "into": into == null ? [] : List<dynamic>.from(into!.map((x) => x)),
        "image": image.toJson(),
        "gold": gold.toJson(),
        "tags": List<dynamic>.from(tags.map((x) => tagValues.reverse[x])),
        "maps": Map.from(maps).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "stats": Map.from(stats).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "from": from == null ? [] : List<dynamic>.from(from!.map((x) => x)),
        "depth": depth,
        "inStore": inStore,
        "effect": effect?.toJson(),
        "consumed": consumed,
        "stacks": stacks,
        "hideFromAll": hideFromAll,
        "consumeOnFull": consumeOnFull,
        "specialRecipe": specialRecipe,
        "requiredChampion": requiredChampion,
    };
}

class Effect {
    String effect1Amount;
    String? effect2Amount;
    String? effect3Amount;
    String? effect4Amount;
    String? effect5Amount;
    String? effect6Amount;
    String? effect7Amount;
    String? effect8Amount;
    String? effect9Amount;
    String? effect10Amount;
    String? effect11Amount;
    String? effect12Amount;
    String? effect13Amount;
    String? effect14Amount;
    String? effect15Amount;

    Effect({
        required this.effect1Amount,
        this.effect2Amount,
        this.effect3Amount,
        this.effect4Amount,
        this.effect5Amount,
        this.effect6Amount,
        this.effect7Amount,
        this.effect8Amount,
        this.effect9Amount,
        this.effect10Amount,
        this.effect11Amount,
        this.effect12Amount,
        this.effect13Amount,
        this.effect14Amount,
        this.effect15Amount,
    });

    factory Effect.fromJson(Map<String, dynamic> json) => Effect(
        effect1Amount: json["Effect1Amount"],
        effect2Amount: json["Effect2Amount"],
        effect3Amount: json["Effect3Amount"],
        effect4Amount: json["Effect4Amount"],
        effect5Amount: json["Effect5Amount"],
        effect6Amount: json["Effect6Amount"],
        effect7Amount: json["Effect7Amount"],
        effect8Amount: json["Effect8Amount"],
        effect9Amount: json["Effect9Amount"],
        effect10Amount: json["Effect10Amount"],
        effect11Amount: json["Effect11Amount"],
        effect12Amount: json["Effect12Amount"],
        effect13Amount: json["Effect13Amount"],
        effect14Amount: json["Effect14Amount"],
        effect15Amount: json["Effect15Amount"],
    );

    Map<String, dynamic> toJson() => {
        "Effect1Amount": effect1Amount,
        "Effect2Amount": effect2Amount,
        "Effect3Amount": effect3Amount,
        "Effect4Amount": effect4Amount,
        "Effect5Amount": effect5Amount,
        "Effect6Amount": effect6Amount,
        "Effect7Amount": effect7Amount,
        "Effect8Amount": effect8Amount,
        "Effect9Amount": effect9Amount,
        "Effect10Amount": effect10Amount,
        "Effect11Amount": effect11Amount,
        "Effect12Amount": effect12Amount,
        "Effect13Amount": effect13Amount,
        "Effect14Amount": effect14Amount,
        "Effect15Amount": effect15Amount,
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
    ITEM
}

final typeValues = EnumValues({
    "item": Type.ITEM
});

enum Sprite {
    ITEM0_PNG,
    ITEM1_PNG,
    ITEM2_PNG,
    ITEM3_PNG,
    ITEM4_PNG,
    ITEM5_PNG,
    ITEM6_PNG
}

final spriteValues = EnumValues({
    "item0.png": Sprite.ITEM0_PNG,
    "item1.png": Sprite.ITEM1_PNG,
    "item2.png": Sprite.ITEM2_PNG,
    "item3.png": Sprite.ITEM3_PNG,
    "item4.png": Sprite.ITEM4_PNG,
    "item5.png": Sprite.ITEM5_PNG,
    "item6.png": Sprite.ITEM6_PNG
});

enum Tag {
    ABILITY_HASTE,
    ACTIVE,
    ARMOR,
    ARMOR_PENETRATION,
    ATTACK_SPEED,
    AURA,
    BOOTS,
    CONSUMABLE,
    COOLDOWN_REDUCTION,
    CRITICAL_STRIKE,
    DAMAGE,
    GOLD_PER,
    HEALTH,
    HEALTH_REGEN,
    JUNGLE,
    LANE,
    LIFE_STEAL,
    MAGIC_PENETRATION,
    MAGIC_RESIST,
    MANA,
    MANA_REGEN,
    NONBOOTS_MOVEMENT,
    ON_HIT,
    SLOW,
    SPELL_BLOCK,
    SPELL_DAMAGE,
    SPELL_VAMP,
    STEALTH,
    TENACITY,
    TRINKET,
    VISION
}

final tagValues = EnumValues({
    "AbilityHaste": Tag.ABILITY_HASTE,
    "Active": Tag.ACTIVE,
    "Armor": Tag.ARMOR,
    "ArmorPenetration": Tag.ARMOR_PENETRATION,
    "AttackSpeed": Tag.ATTACK_SPEED,
    "Aura": Tag.AURA,
    "Boots": Tag.BOOTS,
    "Consumable": Tag.CONSUMABLE,
    "CooldownReduction": Tag.COOLDOWN_REDUCTION,
    "CriticalStrike": Tag.CRITICAL_STRIKE,
    "Damage": Tag.DAMAGE,
    "GoldPer": Tag.GOLD_PER,
    "Health": Tag.HEALTH,
    "HealthRegen": Tag.HEALTH_REGEN,
    "Jungle": Tag.JUNGLE,
    "Lane": Tag.LANE,
    "LifeSteal": Tag.LIFE_STEAL,
    "MagicPenetration": Tag.MAGIC_PENETRATION,
    "MagicResist": Tag.MAGIC_RESIST,
    "Mana": Tag.MANA,
    "ManaRegen": Tag.MANA_REGEN,
    "NonbootsMovement": Tag.NONBOOTS_MOVEMENT,
    "OnHit": Tag.ON_HIT,
    "Slow": Tag.SLOW,
    "SpellBlock": Tag.SPELL_BLOCK,
    "SpellDamage": Tag.SPELL_DAMAGE,
    "SpellVamp": Tag.SPELL_VAMP,
    "Stealth": Tag.STEALTH,
    "Tenacity": Tag.TENACITY,
    "Trinket": Tag.TRINKET,
    "Vision": Tag.VISION
});

class Group {
    String id;
    String maxGroupOwnable;

    Group({
        required this.id,
        required this.maxGroupOwnable,
    });

    factory Group.fromJson(Map<String, dynamic> json) => Group(
        id: json["id"],
        maxGroupOwnable: json["MaxGroupOwnable"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "MaxGroupOwnable": maxGroupOwnable,
    };
}

class Tree {
    String header;
    List<String> tags;

    Tree({
        required this.header,
        required this.tags,
    });

    factory Tree.fromJson(Map<String, dynamic> json) => Tree(
        header: json["header"],
        tags: List<String>.from(json["tags"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "header": header,
        "tags": List<dynamic>.from(tags.map((x) => x)),
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
