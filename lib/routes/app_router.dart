import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tactify/data/models/champion_info_model.dart';
import 'package:tactify/data/models/items_model.dart';
import 'package:tactify/data/models/runes_model.dart';
import 'package:tactify/data/repositories/lol_repository.dart';
import 'package:tactify/features/champions/championDetail/bloc/champion_detail_bloc.dart';
import 'package:tactify/features/champions/championDetail/bloc/champion_detail_event.dart';
import 'package:tactify/features/champions/championDetail/champion_detail_screen.dart';
import 'package:tactify/features/champions/championDetail/champion_skins_screen.dart';
import 'package:tactify/features/champions/champions_screen.dart';
import 'package:tactify/features/dashboard/dashboard.dart';
import 'package:tactify/features/home/home_screen.dart';
import 'package:tactify/features/items/itemsDetail/items_detail_screen.dart';
import 'package:tactify/features/items/items_screen.dart';
import 'package:tactify/features/runes/runeDetail/rune_detail_screen.dart';
import 'package:tactify/features/runes/runes_screen.dart';
import 'package:tactify/features/spells/spells_screen.dart';
import 'package:tactify/features/splash/splash_screen.dart';
import 'package:tactify/features/summoner/bloc/summoner_bloc.dart';
import 'package:tactify/features/summoner/bloc/summoner_event.dart';
import 'package:tactify/features/summoner/summoner_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      name: 'splash',
      builder: (context, state) => const SplashScreen(),
    ),
    ShellRoute(
      builder: (context, state, child) => Dashboard(child: child),
      routes: [
        GoRoute(
          path: '/champions',
          builder: (context, state) => const ChampionsScreen(),
        ),
        GoRoute(
          path: '/spells',
          builder: (context, state) => const SpellsScreen(),
        ),
        GoRoute(
          path: '/home',
          builder: (context, state) {
            return HomeScreen();
          },
        ),
        GoRoute(
          path: '/runes',
          builder: (context, state) => const RunesScreen(),
        ),
        GoRoute(
          path: '/items',
          builder: (context, state) => const ItemsScreen(),
        ),
      ],
    ),
    GoRoute(
      path: '/champion/:name',
      name: 'champion_detail',
      builder: (context, state) {
        final championName = state.pathParameters['name']!;
        return BlocProvider(
          create: (_) =>
              ChampionDetailBloc(LolRepository())
                ..add(FetchChampionDetail(championName)),
          child: ChampionDetailScreen(championName: championName),
        );
      },
    ),
    GoRoute(
      path: '/skins',
      name: 'champion_skins',
      builder: (context, state) {
        final champion = state.extra as ChampionDetail;
        return ChampionSkins(champion: champion);
      },
    ),
    GoRoute(
      path: '/rune',
      name: 'rune_detail',
      builder: (context, state) {
        final rune = state.extra as RunesModel;
        return RuneDetailScreen(rune: rune);
      },
    ),
    GoRoute(
      path: '/item',
      name: 'item_detail',
      builder: (context, state) {
        final item = state.extra as Datum;
        return ItemsDetailScreen(item: item);
      },
    ),
    GoRoute(
      path: '/summoner/:region/:puuid',
      name: 'summoner_screen',
      builder: (context, state) {
        final region = state.pathParameters['region']!;
        final puuid = state.pathParameters['puuid']!;

        final extraData = state.extra as Map<String, String>?;

        final gameName = extraData?['gameName'] ?? 'Unknown';
        final tagLine = extraData?['tagLine'] ?? 'Unknown';

        return BlocProvider(
          create: (context) =>
              SummonerBloc(context.read<LolRepository>())
                ..add(FetchSummonerInfo(region: region, puuid: puuid)),
          child: SummonerScreen(gameName: gameName, tagLine: tagLine),
        );
      },
    ),
  ],
  errorBuilder: (context, state) =>
      const Scaffold(body: Center(child: Text('Sayfa bulunamadı'))),
);
