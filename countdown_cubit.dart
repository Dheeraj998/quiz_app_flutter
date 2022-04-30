import 'dart:async';

import 'package:bloc/bloc.dart';

part 'countdown_state.dart';

class CountdownCubit extends Cubit<CountdownState> {
  CountdownCubit() : super(CountdownInitial(countVariable: 3));

  void decrement() {
    Timer(const Duration(seconds: 1), () {
      emit(CountdownState(countVariable: state.countVariable - 1));
    });
  }
}
