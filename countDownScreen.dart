import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app_bloc/controller/countdown/countdown_cubit.dart';

import 'package:quiz_app_bloc/screens/quizscreen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class CountDownScreeen extends StatelessWidget {
  const CountDownScreeen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const TestScreen()));
    });
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 6, 2, 7),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: BlocBuilder<CountdownCubit, CountdownState>(
              builder: (context, state) {
                context.read<CountdownCubit>().decrement();
                // return Text(
                //   "${state.countVariable}",
                //   style: const TextStyle(fontSize: 55),
                // );
                return Container(
                  width: double.infinity,
                  height: 200,
                  color: const Color.fromARGB(255, 28, 8, 31),
                  child: Center(
                    child: DefaultTextStyle(
                      style: const TextStyle(
                        fontSize: 70.0,
                        fontFamily: 'Canterbury',
                      ),
                      child: AnimatedTextKit(
                        animatedTexts: [
                          ScaleAnimatedText("${state.countVariable}",
                              duration: const Duration(milliseconds: 500),
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 70)),
                        ],
                        onTap: () {
                          print("Tap Event");
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
