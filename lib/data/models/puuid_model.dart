class PuuidModel {
  final String puuid;
  final String gameName;
  final String tagLine;

  PuuidModel({
    required this.puuid,
    required this.gameName,
    required this.tagLine,
  });

  factory PuuidModel.fromJson(Map<String, dynamic> json) {
    return PuuidModel(
      puuid: json['puuid'],
      gameName: json['gameName'],
      tagLine: json['tagLine'],
    );
  }
}