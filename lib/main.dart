import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackagrid5/pages/home.dart';
import 'package:hackagrid5/pages/login.dart';
import 'package:hackagrid5/pages/score/score.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestão Fácil',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        fontFamily: GoogleFonts.ptSans().fontFamily,
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: GoogleFonts.ptSans().fontFamily,
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      themeMode: ThemeMode.light,
      // home: HomeScreen()
      // home: EscolherBancoScreen(),
      home: LoginScreen(),
      // home: ScoreScreen(),
      // home: CadastroScreen(),
    );
  }
}
