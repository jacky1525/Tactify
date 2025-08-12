import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tactify/core/utils/helper.dart';
import 'package:tactify/features/champions/bloc/champions_bloc.dart';
import 'package:tactify/features/champions/bloc/champions_state.dart';
import 'package:tactify/features/summoner/bloc/summoner_bloc.dart';
import 'package:tactify/features/summoner/bloc/summoner_state.dart';
import 'package:tactify/features/summoner/widget/account_banner.dart';
import 'package:tactify/features/summoner/widget/account_league.dart';
import 'package:tactify/features/summoner/widget/champions_mastery.dart';
import 'package:tactify/features/summoner/widget/match_list.dart';

class SummonerScreen extends StatelessWidget {
  final String gameName;
  final String tagLine;

  const SummonerScreen({
    super.key,
    required this.gameName,
    required this.tagLine,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocBuilder<SummonerBloc, SummonerState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator(color: Colors.white));
          }

          if (state.error != null) {
            return Center(
              child: Text('Hesap bulunamadı: ${state.error}',
                  style: GoogleFonts.orbitron(color: Colors.redAccent)),
            );
          }

          final idToName = context.select<ChampionsBloc, Map<int, String>>((b) {
            final s = b.state;
            if (s is ChampionsLoaded) return buildChampIdToName(s.champions);
            return const {};
          });

          final summoner = state.summoner;
          final leagues = state.leagues;
          final topMasteries = state.topMasteries;

          if (summoner == null) {
            return const Center(
              child: Text('Summoner bilgisi bulunamadı.', style: TextStyle(color: Colors.white)),
            );
          }

          final profileIconUrl =
              'https://raw.communitydragon.org/latest/plugins/rcp-be-lol-game-data/global/default/v1/profile-icons/${summoner.profileIconId}.jpg';
          final lastActiveText = formatLastActiveFromMs(summoner.revisionDate);

          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: NotificationListener<ScrollNotification>(
              onNotification: (sn) {
                final s = context.read<SummonerBloc>().state;
                if (sn.metrics.pixels >= sn.metrics.maxScrollExtent - 200) {
                  if (!s.isMatchIdsLoading &&
                      s.matchIdsHasMore &&
                      s.summoner != null &&
                      s.routingRegion != null &&
                      s.matchIdsCooldownSec == null) {
                  }
                }
                return false;
              },
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 50),
                    AccountBanner(
                      profileIconUrl: profileIconUrl,
                      gameName: gameName,
                      tagLine: tagLine,
                      lastActiveText: lastActiveText,
                      summoner: summoner,
                    ),
                    const SizedBox(height: 20),
                    AccountLeague(league: leagues),
                    const SizedBox(height: 20),
                    ChampionsMastery(items: topMasteries, idToName: idToName),
                    const SizedBox(height: 20),
                    
                    const MatchList(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}