import 'package:app/src/configs/theme.dart';
import 'package:flutter/material.dart';
import 'package:app/src/views/screens/home/home.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      themeMode: ThemeMode.dark,
      home: HomeScreen(),
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
