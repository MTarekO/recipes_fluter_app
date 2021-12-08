import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/base/recipe_cubit.dart';
import 'package:recipe/base/recipe_states.dart';

abstract class RecipeScreen<B extends RecipeCubit> extends StatelessWidget{
  bool _isLoading = false;
  Widget buildScreen(BuildContext context);

  @override
  Widget build(BuildContext context) {
    final B _cubit = BlocProvider.of<B>(context);
   return BlocListener <B, RecipeState>(
        child: BlocBuilder<B, RecipeState>(
          buildWhen: (previous, current) => current is InitState,
          builder: (context, state){
            if(state is  InitState){
              _cubit.cubitCreated();
            }
            return buildScreen(context);
          } ,
        ),
        listener: (context, state) {

          if (state is LoadingState && !_isLoading) {
            showLoadingDialog(context);
            _isLoading = true;
          }else if(state is DismissState && _isLoading){
            Navigator.pop(context);
            _isLoading = false;
          } else if (state is ErrorState) {
            SnackBar(
              content: Text(state.error),
            );
          } else if (state is InitState) {
            _cubit.cubitCreated();
          }
        }
    );
  }

    showLoadingDialog(context){
      showDialog(
          context: context,
          builder: (context){
            return Center(
              child: const CircularProgressIndicator(),
            );

          });
    }
  }


