import 'package:app/src/configs/theme.dart';
import 'package:flutter/material.dart';
import 'package:app/src/views/screens/home/home.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      themeMode: ThemeMode.dark,
      routes: {
        '/': (context) => HomeScreen(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        primaryColorBrightness: Brightness.light,
        brightness: Brightness.light,
        primaryColorDark: Colors.black,
        canvasColor: TransignColors.BackgroundColor,
        fontFamily: 'NotoSans',
      ),
    );
  }
}
