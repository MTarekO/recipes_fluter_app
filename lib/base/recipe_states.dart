 import 'package:recipe/models/recipe.dart';

abstract class RecipeState{}

 class InitState extends RecipeState{}
 class DismissState extends RecipeState{}

 class LoadingState extends RecipeState{}
 class HomeState extends RecipeState{}
 class DetailsState extends RecipeState{
  late final Recipe recipe;
  DetailsState(this.recipe);
 }
 class ErrorState extends RecipeState{
  final String error;
  ErrorState(this.error);
 }
