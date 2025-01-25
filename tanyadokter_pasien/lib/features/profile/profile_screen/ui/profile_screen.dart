import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tanyadokter_pasien/app/session_helper.dart';
import 'package:tanyadokter_pasien/core/widget/loading_widget.dart';
import 'package:tanyadokter_pasien/features/auth/login/bloc/login_bloc.dart';
import 'package:tanyadokter_pasien/features/auth/login/bloc/login_event.dart';
import 'package:tanyadokter_pasien/features/profile/profile_screen/widget/logout_dialog.dart';
import 'package:tanyadokter_pasien/features/profile/profile_screen/widget/profile_list_tile.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile';

  const ProfileScreen({super.key});

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
              backgroundColor: Color(0xFFDDF2FF),
              foregroundColor: Color(0xFF116487),
              minimumSize: Size(370.0, 30.0)),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => LogoutDialog(function: () {
                context.read<LoginBloc>().add(LogoutRequested());
                Navigator.of(context).pushReplacementNamed('/login');
              }),
            );
          },
          child: Text(
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
