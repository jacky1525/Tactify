import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tactify/features/champions/bloc/champions_bloc.dart';
import 'package:tactify/features/champions/bloc/champions_state.dart';
import 'package:tactify/features/champions/bloc/champions_event.dart';
import 'package:tactify/data/models/champions_model.dart' hide Image;

class ChampionsScreen extends StatelessWidget {
  const ChampionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChampionsBloc, ChampionsState>(
      builder: (context, state) {
        List<Datum> championsList = [];

        if (state is ChampionsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ChampionsLoaded) {
          championsList = state.champions.data.values.toList();
        } else if (state is ChampionsSearchResult) {
          championsList = state.results;
        } else if (state is ChampionsError) {
          return Center(child: Text('Hata: ${state.message}'));
        } else {
          return const SizedBox();
        }

        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E1E1E),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 6,
                        offset: const Offset(2, 3),
                      ),
                    ],
                  ),
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      hintText: 'Şampiyon ara...',
                      hintStyle: GoogleFonts.poppins(color: Colors.grey[500]),
                      prefixIcon: const Icon(Icons.search, color: Colors.white),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    onChanged: (value) {
                      context.read<ChampionsBloc>().add(SearchChampions(value));
                    },
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: championsList.length,
                  itemBuilder: (context, index) {
                    final champ = championsList[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          context.pushNamed(
                            'champion_detail',
                            pathParameters: {'name': champ.id},
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFF2B2B2B),
                                Color(0xFF1A1A1A),
                              ],
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
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    'http://ddragon.leagueoflegends.com/cdn/15.14.1/img/champion/${champ.image.full}',
                                    width: 60,
                                    height: 60,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(width: 14),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        champ.name,
                                        style: GoogleFonts.orbitron(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          letterSpacing: 0.5,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        champ.title,
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey[400],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Colors.white38,
                                  size: 16,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}