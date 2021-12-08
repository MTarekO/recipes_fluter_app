import 'package:flutter/cupertino.dart';
import 'package:recipe/recipe_application.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  RecipeApplication.getInstance().onCreated();
}