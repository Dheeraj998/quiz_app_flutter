import 'package:bloc/bloc.dart';


part 'pagechange_state.dart';

class PagechangeCubit extends Cubit<PagechangeState> {
  PagechangeCubit() : super(PagechangeInitial(pageIndex: 0));
  changePage() {
    emit(PagechangeState(pageIndex: state.pageIndex + 1));
  }

  
}
