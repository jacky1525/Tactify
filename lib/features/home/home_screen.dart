import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tactify/features/home/bloc/featuredGames/featured_games_bloc.dart';
import 'package:tactify/features/home/bloc/featuredGames/featured_games_event.dart';
import 'package:tactify/features/home/bloc/featuredGames/featured_games_state.dart';
import 'package:tactify/features/home/widget/home_search_bar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<String> recentSearches = [
    'Example1',
    'Example2',
    'Example3',
    'Example4',
    'Example5',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40),
          // 🔍 Search Bar
         HomeSearchBar(),
          const SizedBox(height: 20),

          // 🔁 Recent Searches
          Wrap(
            direction: Axis.horizontal,
            spacing: 30,
            children: [
              Text(
                "Son Görüntülenenler",
                style: GoogleFonts.orbitron(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white70,
                  letterSpacing: 0.8,
                ),
              ),
              InkWell(
                onTap: () {
                  exampleAccountsDialog(context);
                },
                child: Text(
                  "Örnek Hesaplar",
                  style: GoogleFonts.orbitron(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.lime,
                    letterSpacing: 0.8,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Recent Search List
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemCount: recentSearches.length,
              separatorBuilder: (_, __) => const Divider(color: Colors.white12),
              itemBuilder: (context, index) {
                final name = recentSearches[index];
                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 4),
                  leading: const Icon(
                    Icons.account_circle_rounded,
                    color: Colors.white70,
                  ),
                  title: Text(
                    name,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.white38,
                  ),
                  onTap: () {
                    // ileride detay sayfasına yönlendirme buraya
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

 Future<dynamic> exampleAccountsDialog(BuildContext context) {
  context.read<FeaturedGamesBloc>().add(FetchFeaturedGames());

  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(20),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF1f1f1f),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Colors.white10,
              width: 1.5,
            ),
          ),
          padding: const EdgeInsets.all(16),
          child: BlocBuilder<FeaturedGamesBloc, FeaturedGamesState>(
            builder: (context, state) {
              if (state is FeaturedGamesLoading) {
                return const Center(
                  child: CircularProgressIndicator(color: Colors.lime),
                );
              } else if (state is FeaturedGamesLoaded) {
                final allParticipants = state.games.gameList
                    .expand((game) => game.participants)
                    .toList();

                final shownParticipants = allParticipants.take(10).toList();

                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Canlı Oyundaki Örnek Hesaplar",
                      style: GoogleFonts.orbitron(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ...shownParticipants.map((p) => ListTile(
                          leading: const Icon(Icons.account_circle_rounded, color: Colors.white70),
                          title: Text(
                            p.riotId,
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )),
                  ],
                );
              } else if (state is FeaturedGamesError) {
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    state.message,
                    style: const TextStyle(color: Colors.redAccent),
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ),
      );
    },
  );
}
}
