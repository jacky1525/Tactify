// match_list.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tactify/features/summoner/bloc/summoner_bloc.dart';
import 'package:tactify/features/summoner/bloc/summoner_event.dart';
import 'package:tactify/features/summoner/bloc/summoner_state.dart';
import 'package:tactify/data/models/match_detail_lite_model.dart';
import 'package:intl/intl.dart';

const String _ddragonVersion = '15.15.1'; 

class MatchList extends StatelessWidget {
  const MatchList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SummonerBloc, SummonerState>(
      buildWhen: (p, n) =>
          p.matchIds != n.matchIds ||
          p.matchDetailsLite != n.matchDetailsLite ||
          p.isDetailsLoading != n.isDetailsLoading ||
          p.detailsNextIndex != n.detailsNextIndex ||
          p.matchIdsCooldownSec != n.matchIdsCooldownSec ||
          p.visibleMatchCount != n.visibleMatchCount,
      builder: (context, s) {
        final ids = s.matchIds;
        final visible = s.visibleMatchCount;
        final canLoadMore = visible < ids.length;
        final isLoading = s.isDetailsLoading;
        final cooldown = s.matchIdsCooldownSec;

        final itemCount = visible + 1; // only draw visible + footer

        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(12, 8, 12, 24),
          itemCount: itemCount,
          separatorBuilder: (_, __) => const SizedBox(height: 8),
          itemBuilder: (context, i) {
            if (i >= visible) {
              if (isLoading) {
                return const _FooterBox(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  ),
                );
              }
              if (cooldown != null) {
                return _FooterBox(
                  child: Center(
                    child: Text('Bekleme: ${cooldown}s',
                        style: const TextStyle(color: Colors.white54)),
                  ),
                );
              }
              if (canLoadMore) {
                return _FooterBox(
                  child: SizedBox(
                    height: 42,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.white.withOpacity(.12)),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: const Color(0xFF12161B),
                      ),
                      onPressed: () => context
                          .read<SummonerBloc>()
                          .add(const ShowMoreMatches(step: 5)),
                      child: const Text('Daha fazla maç (5)'),
                    ),
                  ),
                );
              }
              return const _FooterBox(
                child: Center(
                  child: Text('Hepsi bu.',
                      style: TextStyle(color: Colors.white54)),
                ),
              );
            }

            final id = ids[i];
            final detail = s.matchDetailsLite[id]; // MatchDetailLiteModel?
            return _MatchTile(
              matchId: id,
              detail: detail,
              puuid: s.summoner?.puuid,
            );
          },
        );
      },
    );
  }
}

class _MatchTile extends StatelessWidget {
  const _MatchTile({
    required this.matchId,
    required this.detail,
    required this.puuid,
  });

  final String matchId;
  final MatchDetailLiteModel? detail;
  final String? puuid;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(14);

