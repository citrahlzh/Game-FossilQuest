import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_fossilquest/bloc_manage/game_bloc.dart';

import 'package:game_fossilquest/presentation/dashboard.dart';
import 'package:game_fossilquest/presentation/game.dart';
import 'package:game_fossilquest/presentation/collection.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => DashboardPage(),
        '/game': (context) => BlocProvider(
              create: (context) => GameBloc()..add(StartGameEvent()),
              child: GamePage(),
            ),
        '/collection': (context) => CollectionPage(),
      },
    );
  }
}
