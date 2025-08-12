import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tactify/core/config/remote_config_manager.dart';
import 'package:tactify/core/constants/theme.dart';
import 'package:tactify/data/repositories/lol_repository.dart';
import 'package:tactify/features/champions/bloc/champions_bloc.dart';
import 'package:tactify/features/champions/bloc/champions_event.dart';
import 'package:tactify/features/home/bloc/featuredGames/featured_games_bloc.dart';
import 'package:tactify/features/home/bloc/searchBar/search_bloc.dart';
import 'package:tactify/features/items/bloc/items_bloc.dart';
import 'package:tactify/features/items/bloc/items_event.dart';
import 'package:tactify/features/runes/bloc/runes_bloc.dart';
import 'package:tactify/features/runes/bloc/runes_event.dart';
import 'package:tactify/features/spells/bloc/spells_bloc.dart';
import 'package:tactify/features/spells/bloc/spells_event.dart';
import 'package:tactify/firebase_options.dart';
import 'package:tactify/routes/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await RemoteConfigManager.initialize();

  runApp(
    RepositoryProvider(
      create: (_) => LolRepository(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final lolRepository = context.read<LolRepository>(); 

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ChampionsBloc(lolRepository: lolRepository)..add(FetchChampions()),
        ),
        BlocProvider(
          create: (_) => SpellsBloc(lolRepository: lolRepository)..add(FetchSpells()),
        ),
        BlocProvider(
          create: (_) => RunesBloc(lolRepository: lolRepository)..add(FetchRunes()),
        ),
        BlocProvider(
          create: (_) => ItemsBloc(lolRepository: lolRepository)..add(FetchItems()),
        ),
        BlocProvider(
          create: (_) => FeaturedGamesBloc(lolRepository),
        ),
        BlocProvider(
          create: (_) => SearchBloc(lolRepository),
        ),

      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Tactify',
        theme: darkTheme,
        routerConfig: appRouter,
      ),
    );
  }
}