    // Placeholder while detail is null
    if (detail == null) {
      return Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFF0F1216),
          borderRadius: borderRadius,
          border: Border.all(color: Colors.white.withOpacity(.06)),
        ),
        child: const SizedBox(
          height: 96,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text('Detay yükleniyor...',
                style: TextStyle(color: Colors.white70)),
          ),
        ),
      );
    }

    // ---- Lite alanlarından verileri hazırla
    final me = (detail!.participants.firstWhere(
      (p) => p.puuid == puuid,
      orElse: () => detail!.participants.first,
    ));

    final win = me.win;
    final champ = me.championName;
    final level = me.champLevel;

    final minutes = (detail!.gameDurationSec ~/ 60);
    final mode = _queueLabel(detail!.queueId, fallback: detail!.gameMode);
    final kda = '${me.kills}/${me.deaths}/${me.assists}';
    final cs = me.cs;
    final gold = me.goldEarned;

    final itemIds = me.items.where((id) => id != 0).toList(growable: false);
    final spell1 = me.spell1Id;
    final spell2 = me.spell2Id;
    final whenStr = _formatEndDate(detail!.gameEndTs);

    return ClipRRect(
      borderRadius: borderRadius,
      child: Stack(
        children: [
          // Background splash (a little more visible)
          Positioned.fill(
            child: champ.isEmpty
                ? const SizedBox.shrink()
                : Image.network(
                    _splashUrl(champ),
                    fit: BoxFit.cover,
                    opacity: const AlwaysStoppedAnimation(0.35),
                  ),
          ),
          // Dark gradient overlay to improve contrast
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xFF0F1216).withOpacity(.70),
                    const Color(0xFF0F1216).withOpacity(.92),
                  ],
                ),
                border: Border.all(color: Colors.white.withOpacity(.06)),
              ),
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //  Result + Game type + Date 
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: win ? const Color(0xFF1E3A2F) : const Color(0xFF3A1E1E),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        win ? 'Galibiyet' : 'Mağlubiyet',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    _pill(mode),
                    const Spacer(),
                    if (whenStr.isNotEmpty)
                      Text(
                        whenStr,
                        style: const TextStyle(color: Colors.white54, fontSize: 11, fontWeight: FontWeight.w600),
                      ),
                  ],
                ),

                const SizedBox(height: 10),

                //  icon + name
                Row(
                  children: [
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.transparent,
                      backgroundImage: champ.isEmpty ? null : NetworkImage(_champIconUrl(champ)),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        champ,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                //  Level, KDA, 
                Wrap(
                  spacing: 12,
                  runSpacing: 6,
                  children: [
                    _chip('Lv', '$level'),
                    _chip('KDA', kda),
                    _chip('Süre', '${minutes}dk'),
                  ],
                ),

                const SizedBox(height: 10),

                //  CS, Gold
                Wrap(
                  spacing: 12,
                  runSpacing: 6,
                  children: [
                    _chip('CS', '$cs'),
                    _chip('Altın', NumberFormat.decimalPattern('tr').format(gold)),
                  ],
                ),

                const SizedBox(height: 12),

                // Items  + Spells 
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 
                    Expanded(
                      child: Wrap(
                        spacing: 6,
                        runSpacing: 6,
                        children: [
                          for (final id in itemIds) _iconBox(_itemUrl(id), size: 24),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    // Spells — right
                    if (spell1 != 0 || spell2 != 0)
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (spell1 != 0) _iconBox(_spellUrl(spell1), size: 26),
                          if (spell1 != 0 && spell2 != 0) const SizedBox(width: 8),
                          if (spell2 != 0) _iconBox(_spellUrl(spell2), size: 26),
                        ],
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _chip(String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF161A1F),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white.withOpacity(.06)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label, style: const TextStyle(color: Colors.white54, fontSize: 11)),
          const SizedBox(width: 6),
          Text(value,
              style: const TextStyle(
                  color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  Widget _pill(String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF15191E),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.white.withOpacity(.06)),
      ),
      child: Text(
        value,
        style: const TextStyle(
          color: Colors.white70,
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _iconBox(String url, {double size = 24}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: Image.network(url, width: size, height: size, fit: BoxFit.cover),
    );
  }
}

class _FooterBox extends StatelessWidget {
  const _FooterBox({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF0F1216),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white.withOpacity(.06)),
      ),
      child: child,
    );
  }
}

// ---- helpers

String _formatEndDate(int? epochMs) {
  if (epochMs == null || epochMs == 0) return '';
  final dt = DateTime.fromMillisecondsSinceEpoch(epochMs);
  final m = dt.month.toString().padLeft(2, '0');
  final d = dt.day.toString().padLeft(2, '0');
  final yy = dt.year % 100;
  return '$m/$d/$yy';
}

String _queueLabel(int? queueId, {required String? fallback}) {
  switch (queueId) {
    case 420:
      return 'Dereceli (Solo/Duo)';
    case 440:
      return 'Dereceli (Esnek)';
    case 450:
      return 'ARAM';
    case 900:
      return 'URF';
    default:
      // queueId bilinmiyorsa oyun modunu göster
      return (fallback ?? '').isEmpty ? '-' : fallback!;
  }
}

String _splashUrl(String championName) {
  final safe = championName.replaceAll(" ", "");
  return 'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/${safe}_0.jpg';
}

String _champIconUrl(String championName) {
  final safe = championName.replaceAll(" ", "");
  return 'https://ddragon.leagueoflegends.com/cdn/$_ddragonVersion/img/champion/${safe}.png';
}

String _itemUrl(int id) {
 
  return 'https://ddragon.leagueoflegends.com/cdn/$_ddragonVersion/img/item/${id}.png';
}

String _spellUrl(int id) {

  const map = {
    1:  'SummonerBoost',     // Cleanse
    3:  'SummonerExhaust',   // Exhaust
    4:  'SummonerFlash',     // Flash
    6:  'SummonerHaste',     // Ghost
    7:  'SummonerHeal',      // Heal
    11: 'SummonerSmite',     // Smite
    12: 'SummonerTeleport',  // Teleport
    13: 'SummonerMana',      // Clarity (ARAM)
    14: 'SummonerDot',       // Ignite
    21: 'SummonerBarrier',   // Barrier
    31: 'SummonerPoroRecall',// Poro Recall (ARAM)
    32: 'SummonerSnowball',  // Mark/Snowball (ARAM)
  };
  final key = map[id];
  if (key == null) return '';
  return 'https://ddragon.leagueoflegends.com/cdn/$_ddragonVersion/img/spell/$key.png';
}