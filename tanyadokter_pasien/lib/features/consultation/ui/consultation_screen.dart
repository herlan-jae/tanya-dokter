import 'package:flutter/material.dart';
import 'package:tanyadokter_pasien/features/consultation/widget/doctor_category_card.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _doctorCategories = [
    'Dokter Umum',
    'Dokter Kulit',
    'Dokter Penyakit Dalam',
    'Dokter Gigi',
    'Dokter THT',
    'Dokter Kandungan',
    'Dokter Mata',
    'Dokter',
  ];

  List<String> _filteredDoctors = [];

  @override
  void initState() {
    super.initState();
    _filteredDoctors = List.from(_doctorCategories);
    _searchController.addListener(_filterDoctors);
  }

  void _filterDoctors() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredDoctors = _doctorCategories
          .where((doctor) => doctor.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: Column(
            children: [
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Cari dokter',
                  prefixIcon: const Icon(Icons.search_rounded),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear_rounded),
                    onPressed: () {
                      _searchController.clear();
                    },
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                ),
              ),
              const SizedBox(height: 24.0),
              Expanded(
                child: _filteredDoctors.isEmpty
                    ? const Center(
                        child: Text(
                          'Tidak ada dokter ditemukan.',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      )
                    : ListView.builder(
                        itemCount: _filteredDoctors.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6.0),
                            child: DoctorCategoryCard(
                              label: _filteredDoctors[index],
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
