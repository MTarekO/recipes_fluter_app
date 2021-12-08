import 'package:bloc/bloc.dart';
import 'package:recipe/base/recipe_states.dart';

abstract class RecipeCubit extends Cubit<RecipeState> {
  RecipeCubit(initialState) : super(initialState);

  void cubitCreated(){}
  void cubitResumed(){}
  void cubitPaused(){}
}