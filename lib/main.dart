import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:season_mobile_partner/widgets/login/login.dart';
import 'package:season_mobile_partner/widgets/menu/bottomMenu.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent, // navigation bar color
      statusBarColor: Colors.white //Colors.orange[900] // status bar color
      ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chic Partner',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Color(0xFFF37540),
            secondary: Color(0xFF05A8CF),
          ),
          fontFamily: 'Montserrat'),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginPage(),
        '/booking': (context) => BottomMenu(index: 1),
        '/accommodation': (context) => BottomMenu(index: 0),
        '/finance': (context) => BottomMenu(index: 2),
        '/operation': (context) => BottomMenu(index: 3),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String currentEmail = "";
  startTime() async {
    var _duration = new Duration(seconds: 4);
    return new Timer(_duration, navigationPage);
  }

  getData() async {}

  void navigationPage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      currentEmail = prefs.getString('email') ?? "";
    });
    if (currentEmail != "") {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (_) => BottomMenu(
                    index: 0,
                  )));
    } else {
      Navigator.of(context).pushReplacementNamed('/login');
    }
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/images/logo-chicaparts.png",
          width: 200,
        ),
      ),
    );
  }
}
