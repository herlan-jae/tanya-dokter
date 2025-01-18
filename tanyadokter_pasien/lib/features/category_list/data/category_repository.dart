import 'package:dio/dio.dart';
import 'category_model.dart';

class CategoryRepository {
  final Dio _dio = Dio();

  Future<List<Category>> fetchCategory() async {
    final response = await _dio.get(
        'https://tanya-dokter-api.fakhrurcodes.my.id/v1/category-specialist');
    final List data = response.data['data'];
    return data.map((json) => Category.fromJson(json)).toList();
  }
}
