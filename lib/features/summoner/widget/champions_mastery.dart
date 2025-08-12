import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tactify/data/models/champion_mastery_model.dart';

class ChampionsMastery extends StatelessWidget {
  const ChampionsMastery({
    super.key,
    required this.items,
    required this.idToName, // <champId, ChampIdSlug>
  });

  final List<ChampionMastery> items;
  final Map<int, String> idToName;

  // DDragon splash: https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Aatrox_0.jpg
  String _splashByName(String champIdSlug) =>
      'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/${champIdSlug}_0.jpg';

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return const SizedBox.shrink();

    final top3 = items.take(3).toList();

    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 4),
      child: Column(
        children: List.generate(top3.length, (i) {
          final m = top3[i];

          // champId -> "Aatrox" gibi DDragon id’si
          final champIdSlug = idToName[m.championId];
          // haritada yoksa graceful fallback: düz renk kutu
          final splashUrl = champIdSlug != null
              ? _splashByName(champIdSlug)
              : null;

          return Padding(
            padding: EdgeInsets.only(bottom: i == top3.length - 1 ? 0 : 10),
            child: _MasteryWideCard(
              splashUrl: splashUrl,
              level: m.championLevel,
              title: champIdSlug ?? 'Bilinmiyor',
            ),
          );
        }),
      ),
    );
  }
}

class _MasteryWideCard extends StatelessWidget {
  const _MasteryWideCard({
    required this.splashUrl,
    required this.level,
    required this.title,
  });

  final String? splashUrl;
  final int level;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(.06), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.35),
            blurRadius: 14,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          // Splash arkaplan (varsa)
          Positioned.fill(
            child: splashUrl != null
                ? CachedNetworkImage(
                    imageUrl: splashUrl!,
                    fit: BoxFit.cover,
                    placeholder: (_, __) =>
                        Container(color: const Color(0xFF0F1216)),
                    errorWidget: (_, __, ___) =>
                        Container(color: const Color(0xFF0F1216)),
                    fadeInDuration: const Duration(milliseconds: 220),
                  )
                : Container(color: const Color(0xFF0F1216)),
          ),
          // karartma
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xCC0F1216),
                    Color(0x990F1216),
                    Color(0x660F1216),
                  ],
                ),
              ),
            ),
          ),
          // içerik
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.orbitron(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      letterSpacing: .8,
                      shadows: const [
                        Shadow(
                          blurRadius: 8,
                          color: Colors.black54,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '$level. Ustalık Seviyesi',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.orbitron(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    letterSpacing: .8,
                    shadows: const [
                      Shadow(
                        blurRadius: 8,
                        color: Colors.black54,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
