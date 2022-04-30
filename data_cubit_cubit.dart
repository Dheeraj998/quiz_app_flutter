import 'package:bloc/bloc.dart';

import 'package:quiz_app_bloc/controller/data/fetchData.dart';

import '../../../../models/data_resp/TestModel.dart';

part 'data_cubit_state.dart';

class DataCubitCubit extends Cubit<DataCubitState> {
  DataCubitCubit() : super(DataCubitInitial()) {
    fetchData();
  }
  // late final data;
  fetchData() async {
    try {
      emit(DataCubitInitial());
      final data = await readJson();
      emit(DataCubitStateLoaded(data: data));
      print(data);
    } catch (e) {
      print(e);
    }
  }
}
