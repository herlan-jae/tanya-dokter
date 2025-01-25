import 'package:flutter/material.dart';
import 'package:tanyadokter_pasien/app/session_helper.dart';
import 'package:tanyadokter_pasien/core/widget/loading_widget.dart';
import 'package:tanyadokter_pasien/features/profile/profile_settings/widget/profile_settings_list_tile.dart';

class ProfileSettingsScreen extends StatelessWidget {
  static const routeName = '/profile-settings';

  const ProfileSettingsScreen({super.key});

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
            return Center(child: PageLoadingWidget());
          }
          final userData = snapshot.data ?? {};

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
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        color: Color(0xFFDDF2FF),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(width: 36.0),
                          Container(
                            width: 88,
                            height: 88,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Color(0xFF116487),
                                width: 3,
                              ),
                            ),
                            child: CircleAvatar(
                              radius: 40,
                              backgroundImage: NetworkImage(
                                'https://cdn.pixabay.com/photo/2018/04/27/03/50/portrait-3353699_1280.jpg',
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
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0,
                                ),
                              ),
                              Text(
                                userData["gender"] == "m" ? "Pria" : "Wanita",
                                style: TextStyle(
                                  fontSize: 11.0,
                                ),
                              ),
                              Text(
                                userData["phone"] ?? "-",
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
                        Navigator.of(context).pushNamed('/delete');
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
