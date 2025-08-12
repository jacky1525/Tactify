import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tactify/data/models/champion_info_model.dart' hide Image;

class ChampionSkins extends StatelessWidget {
  final ChampionDetail champion;
  const ChampionSkins({super.key, required this.champion});

  @override
  Widget build(BuildContext context) {
    List splashs = [];
    for (int i = 0; i < champion.skins.length; i++) {
      var championSplash =
          'http://ddragon.leagueoflegends.com/cdn/img/champion/loading/${champion.id}_${champion.skins[((champion.skins.length - 1) - i).abs()].num}.jpg';

      splashs.add(championSplash);
    }
    List reversedSplashs = splashs.reversed.toList();
    List namesList = [];
    for (int i = 0; i <= 162; i++) {
      namesList.add(champion.id);
    }
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF121212), Color(0xFF1E1E1E)],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: PageView.builder(
            physics: BouncingScrollPhysics(),
            reverse: false,
            itemCount: champion.skins.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 32.0),
                    child: Shimmer.fromColors(
                      period: Duration(milliseconds: 2500),
                      baseColor: Colors.white,
                      highlightColor: Colors.yellow,
                      child: Text(
                        champion.skins[index].name == "default"
                            ? champion.name
                            : champion.skins[index].name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => FullscreenSkinImage(
                            imageUrl: reversedSplashs[index],
                          ),
                        ),
                      );
                    },
                    child: // yerine geçecek blok
Container(
  height: MediaQuery.of(context).size.height * 0.8,
  width: double.infinity,
  margin: const EdgeInsets.symmetric(horizontal: 20),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(16),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.4),
        spreadRadius: 2,
        blurRadius: 10,
        offset: const Offset(0, 5),
      ),
    ],
  ),
  // shadow dışarıda kalsın diye ClipRRect'i içeride kullanıyoruz
  child: ClipRRect(
    borderRadius: BorderRadius.circular(16),
    child: Stack(
      fit: StackFit.expand,
      children: [
        // arka plan placeholder
        Container(color: const Color(0xFF0F1216)),
        // cached + fade-in görsel
        CachedNetworkImage(
          imageUrl: reversedSplashs[index],
          fit: BoxFit.cover, // istersen cover yap
          fadeInDuration: const Duration(milliseconds: 250),
          placeholder: (_, __) => Container(color: Colors.black12),
          errorWidget: (_, __, ___) => Container(color: Colors.black26),
        ),
        // overlay / gradient istiyorsan buraya ekleyebilirsin
        // Positioned.fill(child: DecoratedBox(...)),
      ],
    ),
  ),
),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class FullscreenSkinImage extends StatelessWidget {
  final String imageUrl;

  const FullscreenSkinImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Center(child: Image.network(imageUrl, fit: BoxFit.contain)),
      ),
    );
  }
}
