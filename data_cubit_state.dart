part of 'data_cubit_cubit.dart';

@override
abstract class DataCubitState {}

class DataCubitInitial extends DataCubitState {
  final List<TestModel> data = [];
}

class DataCubitStateLoaded extends DataCubitState {
  final List<TestModel> data;

  DataCubitStateLoaded({required this.data});
}
