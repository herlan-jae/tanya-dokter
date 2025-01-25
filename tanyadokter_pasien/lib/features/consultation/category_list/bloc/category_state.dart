import 'package:tanyadokter_pasien/features/consultation/category_list/data/category_model.dart';

abstract class CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryLoaded extends CategoryState {
  final List<Category> category;

  CategoryLoaded(this.category);
}

class CategoryError extends CategoryState {
  final String message;

  CategoryError(this.message);
}
