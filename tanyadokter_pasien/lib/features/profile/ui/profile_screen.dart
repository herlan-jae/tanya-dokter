import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tanyadokter_pasien/app/session_helper.dart';
import 'package:tanyadokter_pasien/features/auth/login/bloc/login_bloc.dart';
import 'package:tanyadokter_pasien/features/auth/login/bloc/login_event.dart';
import 'package:tanyadokter_pasien/features/auth/login/bloc/login_state.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile';

  const ProfileScreen({super.key});

  Future<String> getUserName() async {
    final session = await SessionHelper.getUserSession();
    return session["fullname"] ?? "Guest";
  }

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
      body: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          bool isLoading = state is LoginLoading;
          return SingleChildScrollView(
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
                        Stack(
                          children: [
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
                                    'https://via.placeholder.com/150'),
                              ),
                            ),
                            Positioned(
                              bottom: -8,
                              right: -8,
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
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
                              'Yusuf Abdul Wahid',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                              ),
                            ),
                            Text(
                              'Pria',
                              style: TextStyle(
                                fontSize: 11.0,
                              ),
                            ),
                            Text(
                              '+6281811881818',
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
                      Navigator.of(context).pushNamed('/ProfileSettings');
                    },
                  ),
                  ProfileListTile(
                    label: 'Aktivitas',
                    icon: Icons.content_paste_search_rounded,
                    title: 'Riwayat konsultasi',
                    onTap: () {},
                  ),
                  ProfileListTile(
                    label: 'Info',
                    icon: Icons.info_rounded,
                    title: 'Tentang aplikasi',
                    onTap: () {
                      Navigator.of(context).pushNamed('/AboutScreen');
                    },
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0.0,
                        backgroundColor: Color(0xFFDDF2FF),
                        foregroundColor: Color(0xFF116487),
                        minimumSize: Size(370.0, 30.0)),
                    onPressed: isLoading
                        ? null
                        : () {
                            context.read<LoginBloc>().add(LogoutRequested());
                            Navigator.of(context)
                                .pushReplacementNamed('/login');
                          },
                    child: isLoading
                        ? const SizedBox(
                            height: 24.0,
                            child: CircularProgressIndicator(),
                          )
                        : Text(
                            'Keluar',
                            style: TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ProfileListTile extends StatelessWidget {
  final String label;
  final IconData icon;
  final String title;
  final Function onTap;

  const ProfileListTile({
    super.key,
    required this.label,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12.0,
          ),
        ),
        InkWell(
          onTap: () {
            onTap();
          },
          child: ListTile(
            leading: Icon(icon),
            title: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13.0,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
          ),
        ),
        Divider(color: Colors.grey, thickness: 0.2),
        SizedBox(height: 8.0),
      ],
    );
  }
}
