import 'package:app/src/configs/theme.dart';
import 'package:flutter/material.dart';
import 'package:app/src/views/screens/home/home.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static void _initUUID() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String uuid = prefs.getString('uuid');
    if (uuid == null) {
      final String generatedUuid = Uuid().v1();
      await prefs.setString('uuid', generatedUuid);
    }
  }

  @override
  Widget build(BuildContext context) {
    MyApp._initUUID();

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
