import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inkozi/repo/category_repositories.dart';

import 'category_events.dart';
import 'category_states.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository _categoryRepository;

  CategoryBloc(this._categoryRepository) : super(CategoryLoadingState()) {
    ///

    @override
    Stream<CategoryState> mapEventToState(CategoryEvent event) async* {
      if (event is LoadCategoryEvent) {
        yield CategoryLoadingState();
        try {
          final categorys = await _categoryRepository.getCategory();
          yield CategoryLoadedState(categorys, selectedCategoryId: null);
        } catch (e) {
          yield CategoryErrorState(e.toString());
        }
      }

      if (event is UpdateSelectedCategoryEvent) {
        if (state is CategoryLoadedState) {
          final currentState = state as CategoryLoadedState;
          yield currentState.copyWith(
              selectedCategoryId: event.selectedCategoryId);
        }
      }
    }
  }
}
