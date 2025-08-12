import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tactify/data/models/summoner_info_model.dart';

class AccountBanner extends StatelessWidget {
  const AccountBanner({
    super.key,
    required this.profileIconUrl,
    required this.gameName,
    required this.tagLine,
    required this.lastActiveText,
    required this.summoner,
  });

  final String profileIconUrl;
  final String gameName;
  final String tagLine;
  final String lastActiveText;
  final SummonerInfoModel? summoner;

  @override
  Widget build(BuildContext context) {
    final lvl = summoner?.summonerLevel ?? 0;

    return Container(
      height: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFF9EA3AB).withOpacity(.65), // metalik gri
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF9EA3AB).withOpacity(.15),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF171A1F), Color(0xFF0F1216)], // koyu metalik yüzey
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            //
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                child: Container(color: Colors.transparent),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _AvatarRing(imageUrl: profileIconUrl),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                gameName,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.orbitron(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 1.1,
                                ),
                              ),
                            ),
                            const SizedBox(width: 6),
                            Flexible(
                              child: Text(
                                '#$tagLine',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                softWrap: false,
                                style: GoogleFonts.orbitron(
                                  color: const Color(0xFF6C737D),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.1,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child: _StatChip(
                                icon: Icons.access_time_rounded,
                                label: 'Son Aktif',
                                value: lastActiveText,
                              ),
                            ),
                            const SizedBox(width: 8),

                            SizedBox(
                              width: 115,
                              child: _StatChip(
                                icon: Icons.military_tech_rounded,
                                label: 'Seviye',
                                value: '$lvl',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AvatarRing extends StatelessWidget {
  const _AvatarRing({required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64,
      height: 64,
      padding: const EdgeInsets.all(2.1),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        // metalik halka
        gradient: SweepGradient(
          colors: [Color(0xFFB6BCC6), Color(0xFF6C737D), Color(0xFFB6BCC6)],
        ),
      ),
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black,
        ),
        child: ClipOval(
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) =>
                const Icon(Icons.person, color: Colors.white54),
          ),
        ),
      ),
    );
  }
}

class _StatChip extends StatelessWidget {
  const _StatChip({
    required this.icon,
    required this.label,
    required this.value,
  });
  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min, // chip kendi içeriği kadar
      children: [
        Icon(icon, size: 14, color: Colors.white70),
        const SizedBox(width: 6),
        // label
        Text(
          '$label: ',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.orbitron(
            color: Colors.white70,
            fontSize: 11,
            letterSpacing: .6,
          ),
        ),
        // value
        Expanded(
          child: Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.orbitron(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.w700,
              letterSpacing: .6,
            ),
          ),
        ),
      ],
    );
  }
}
