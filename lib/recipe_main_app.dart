import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe/counter/counter_screen.dart';
import 'package:recipe/splash/splash_screen.dart';

class RecipeMainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipe ',
      theme: ThemeData(
        primarySwatch:  Colors.amber,
      ),
      home: SplashScreen(),

    );
  }

}