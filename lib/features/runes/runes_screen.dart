import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tactify/core/constants/constants.dart';
import 'package:tactify/features/runes/bloc/runes_bloc.dart';
import 'package:tactify/features/runes/bloc/runes_state.dart';

class RunesScreen extends StatelessWidget {
  const RunesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 48),
      child: BlocBuilder<RunesBloc, RunesState>(
        builder: (context, state) {
          if (state is RunesLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is RunesLoaded) {
            final runes = state.runes;
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: Constants.runeImages.length,
              itemBuilder: (context, index) {
                final runeImage = Constants.runeImages[index];
                final rune = runes[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: InkWell(
                    onTap: () {
                      context.pushNamed('rune_detail', extra: rune);
                    },
                    child: Container(
                      width: 320,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xFF2A2A40),
                          width: 4.0,
                        ),
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: AssetImage(runeImage),
                          fit: BoxFit.cover,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 10,
                            offset: Offset(
                              0,
                              4,
                            ), // X ve Y ekseninde hafif bir kayma
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: Image.asset(runeImage, fit: BoxFit.cover),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              rune.name,
                              style: GoogleFonts.orbitron(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (state is RunesError) {
            return Center(child: Text(state.message));
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
