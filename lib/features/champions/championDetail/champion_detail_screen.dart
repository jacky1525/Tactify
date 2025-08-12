import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:tactify/core/constants/constants.dart';
import 'package:tactify/data/models/champion_info_model.dart' hide Image;
import 'package:tactify/features/champions/championDetail/bloc/champion_detail_bloc.dart';
import 'package:tactify/features/champions/championDetail/bloc/champion_detail_state.dart';

class ChampionDetailScreen extends StatelessWidget {
  final String championName;
  const ChampionDetailScreen({super.key, required this.championName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ChampionDetailBloc, ChampionDetailState>(
        builder: (context, state) {
          if (state is ChampionDetailLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ChampionDetailLoaded) {
            final detail = state.detail;
            return ChampionDetailBody(detail: detail);
          } else if (state is ChampionDetailError) {
            return Center(child: Text('Hata: ${state.message}'));
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}

class ChampionDetailBody extends StatelessWidget {
  const ChampionDetailBody({super.key, required this.detail});
  final ChampionDetail detail;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 72.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildImageHeader(detail),
          const SizedBox(height: 40),
          _buildInfoRowSection(detail, context),
          const SizedBox(height: 40),
          _buildInfoCard("Hikaye", detail.lore),
          const SizedBox(height: 30),
          _buildTipsCard("Dost İpuçları", detail.allytips),
          const SizedBox(height: 20),
          _buildTipsCard("Düşman İpuçları", detail.enemytips),
          const SizedBox(height: 30),
          Text(
            "Pasif Yetenek",
            style: GoogleFonts.orbitron(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          _buildPassiveCard(detail.passive),
          const SizedBox(height: 12),
          Text(
            "Yetenekler",
            style: GoogleFonts.orbitron(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          ...detail.spells.map((spell) => _buildSpellCard(spell)).toList(),
        ],
      ),
    );
  }

  Widget _buildImageHeader(ChampionDetail detail) {
    return Column(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          decoration: _gradientBoxDecoration(top: true),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: CachedNetworkImage(
              imageUrl:
                  'http://ddragon.leagueoflegends.com/cdn/img/champion/splash/${detail.id}_0.jpg',
              fit: BoxFit.cover,
              placeholder: (context, url) =>
                  Container(color: const Color(0xFF0F1216)),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fadeInDuration: const Duration(milliseconds: 220),
            ),
          ),
        ),
        Container(
          height: 60,
          width: double.infinity,
          decoration: _gradientBoxDecoration(bottom: true),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                detail.name,
                style: GoogleFonts.orbitron(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                detail.title,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey[400],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRowSection(ChampionDetail detail, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: _buildTags(detail.tags),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey.shade800,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                elevation: 4,
              ),
              onPressed: () {
                // Kostümler sayfasına yönlendirme
                context.pushNamed('champion_skins', extra: detail);
              },
              child: Text(
                'Kostümler',
                style: GoogleFonts.poppins(color: Colors.white, fontSize: 13),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        _buildDifficultyBar(detail.info.difficulty),
      ],
    );
  }

  List<Widget> _buildTags(List<String> tags) {
    return tags.map((tag) {
      final translated = Constants().tagTranslations[tag] ?? tag;
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.blueGrey.shade800,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Text(
          translated,
          style: GoogleFonts.poppins(color: Colors.white, fontSize: 13),
        ),
      );
    }).toList();
  }

  Widget _buildDifficultyBar(int difficulty) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Zorluk Seviyesi",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: LinearProgressIndicator(
            value: difficulty / 10,
            minHeight: 12,
            backgroundColor: Colors.grey[800],
            valueColor: AlwaysStoppedAnimation<Color>(
              difficulty >= 7
                  ? Colors.red
                  : difficulty >= 4
                  ? Colors.orange
                  : Colors.green,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoCard(String title, String content) {
    return Container(
      width: double.infinity,
      decoration: _gradientBoxDecoration(),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.orbitron(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.amber[300],
              ),
            ),
            const SizedBox(height: 12),
            Text(
              content,
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.white,
                height: 1.5,
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTipsCard(String title, List<String> tips) {
    return Container(
      width: double.infinity,
      decoration: _gradientBoxDecoration(),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.orbitron(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.lightBlueAccent,
              ),
            ),
            const SizedBox(height: 12),
            ...tips.map(
              (tip) => Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("• ", style: TextStyle(color: Colors.white)),
                    Expanded(
                      child: Text(
                        tip,
                        style: GoogleFonts.poppins(
                          color: Colors.white70,
                          fontSize: 13,
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _gradientBoxDecoration({
    bool top = false,
    bool bottom = false,
  }) {
    BorderRadius borderRadius = BorderRadius.zero;
    if (top && !bottom) {
      borderRadius = const BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      );
    } else if (!top && bottom) {
      borderRadius = const BorderRadius.only(
        bottomLeft: Radius.circular(12),
        bottomRight: Radius.circular(12),
      );
    } else {
      borderRadius = BorderRadius.circular(12);
    }
    return BoxDecoration(
      gradient: LinearGradient(
        colors: [const Color(0xFF2B2B2B), const Color(0xFF1A1A1A)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: borderRadius,
      boxShadow: [
        BoxShadow(
          color: Colors.white.withOpacity(0.03),
          spreadRadius: -2,
          blurRadius: 6,
          offset: const Offset(-2, -2),
        ),
        BoxShadow(
          color: Colors.black.withOpacity(0.4),
          blurRadius: 8,
          offset: const Offset(3, 4),
        ),
      ],
    );
  }

  Widget _buildCard({required Widget child}) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [const Color(0xFF2B2B2B), const Color(0xFF1A1A1A)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.03),
            spreadRadius: -2,
            blurRadius: 6,
            offset: const Offset(-2, -2),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 8,
            offset: const Offset(3, 4),
          ),
        ],
      ),
      child: Padding(padding: const EdgeInsets.all(16.0), child: child),
    );
  }

  Widget _buildPassiveCard(Passive passive) {
    return _buildCard(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              'https://ddragon.leagueoflegends.com/cdn/15.14.1/img/passive/${passive.image.full}',
              width: 48,
              height: 48,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  passive.name,
                  style: GoogleFonts.orbitron(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Html(
                  data: passive.description,
                  style: {
                    "body": Style(
                      margin: Margins.zero,
                      padding: HtmlPaddings.zero,
                      fontSize: FontSize(13),
                      color: Colors.white70,
                      lineHeight: LineHeight.number(1.4),
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      textAlign: TextAlign.justify,
                    ),
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSpellCard(Spell spell) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: _buildCard(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                'https://ddragon.leagueoflegends.com/cdn/15.14.1/img/spell/${spell.id}.png',
                width: 48,
                height: 48,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    spell.name,
                    style: GoogleFonts.orbitron(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Html(
                    data: spell.description,
                    style: {
                      "body": Style(
                        margin: Margins.zero,
                        padding: HtmlPaddings.zero,
                        fontSize: FontSize(13),
                        color: Colors.white70,
                        lineHeight: LineHeight.number(1.4),
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        textAlign: TextAlign.justify,
                      ),
                    },
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
