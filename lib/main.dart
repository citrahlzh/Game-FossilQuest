import 'package:flutter/material.dart';
import 'package:game_fossilquest/presentation/dashboard.dart';
import 'package:game_fossilquest/presentation/game.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/game',
      routes: {
        '/': (context) => DashboardPage(),
        '/game': (context) => GamePage(),
      },
    );
  }
}
