import 'package:flutter/material.dart';
import 'package:tanyadokter_pasien/core/widget/alert_dialog_widget.dart';
import 'package:tanyadokter_pasien/features/profile/widget/manage_profile_form.dart';

class EditProfileScreen extends StatefulWidget {
  static const routeName = '/EditProfile';

  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Profil',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 12.0),
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
                            color: Color(0xFF116487),
                            width: 4,
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 46,
                          backgroundImage:
                              NetworkImage('https://via.placeholder.com/150'),
                        ),
                      ),
                      Positioned(
                        bottom: 3,
                        right: 3,
                        child: CircleAvatar(
                          backgroundColor: Color(0xFF116487),
                          maxRadius: 14.0,
                          child: GestureDetector(
                            onTap: () {},
                            child: Icon(
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
                SizedBox(height: 12.0),
                EditProfileForm(
                    label: 'Nama Lengkap', content: 'Yusuf Abdul Wahid'),
                EditProfileForm(label: 'Jenis Kelamin', content: 'Pria'),
                EditProfileForm(
                    label: 'Nomor Handphone', content: '+6281811881818'),
                EditProfileForm(
                    label: 'E-mail', content: 'yusufwahid@mail.com'),
                EditProfileForm(
                    label: 'Alamat',
                    content: 'Jl. Jalan Sehati, No.12, Blok 3'),
                EditProfileForm(label: 'Negara', content: 'Indonesia'),
                EditProfileForm(label: 'Provinsi', content: 'Jawa Barat'),
                EditProfileForm(
                    label: 'Kabupaten/Kota', content: 'Kabupaten Bogor'),
                EditProfileForm(label: 'Kecamatan', content: 'Gunung Putri'),
                EditProfileForm(label: 'Desa/Kelurahan', content: 'Desa Dano'),
                EditProfileForm(label: 'Kode Pos', content: '45563'),
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
                  backgroundColor: Color(0xFFDDF2FF),
                  foregroundColor: Color(0xFF116487),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Batal',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(width: 12.0),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0.0,
                  backgroundColor: Color(0xFF116487),
                  foregroundColor: Color(0xFFDDF2FF),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialogSuccess(
                        label: 'Pengaturan profil berhasil diubah'),
                  );
                },
                child: Text(
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
