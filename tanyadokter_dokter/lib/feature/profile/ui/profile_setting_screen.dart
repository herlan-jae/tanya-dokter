import 'package:flutter/material.dart';
import 'package:tanyadokter_dokter/feature/profile/widget/profile_form.dart';

class ProfileSettingScreen extends StatelessWidget {
  static const routeName = '/profile-settings';
  const ProfileSettingScreen({super.key});

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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 12.0),
                Align(
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      Container(
                        width: 88,
                        height: 88,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xFF116487),
                            width: 4,
                          ),
                        ),
                        child: const CircleAvatar(
                          radius: 46,
                          backgroundImage:
                              NetworkImage('https://via.placeholder.com/150'),
                        ),
                      ),
                      Positioned(
                        bottom: 3,
                        right: 3,
                        child: CircleAvatar(
                          backgroundColor: const Color(0xFF116487),
                          maxRadius: 14.0,
                          child: GestureDetector(
                            onTap: () {},
                            child: const Icon(
                              Icons.photo_camera,
                              color: Colors.white,
                              size: 14.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12.0),
                const EditProfileForm(
                    label: 'Nama Lengkap', content: 'Yusuf Abdul Wahid'),
                const EditProfileForm(label: 'Jenis Kelamin', content: 'Pria'),
                const EditProfileForm(
                    label: 'Nomor Handphone', content: '+6281811881818'),
                const EditProfileForm(
                    label: 'E-mail', content: 'yusufwahid@mail.com'),
                const EditProfileForm(
                    label: 'Alamat',
                    content: 'Jl. Jalan Sehati, No.12, Blok 3'),
                const EditProfileForm(label: 'Negara', content: 'Indonesia'),
                const EditProfileForm(label: 'Provinsi', content: 'Jawa Barat'),
                const EditProfileForm(
                    label: 'Kabupaten/Kota', content: 'Kabupaten Bogor'),
                const EditProfileForm(
                    label: 'Kecamatan', content: 'Gunung Putri'),
                const EditProfileForm(
                    label: 'Desa/Kelurahan', content: 'Desa Dano'),
                const EditProfileForm(label: 'Kode Pos', content: '45563'),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 60.0,
        shadowColor: Colors.black,
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0.0,
                  backgroundColor: const Color(0xFFDDF2FF),
                  foregroundColor: const Color(0xFF116487),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Batal',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(width: 12.0),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0.0,
                  backgroundColor: const Color(0xFF116487),
                  foregroundColor: const Color(0xFFDDF2FF),
                ),
                onPressed: () {},
                child: const Text(
                  'Simpan',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
