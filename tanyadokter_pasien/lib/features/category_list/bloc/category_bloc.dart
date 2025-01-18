import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tanyadokter_pasien/features/category_list/bloc/category_event.dart';
import 'package:tanyadokter_pasien/features/category_list/bloc/category_state.dart';
import 'package:tanyadokter_pasien/features/category_list/data/category_repository.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository categoryRepository;

  CategoryBloc(this.categoryRepository) : super(CategoryLoading()) {
    on<FetchCategory>((event, emit) async {
      try {
        final categories = await categoryRepository.fetchCategory();
        emit(CategoryLoaded(categories));
      } catch (e) {
        emit(CategoryError('Gagal menampilkan daftar'));
      }
    });
  }
}
