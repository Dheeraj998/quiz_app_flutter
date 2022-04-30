part of 'countdown_cubit.dart';

class CountdownState {
  int countVariable;
  CountdownState({required this.countVariable});
}

class CountdownInitial extends CountdownState {
  CountdownInitial({required int countVariable}) : super(countVariable: 3);
}
