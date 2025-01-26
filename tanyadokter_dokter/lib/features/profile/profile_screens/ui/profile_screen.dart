import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tanyadokter_dokter/app/session_helper.dart';
import 'package:tanyadokter_dokter/constant/loading_widget.dart';
import 'package:tanyadokter_dokter/constant/logout_dialog_widget.dart';
import 'package:tanyadokter_dokter/features/auth/login/bloc/login_bloc.dart';
import 'package:tanyadokter_dokter/features/auth/login/bloc/login_event.dart';

import '../widget/profile_list_tile.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile';
  ProfileScreen({super.key});

  final Map<String, String> categoryLabel = {
    "1": "Dokter Umum",
    "2": "Dokter Spesial Penyakit Dalam",
    "3": "Dokter Spesialis Kulit",
    "4": "Dokter Spesialis Mata",
    "5": "Dokter Spesialis Gigi",
    "6": "Dokter Spesialis THT",
    "7": "Dokter Spesialis Anak",
    "8": "Dokter Spesialis Kandungan",
  };

  Future<Map<String, String?>> getUserData() async {
    final userData = await SessionHelper.getUserSession();
    return userData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Profil',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
      ),
      body: FutureBuilder(
        future: getUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: PageLoadingWidget());
          }
          final userData = snapshot.data ?? {};

          String categoryId = userData["category_id"] ?? '0';
          String categoryText = categoryLabel[categoryId] ?? 'Kategori Dokter';

          return SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 120.0,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        color: Color(0xFFDDF2FF),
                      ),
                      child: Row(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(width: 36.0),
                          Container(
                            width: 88,
                            height: 88,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: const Color(0xFF116487),
                                width: 3,
                              ),
                            ),
                            child: const CircleAvatar(
                              radius: 40,
                              backgroundImage: NetworkImage(
                                'https://cdn.pixabay.com/photo/2024/08/13/11/57/ai-generated-8965819_960_720.png',
                              ),
                            ),
                          ),
                          const SizedBox(width: 18.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                userData["fullname"] ?? "Guest",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0,
                                ),
                              ),
                              Text(
                                categoryText,
                                style: const TextStyle(
                                  fontSize: 11.0,
                                ),
                              ),
                              Text(
                                userData["code"] ?? "Kode Dokter",
                                style: const TextStyle(
                                  fontSize: 11.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    ProfileListTile(
                      label: 'Akun',
                      icon: Icons.settings_rounded,
                      title: 'Pengaturan profil',
                      onTap: () {
                        Navigator.of(context).pushNamed('/profile-settings');
                      },
                    ),
                    ProfileListTile(
                      label: 'Aktivitas',
                      icon: Icons.content_paste_search_rounded,
                      title: 'Riwayat konsultasi',
                      onTap: () {
                        Navigator.of(context).pushNamed('/history');
                      },
                    ),
                    ProfileListTile(
                      label: 'Info',
                      icon: Icons.info_rounded,
                      title: 'Tentang aplikasi',
                      onTap: () {
                        Navigator.of(context).pushNamed('/about');
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        height: kBottomNavigationBarHeight,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: 0.0,
              backgroundColor: const Color(0xFFDDF2FF),
              foregroundColor: const Color(0xFF116487),
              minimumSize: const Size(370.0, 30.0)),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => LogoutDialog(function: () {
                context.read<LoginBloc>().add(LogoutRequested());
                Navigator.of(context).pushReplacementNamed('/login');
              }),
            );
          },
          child: const Text(
            'Keluar',
            style: TextStyle(
              fontSize: 13.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
