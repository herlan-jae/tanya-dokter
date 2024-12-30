import 'package:flutter/material.dart';
import 'package:tanyadokter_pasien/features/consultation/widget/doctor_card.dart';

class DoctorList extends StatefulWidget {
  static const routeName = '/DoctorList';

  const DoctorList({super.key});

  @override
  State<DoctorList> createState() => _DoctorListState();
}

class _DoctorListState extends State<DoctorList> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_rounded)),
        title: const Text(
          'Dokter Umum',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                ),
              ),
              const SizedBox(height: 12.0),
              Text(
                'Urut berdasarkan',
                style: const TextStyle(
                    fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              Row(
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(width: 1.0),
                    ),
                    onPressed: () {},
                    child: const Text('Nama'),
                  ),
                  const SizedBox(width: 8.0),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(width: 1.0),
                    ),
                    onPressed: () {},
                    child: const Text('Status'),
                  ),
                  const SizedBox(width: 8.0),
                  OutlinedButton(
                    onPressed: () {},
                    child: const Text('Reset'),
                  ),
                ],
              ),
              const SizedBox(height: 12.0),
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child:
                          DoctorCard(), // Pastikan DoctorCard sudah diimplementasikan
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
