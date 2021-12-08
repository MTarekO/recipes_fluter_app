import 'package:recipe/base/recipe_cubit.dart';
import 'package:recipe/base/recipe_states.dart';
import 'package:recipe/models/recipe.dart';

class DetailsCubit extends RecipeCubit{

  DetailsCubit(initialState) : super(initialState);
  late Recipe recipe;
  @override
  void cubitCreated() {

  }

}