import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/base/recipe_cubit.dart';
import 'package:recipe/base/recipe_states.dart';
import 'package:recipe/home/home_cubit.dart';
import 'package:recipe/home/home_screen.dart';

class SplashScreen extends StatelessWidget{

  @override
  Widget build(context){

    return Scaffold(body: Container(
        color: Colors.amberAccent,
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: TweenAnimationBuilder(
            duration: const Duration(seconds: 2),
            onEnd: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>
            BlocProvider(
              create: (context) => HomeCubit(InitState()),
              child: HomeScreen(),
            )
            ),
            ),

            child: Image.asset('assets/images/logo.jpg', width: 400, height: 200, fit: BoxFit.fill),
            tween: Tween<double>(begin: 0.0, end: 1.0) ,
            builder: ( context, val,  child){
              return Opacity(opacity: val as double, child: child,);
            },
            ),
        ),
      ),
    );
  }


}