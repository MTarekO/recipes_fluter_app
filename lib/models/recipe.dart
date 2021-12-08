import 'package:recipe/models/ingredients.dart';

class Recipe{
  int? id;
  String? title;
  String? image;
  int? servings;
  int? readyInMinutes;
  String? summary;
  List<Ingredients>? extendedIngredients;

 Recipe({this.id, this.title, this.image, this.servings, this.readyInMinutes, this.summary, this.extendedIngredients});

 factory Recipe.fromJson(Map<String , dynamic> json){
   List<Ingredients> ingredients =   List<Ingredients>.from(json["extendedIngredients"].map((x) => Ingredients.fromJson(x)));
    return Recipe(id:json['id'],
        title:json['title'],
        image:json['image'],
        servings:json['servings'],
        readyInMinutes:json['readyInMinutes'],
        summary:json['summary'],
        extendedIngredients: ingredients);
    }




}
