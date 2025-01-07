import 'package:flutter/material.dart';

import '../widget/profile_list_tile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profil',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 36.0),
                    Stack(
                      children: [
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
                            backgroundImage:
                                NetworkImage('https://via.placeholder.com/150'),
                          ),
                        ),
                        Positioned(
                          bottom: -8,
                          right: -8,
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.photo_camera,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 18.0),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'dr. Waleed Abu Kareem, S.um',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                          ),
                        ),
                        Text(
                          'Dokter Umum',
                          style: TextStyle(
                            fontSize: 11.0,
                          ),
                        ),
                        Text(
                          'Status: Aktif',
                          style: TextStyle(
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
                  Navigator.of(context).pushNamed('/info');
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 60.0,
        shadowColor: Colors.black,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: 0.0,
              backgroundColor: const Color(0xFFDDF2FF),
              foregroundColor: const Color(0xFF116487),
              minimumSize: const Size(370.0, 30.0)),
          onPressed: () {},
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
