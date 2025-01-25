import 'package:flutter/material.dart';
import 'package:tanyadokter_dokter/app/session_helper.dart';
import 'package:tanyadokter_dokter/constant/loading_widget.dart';
import 'package:tanyadokter_dokter/features/profile_settings/widget/profile_setting_list_tile.dart';

class ProfileSettingScreen extends StatelessWidget {
  static const routeName = '/profile-settings';
  ProfileSettingScreen({super.key});

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
        title: const Text(
          'Pengaturan Profil',
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
                                'https://cdn.pixabay.com/photo/2024/09/03/15/21/ai-generated-9019520_1280.png',
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
                    ProfileSettingsListTile(
                      icon: Icons.edit_note_rounded,
                      title: 'Edit profil',
                      onTap: () {
                        Navigator.of(context).pushNamed('/edit');
                      },
                    ),
                    ProfileSettingsListTile(
                      icon: Icons.delete_rounded,
                      title: 'Hapus akun',
                      onTap: () {
                        Navigator.of(context).pushNamed('/DeleteProfile');
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
