import 'package:flutter/material.dart';
import 'package:ui_design_day_21_30/day21/day_21_screen.dart';
import 'package:ui_design_day_21_30/day24/themes/app_thime.dart';

import 'day22/day_22_screen.dart';
import 'day23/day_23_screen.dart';
import 'day24/day_24_screen.dart';
import 'day25-26/day_25_screen.dart';
import 'day25-26/day_26_screen.dart';
import 'day_27_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UI Design Day 21 30',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const Day21Screen()));
              },
              color: Colors.blueGrey[900],
              child: const Text(
                "Day 21",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const Day22Screen()));
              },
              color: Colors.blueGrey[900],
              child: const Text(
                "Day 22",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const Day23Screen()));
              },
              color: Colors.blueGrey[900],
              child: const Text(
                "Day 23",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => MaterialApp(
                          debugShowCheckedModeBanner: false,
                          theme: AppTheme.light,
                          darkTheme: AppTheme.dark,
                          themeMode: ThemeMode.system,
                          home: const Day24Screen(),
                        )));
              },
              color: Colors.blueGrey[900],
              child: const Text(
                "Day 24",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => MaterialApp(
                          debugShowCheckedModeBanner: false,
                          theme: AppTheme.light,
                          darkTheme: AppTheme.dark,
                          themeMode: ThemeMode.system,
                          home: const Day25Screen(),
                        )));
              },
              color: Colors.blueGrey[900],
              child: const Text(
                "Day 25",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => MaterialApp(
                          debugShowCheckedModeBanner: false,
                          theme: AppTheme.light,
                          darkTheme: AppTheme.dark,
                          themeMode: ThemeMode.system,
                          home: const Day26Screen(),
                        )));
              },
              color: Colors.blueGrey[900],
              child: const Text(
                "Day 26",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => MaterialApp(
                          debugShowCheckedModeBanner: false,
                          theme: AppTheme.light,
                          darkTheme: AppTheme.dark,
                          themeMode: ThemeMode.system,
                          home: const Day27Screen(),
                        )));
              },
              color: Colors.blueGrey[900],
              child: const Text(
                "Day 27",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
