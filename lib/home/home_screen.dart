import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/base/recipe_cubit.dart';
import 'package:recipe/base/recipe_screen.dart';
import 'package:recipe/base/recipe_states.dart';
import 'package:recipe/details/details_cubit.dart';
import 'package:recipe/details/details_screen.dart';

import 'home_cubit.dart';

class HomeScreen extends RecipeScreen<HomeCubit>{

  @override
  Widget buildScreen(context) {
    final HomeCubit _cubit = BlocProvider.of<HomeCubit>(context);
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.amber,
      leading:  const Icon(
          Icons.menu
      ),
      title: Text(
          'Recipes'
      ),
      centerTitle: true,
      actions:[],
    ),
      body: SingleChildScrollView(
       child: Column(
         children: [
           Container(

             child: const Padding(
               padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 30.0),
               child: Text(
                 'Home of Recipes',
                 style: TextStyle(
                   color: Colors.amberAccent,
                   fontWeight: FontWeight.bold,
                   fontSize: 30.0,

                 ),
               ),
             ),//Image.asset('assets/images/home.jpg', width: 100, height: 300, fit: BoxFit.fill),
             width: double.infinity,

           ),
           BlocBuilder<HomeCubit, RecipeState>(
               buildWhen: (previous, current) => current is HomeState,
               builder:(context, state) => state is HomeState?
                  ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => buildRecipeItem(_cubit.recipeList[index], context),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount:  _cubit.recipeList.length,
                      separatorBuilder: (context, index) => Container(
                        height: 1.0,
                        width: double.infinity,
                        color: Colors.grey[300]
                      )
                  ) :
               Container(
                 child: Image.asset('assets/images/home.jpg'),
                   width:double.maxFinite,
                   height: 200

               )
           ),

          ]

       ),
      ),

      );

  }


  // 1 buid item
  // 2. build list
  // 3. add item to list
Widget buildRecipeItem(recipeList, context) => Container(
  padding:  const EdgeInsets.all(20.0),
  child:
    Column(
      children: [
        Container(
            child: Image.network('${recipeList.image}', width: 100, height: 300, fit: BoxFit.fill),
            width:double.maxFinite,
            height: 200
            ),
        const SizedBox(

            height: 10.0

        ),
        Container(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(

                flex: 4,

                child: Text(

                  recipeList.title,

                  style: const TextStyle(

                    fontSize: 20.0,

                    fontWeight: FontWeight.bold,

                  ),



                ),

              ),
              Expanded(
                flex: 1,
                child: IconButton(
                    icon: const Icon(Icons.forward),
                    color: Colors.amberAccent,
                    iconSize: 50.0,
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>
                          BlocProvider(
                            create: (context) => DetailsCubit(DetailsState(recipeList)),
                            child: DetailsScreen(),
                          )
                      ),
                      );
                    },
                ),
              ),
            ],
          ),
        ),
        SizedBox(height:5.0),
        Container(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                ('${recipeList.readyInMinutes} min for ${recipeList.servings}'),
                style: const TextStyle(
                    color: Colors.grey,
                    fontSize:  20.0
                ),
              ),
              const Icon(
                Icons.supervisor_account,
                color: Colors.grey,
              ),
            ],



          ),

        )

      ],
    ),
);

}