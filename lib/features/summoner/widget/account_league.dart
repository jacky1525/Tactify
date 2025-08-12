import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tactify/data/models/league_model.dart';

class AccountLeague extends StatelessWidget {
  const AccountLeague({super.key, required this.league});

  final LeaguesSummary? league;

  static const String _baseUrl =
      "https://raw.communitydragon.org/latest/plugins/rcp-fe-lol-shared-components/global/default/images";
  static const String _unrankedImage = "$_baseUrl/unranked.png";

  static const Map<String, String> _tierTr = {
    "IRON": "Demir",
    "BRONZE": "Bronz",
    "SILVER": "Gümüş",
    "GOLD": "Altın",
    "PLATINUM": "Platin",
    "EMERALD": "Zümrüt",
    "DIAMOND": "Elmas",
    "MASTER": "Usta",
    "GRANDMASTER": "Büyük Usta",
    "CHALLENGER": "Şampiyon",
    "UNRANKED": "Derecesiz",
  };

  static const Map<String, List<Color>> _tierGrad = {
    "IRON": [Color(0xFF3A3A3A), Color(0xFF2C2C2C)],
    "BRONZE": [Color(0xFF634835), Color(0xFF3B2B20)],
    "SILVER": [Color(0xFF96A2AE), Color(0xFF5E6974)],
    "GOLD": [Color(0xFFD4A53F), Color(0xFF7B5A1C)],
    "PLATINUM": [Color(0xFF57C3C8), Color(0xFF2A6C75)],
    "EMERALD": [Color(0xFF2FCB7E), Color(0xFF186B4B)],
    "DIAMOND": [Color(0xFF6BA0FF), Color(0xFF29408A)],
    "MASTER": [Color(0xFFB672FF), Color(0xFF563585)],
    "GRANDMASTER": [Color(0xFFFF6B6B), Color(0xFF7D1C1C)],
    "CHALLENGER": [Color(0xFF66E4FF), Color(0xFF155C6B)],
    "UNRANKED": [Color(0xFF1B1E24), Color(0xFF0F1216)],
  };

  String _img(String? tier) => (tier == null || tier.isEmpty)
      ? _unrankedImage
      : "$_baseUrl/${tier.toLowerCase()}.png";

  String _tierNameTr(String? tier) =>
      _tierTr[(tier ?? 'UNRANKED').toUpperCase()] ?? tier ?? 'Derecesiz';

  List<Color> _grad(String? tier) =>
      _tierGrad[(tier ?? 'UNRANKED').toUpperCase()] ?? _tierGrad['UNRANKED']!;

  @override
  Widget build(BuildContext context) {
    final items = [
      ("Solo/Duo", league?.solo),
      ("Flex", league?.flex),
      ("TFT", league?.tft),
    ];

    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 4),
      child: Row(
        children: items
            .map(
              (e) => Expanded(
                child: _LeagueCard(
                  title: e.$1,
                  imageUrl: _img(e.$2?.tier),
                  gradient: _grad(e.$2?.tier),
                  tierTr: _tierNameTr(e.$2?.tier),
                  rank: e.$2?.rank ?? '',
                  lp: e.$2?.leaguePoints ?? 0,
                  wins: e.$2?.wins ?? 0,
                  losses: e.$2?.losses ?? 0,
                ),
              ),
            )
            .toList()
            .expand((w) sync* {
              yield w;
              if (w != items.last) yield const SizedBox(width: 10);
            })
            .toList(),
      ),
    );
  }
}

/// Tek bir ligi gösteren kart
class _LeagueCard extends StatelessWidget {
  const _LeagueCard({
    required this.title,
    required this.imageUrl,
    required this.gradient,
    required this.tierTr,
    required this.rank,
    required this.lp,
    required this.wins,
    required this.losses,
  });

  final String title;
  final String imageUrl;
  final List<Color> gradient;
  final String tierTr;
  final String rank;
  final int lp;
  final int wins;
  final int losses;

  double get winrate =>
      (wins + losses) == 0 ? 0 : (wins / (wins + losses) * 100);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: gradient,
        ),
        boxShadow: [
          BoxShadow(
            color: gradient.last.withOpacity(.25),
            blurRadius: 18,
            offset: const Offset(0, 10),
          ),
        ],
        border: Border.all(color: Colors.white.withOpacity(.06), width: 1),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Stack(
          children: [
            // cam efekti
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                child: const SizedBox(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // başlık
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.orbitron(
                      color: Colors.white,
                      fontSize: 12.5,
                      fontWeight: FontWeight.w700,
                      letterSpacing: .8,
                    ),
                  ),
                  const SizedBox(height: 6),
                  // rozet
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.45),
                          blurRadius: 20,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Image.network(
                      imageUrl,
                      width: 58,
                      height: 58,
                      fit: BoxFit.contain,
                      errorBuilder: (_, __, ___) => const Icon(
                        Icons.image_not_supported_rounded,
                        size: 40,
                        color: Colors.white54,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Tier + Rank
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      rank.isEmpty ? tierTr : "$tierTr $rank",
                      style: GoogleFonts.orbitron(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        letterSpacing: .6,
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),

                  // istatistik “chip” satırı
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _chip('LP', '$lp'),
                      _chip('W', '$wins'),
                      _chip('L', '$losses'),
                      _chip('%', winrate.toStringAsFixed(0)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _chip(String k, String v) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: 56,
      ), // tüm chip’ler en az 56px
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(.20),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.white.withOpacity(.08)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "$k:",
              style: GoogleFonts.orbitron(
                color: Colors.white70,
                fontSize: 10.5,
                letterSpacing: .5,
              ),
            ),
            const SizedBox(width: 4),
            Expanded(
              // kalan alanı kullan
              child: Text(
                v,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.right,
                style: GoogleFonts.orbitron(
                  color: Colors.white,
                  fontSize: 10.5,
                  fontWeight: FontWeight.w700,
                  letterSpacing: .5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
