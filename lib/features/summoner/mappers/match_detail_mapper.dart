import 'package:tactify/data/models/match_detail_model.dart';
import 'package:tactify/data/models/match_detail_lite_model.dart';

extension MatchDetailLiteMapper on MatchDetailModel {
  MatchDetailLiteModel toLiteModel() {
    final info = this.info;
    final m = this.metadata;

    final matchId = m?.matchId ?? '';
    final queueId = info?.queueId ?? 0;
    final gameMode = info?.gameMode ?? '';
    final duration = info?.gameDuration ?? 0;
    final endTs = info?.gameEndTimestamp ?? 0;

    final parts = (info?.participants ?? <Participant>[])
        .map((p) => _mapParticipant(p))
        .toList();

    return MatchDetailLiteModel(
      matchId: matchId,
      queueId: queueId,
      gameMode: gameMode,
      gameDurationSec: duration,
      gameEndTs: endTs,
      participants: parts,
    );
  }
}

MatchParticipantLiteModel _mapParticipant(Participant p) {
  // spells
  final s1 = p.summoner1Id ?? 0;
  final s2 = p.summoner2Id ?? 0;

  // runes (primary / sub + tüm perk id’leri)
  int primaryStyleId = 0;
  int subStyleId = 0;
  final runePerkIds = <int>[];

  final styles = p.perks?.styles ?? const [];
  for (final st in styles) {
    final desc = st.description; // Description? (primaryStyle / subStyle)
    final styleId = st.style ?? 0;
    final perks = st.selections ?? const [];

    if (desc == Description.PRIMARY_STYLE) {
      primaryStyleId = styleId;
    } else if (desc == Description.SUB_STYLE) {
      subStyleId = styleId;
    }
    for (final sel in perks) {
      if (sel.perk != null) runePerkIds.add(sel.perk!);
    }
  }

  // items 0..6
  final items = <int>[
    p.item0 ?? 0,
    p.item1 ?? 0,
    p.item2 ?? 0,
    p.item3 ?? 0,
    p.item4 ?? 0,
    p.item5 ?? 0,
    p.item6 ?? 0,
  ];

  // cs (bazı modlarda alandan biri yok olabilir)
  final cs = (p.totalMinionsKilled ?? 0) + (p.neutralMinionsKilled ?? 0);

  return MatchParticipantLiteModel(
    puuid: p.puuid ?? '',
    championName: p.championName ?? '',
    champLevel: p.champLevel ?? 0,
    win: p.win ?? false,
    kills: p.kills ?? 0,
    deaths: p.deaths ?? 0,
    assists: p.assists ?? 0,
    goldEarned: p.goldEarned ?? 0,
    cs: cs,
    items: items,
    spell1Id: s1,
    spell2Id: s2,
    primaryStyleId: primaryStyleId,
    subStyleId: subStyleId,
    runePerkIds: runePerkIds,
    teamId: p.teamId ?? 0,
  );
}