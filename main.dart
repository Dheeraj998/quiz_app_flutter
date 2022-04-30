import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

import 'package:quiz_app_bloc/controller/countdown/countdown_cubit.dart';
import 'package:quiz_app_bloc/controller/countdown/data_cubit/cubit/data_cubit_cubit.dart';
import 'package:quiz_app_bloc/controller/pagechange/pagechange_cubit.dart';
import 'package:quiz_app_bloc/screens/countDownScreen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CountdownCubit(),
        ),
        BlocProvider(
          create: (context) => PagechangeCubit(),
        ),
        BlocProvider(
          create: (context) => DataCubitCubit(),
        ),
      ],
      child: const MaterialApp(
          title: 'Quiz app',
          debugShowCheckedModeBanner: false,
          home: SplashSreen() //SplashSreen(),
          ),
    );
  }
}

class SplashSreen extends StatelessWidget {
  const SplashSreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
          duration: 3000,
          splash: Icons.quiz,
          nextScreen: const CountDownScreeen(),
          splashTransition: SplashTransition.fadeTransition,
          pageTransitionType: PageTransitionType.fade,
          backgroundColor: Colors.blue),
    );
  }
}
