import 'dart:convert' as convert;
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:recipe/base/recipe_cubit.dart';
import 'package:recipe/base/recipe_states.dart';
import 'package:recipe/models/recipe.dart';

class HomeCubit extends RecipeCubit{
  HomeCubit(initialState) : super(initialState);
  List<Recipe> recipeList = [];
@override
  void cubitCreated() async{
  emit(LoadingState());
    var response = await http.get(Uri.parse('https://api.spoonacular.com/recipes/random?apiKey=9c5df10fe6ad4569b533145864affdc8&number=10' ));
    if(response.statusCode == 200) {
      recipeList = new List<Recipe>.from(json.decode(response.body)['recipes']
          .map((data) => Recipe.fromJson(data))
          .toList());
      emit(DismissState());
      emit(HomeState());
    }else{
      emit(DismissState());
      emit(ErrorState('Something wrong plz try again later'));
    }
  }
}


