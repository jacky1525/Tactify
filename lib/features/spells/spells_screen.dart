import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tactify/features/spells/bloc/spells_bloc.dart';
import 'package:tactify/features/spells/bloc/spells_state.dart';

class SpellsScreen extends StatelessWidget {
  const SpellsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpellsBloc, SpellsState>(
      builder: (context, state) {
        if (state is SpellsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SpellsLoaded) {
          final spells = state.spells.data.values.toList();
          final filteredSpells = spells
              .where(
                (spell) =>
                    spell.name.isNotEmpty &&
                    spell.image.full.isNotEmpty &&
                    spell.name.toLowerCase() != "eklenecek" &&
                    spell.name.toLowerCase() != "yer imi ve saldırı çarpı",
              )
              .toList();

          final uniqueSpells = {
            for (var spell in filteredSpells) spell.name: spell,
          }.values.toList();

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 32),
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: uniqueSpells.length,
              itemBuilder: (context, index) {
                final spell = uniqueSpells[index];

                return Card(
                  color: const Color(0xFF1C1C1E),
                  margin: const EdgeInsets.only(bottom: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          'http://ddragon.leagueoflegends.com/cdn/15.14.1/img/spell/${spell.image.full}',
                          width: 48,
                          height: 48,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                spell.name,
                                style: GoogleFonts.orbitron(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                spell.description,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[300],
                                ),
                              ),
                              const SizedBox(height: 8),
                              RichText(
                                text: TextSpan(
                                  style: GoogleFonts.orbitron(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white, // Genel fallback rengi
                                  ),
                                  children: [
                                    const TextSpan(
                                      text: 'Bekleme Süresi: ',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    TextSpan(
                                      text: '${spell.cooldownBurn} sn',
                                      style: const TextStyle(
                                        color: Colors.amber,
                                      ),
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
              },
            ),
          );
        } else if (state is SpellsError) {
          return Center(child: Text("Hata: ${state.message}"));
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
