import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tanyadokter_pasien/core/widget/loading_widget.dart';
import 'package:tanyadokter_pasien/features/category_list/bloc/category_bloc.dart';
import 'package:tanyadokter_pasien/features/category_list/bloc/category_event.dart';
import 'package:tanyadokter_pasien/features/category_list/bloc/category_state.dart';
import 'package:tanyadokter_pasien/features/category_list/data/category_repository.dart';
import 'package:tanyadokter_pasien/features/category_list/views/widget/doctor_category_card.dart';
import 'package:tanyadokter_pasien/features/doctor/data/doctor_repository.dart';
import 'package:tanyadokter_pasien/features/doctor/views/ui/doctor_list.dart';

class CategoryScreen extends StatefulWidget {
  static const routeName = '/category';
  const CategoryScreen({super.key});

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final TextEditingController _searchController = TextEditingController();
  final DoctorRepository doctorRepository = DoctorRepository();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SafeArea(
        child: BlocProvider(
          create: (context) =>
              CategoryBloc(CategoryRepository())..add(FetchCategory()),
          child: Scaffold(
            body: BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
                if (state is CategoryLoading) {
                  return PageLoadingWidget();
                } else if (state is CategoryLoaded) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 8.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40.0,
                          child: TextField(
                            controller: _searchController,
                            decoration: InputDecoration(
                              hintText: 'Cari dokter',
                              hintStyle:
                                  TextStyle(fontSize: 13.0, color: Colors.grey),
                              prefixIcon: const Icon(Icons.search_rounded),
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.clear_rounded),
                                onPressed: () {
                                  _searchController.clear();
                                },
                              ),
                              border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30.0))),
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24.0),
                        Expanded(
                          child: ListView.builder(
                            itemCount: state.category.length,
                            itemBuilder: (context, index) {
                              final category = state.category[index];
                              return GestureDetector(
                                onTap: () {
                                  final doctor = doctorRepository
                                      .getDoctorByCategory(category.name);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DoctorListScreen(
                                        doctors: doctor,
                                        categoryName: category.name,
                                      ),
                                    ),
                                  );
                                },
                                child: DoctorCategoryCard(
                                  name: category.name,
                                  image: category.image,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                } else if (state is CategoryError) {
                  return Center(child: Text(state.message));
                } else {
                  return Container();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
