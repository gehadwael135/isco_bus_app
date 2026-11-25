import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'page_view_state.dart';

class PageViewCubit extends Cubit<PageViewState> {
  PageViewCubit() : super(PageViewInitial());

  int currentIndex = 0;
  void nextPage() {
    currentIndex++;
    emit(PageViewChangeSuccess());
  }

  void previousPage() {
    if (currentIndex > 0) {
      currentIndex--;
      emit(PageViewChangeSuccess());
    }
  }
}
