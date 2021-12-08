import 'package:flutter/cupertino.dart';
import 'package:recipe/recipe_main_app.dart';

class RecipeApplication{

  static RecipeApplication? _instance; //static private variable called instance
  final RouteObserver<PageRoute> routeObserver = RouteObserver();

  RecipeApplication._privateConstructor(); // private constructor to be called inside the class only

  static RecipeApplication getInstance(){

    if(_instance == null ){
      _instance = RecipeApplication._privateConstructor();
    }
     return _instance!; // !
  }
  void onCreated(){
    runApp(RecipeMainApp());
  }
}