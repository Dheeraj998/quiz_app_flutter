import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app_bloc/controller/countdown/data_cubit/cubit/data_cubit_cubit.dart';
import 'package:quiz_app_bloc/controller/pagechange/pagechange_cubit.dart';
import 'package:quiz_app_bloc/screens/resultScreen.dart';
import 'package:quiz_app_bloc/screens/widgets/quiz.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  var colors = [
    Colors.blue,
    Colors.cyan,
    Colors.orange,
    Colors.red,
  ];
  int count = 0;

  updateResult(bool isCorrect) {
    setState(() {
      if (isCorrect == true) {
        count = count + 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 28, 4, 57),
      body: SafeArea(
        child: BlocBuilder<PagechangeCubit, PagechangeState>(
          builder: (context, state) {
            final pageIndex = state.pageIndex;
            return BlocBuilder<DataCubitCubit, DataCubitState>(
              builder: (context, state) {
                if (state is DataCubitInitial) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is DataCubitStateLoaded) {
                  final fetchedData = state.data;

                  return pageIndex < fetchedData.length
                      ? Quiz(
                          totalCount: updateResult,
                          fetchedData: fetchedData,
                          pageIndex: pageIndex,
                          colors: colors,
                          count: count,ctx: context,
                          size: size)
                      : ResultScreen(
                          totalCount: count,
                        );
                } else {
                  return Container();
                }
              },
            );
          },
        ),
      ),
    );
  }
}
