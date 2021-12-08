import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/base/recipe_screen.dart';
import 'package:recipe/base/recipe_states.dart';
import 'package:recipe/details/details_cubit.dart';
import 'package:flutter_html/flutter_html.dart';

class DetailsScreen extends RecipeScreen<DetailsCubit>{
  @override
  Widget buildScreen(context) {

    //final DetailsCubit _cubit = BlocProvider.of<DetailsCubit>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        leading:
        IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: ()  {Navigator.pop(context);},
            color: Colors.black,

        ),
        title: Text(
            'Recipes'
        ),
        centerTitle: true,
        actions:[],
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<DetailsCubit, RecipeState>(
        buildWhen: (previous, current) => current is DetailsState,
        builder:(context, state) => state is DetailsState ?
            Container(
              width: double.infinity,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          child: Image.network('${state.recipe.image}', width: 100, height: 300, fit: BoxFit.fill),
                          width: double.infinity,
                          height: 200,
                      ),
                      SizedBox(
                          height: 10.0
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          children: [
                            Text(
                              '${state.recipe.title}',
                              style: const TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),

                            ),
                            SizedBox(
                                height: 10.0
                            ),
                            Container(
                                height: 1.0,
                                width: double.infinity,
                                color: Colors.grey[300]
                            ),
                            SizedBox(
                                height: 10.0
                            ),
                            Text('Ingredients: '),
                            SizedBox(
                                height: 10.0
                            ),
                            Container(
                                height: 1.0,
                                width: double.infinity,
                                color: Colors.grey[300]
                            ),
                            SizedBox(
                                height: 10.0
                            ),
                            ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) => buildIngredient(state.recipe.extendedIngredients![index]),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount:  state.recipe.extendedIngredients!.length,
                            ),
                            SizedBox(
                                height: 10.0
                            ),
                            Container(
                                height: 1.0,
                                width: double.infinity,
                                color: Colors.grey[300]
                            ),
                            SizedBox(
                                height: 10.0
                            ),
                            Text('Summary: '),
                            SizedBox(
                                height: 10.0
                            ),
                            Container(
                                height: 1.0,
                                width: double.infinity,
                                color: Colors.grey[300]
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Html(
                              data: '${state.recipe.summary}',
                            ),
                          ],
                        ),
                      ),

                    ],

                ),
            ): Text('not in details state '),

    ),
      ),
    );
  }
  Widget buildIngredient(ingredient) => Padding(
    padding: const EdgeInsets.symmetric( horizontal: 20.0),
    child: Text('${ingredient.original}'),
  );

    //return state.recipe.extendedIngredients.map((e) => Text(e.original, style: TextStyle(fontSize: 15, color: Colors.grey[700]))).toList();
  //}

}