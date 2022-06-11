import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:scan_and_translate/Main%20Pages/HomePage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Scanslate',
      theme: ThemeData(
        fontFamily: 'Londrina Solid',
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // ignore: non_constant_identifier_names
  double Height = 280;
  // ignore: non_constant_identifier_names
  bool SpawnEffect = false;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      setState(() {
        Height = 0;
        Timer(const Duration(milliseconds: 1598), () {
          setState(() {
            SpawnEffect = true;
          });
        });
      });
    });

    Timer(const Duration(milliseconds: 4500), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: !SpawnEffect
            ? AnimatedContainer(
                curve: Curves.easeInOutCubic,
                duration: const Duration(milliseconds: 1598),
                height: Height,
                child: const Image(image: AssetImage('Assets/TeleImage.png')),
              )
            : const Image(
                image: AssetImage('Assets/Effect.gif'),
                height: 170,
              ),
      ),
    );
  }
}
