import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tanyadokter_dokter/app/session_helper.dart';
import 'package:tanyadokter_dokter/constant/alert_dialog_widget.dart';

class EditProfileScreen extends StatefulWidget {
  static const routeName = '/edit';

  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  File? _imageFile;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _provinceController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _villageController = TextEditingController();
  final TextEditingController _zipCodeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  Future<void> loadUserData() async {
    final userData = await SessionHelper.getUserSession();
    setState(() {
      _nameController.text = userData["fullname"] ?? "";
      _genderController.text = userData["gender"] ?? "";
      _phoneController.text = userData["phone"] ?? "";
      _emailController.text = userData["email"] ?? "";
      _addressController.text = userData["address"] ?? "";
      _countryController.text = userData["country"] ?? "";
      _provinceController.text = userData["province"] ?? "";
      _cityController.text = userData["city"] ?? "";
      _districtController.text = userData["district"] ?? "";
      _villageController.text = userData["village"] ?? "";
      _zipCodeController.text = userData["zip_code"] ?? "";
    });
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _imageFile = File(image.path);
      });
    }
  }

  void handleSubmit() async {
    if (_formKey.currentState!.validate()) {}
  }

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
      body: Form(
        key: _formKey,
        child: SafeArea(
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
                    child: GestureDetector(
                      onTap: pickImage,
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
                            child: CircleAvatar(
                              radius: 46,
                              backgroundImage: _imageFile != null
                                  ? FileImage(_imageFile!)
                                  : const NetworkImage(
                                      'https://cdn.pixabay.com/photo/2024/08/13/11/57/ai-generated-8965819_960_720.png'),
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
                  ),
                  const SizedBox(height: 12.0),
                  editFormField(
                    label: 'Nama Lengkap',
                    controller: _nameController,
                    validator: (value) => value?.isEmpty ?? true
                        ? 'Nama tidak boleh kosong'
                        : null,
                  ),
                  editFormField(
                    label: 'Jenis Kelamin',
                    controller: _genderController,
                    validator: (value) => value?.isEmpty ?? true
                        ? 'Jenis Kelamin tidak boleh kosong'
                        : null,
                  ),
                  editFormField(
                    label: 'Nomor Handphone',
                    controller: _phoneController,
                    validator: (value) => value?.isEmpty ?? true
                        ? 'Nomor Handphone tidak boleh kosong'
                        : null,
                  ),
                  editFormField(
                    label: 'E-mail',
                    controller: _emailController,
                    validator: (value) => value?.isEmpty ?? true
                        ? 'E-mail tidak boleh kosong'
                        : null,
                  ),
                  editFormField(
                    label: 'Alamat',
                    controller: _addressController,
                    validator: (value) => value?.isEmpty ?? true
                        ? 'Alamat tidak boleh kosong'
                        : null,
                  ),
                  editFormField(
                    label: 'Negara',
                    controller: _countryController,
                    validator: (value) => value?.isEmpty ?? true
                        ? 'Negara tidak boleh kosong'
                        : null,
                  ),
                  editFormField(
                    label: 'Provinsi',
                    controller: _provinceController,
                    validator: (value) => value?.isEmpty ?? true
                        ? 'Provinsi tidak boleh kosong'
                        : null,
                  ),
                  editFormField(
                    label: 'Kabupaten/Kota',
                    controller: _cityController,
                    validator: (value) => value?.isEmpty ?? true
                        ? 'Kabupaten/kota tidak boleh kosong'
                        : null,
                  ),
                  editFormField(
                    label: 'Kecamatan',
                    controller: _districtController,
                    validator: (value) => value?.isEmpty ?? true
                        ? 'Kecamatan tidak boleh kosong'
                        : null,
                  ),
                  editFormField(
                    label: 'Desa/Kelurahan',
                    controller: _villageController,
                    validator: (value) => value?.isEmpty ?? true
                        ? 'Desa/Kelurahan tidak boleh kosong'
                        : null,
                  ),
                  editFormField(
                    label: 'Kode Pos',
                    controller: _zipCodeController,
                    validator: (value) => value?.isEmpty ?? true
                        ? 'Kode Pos tidak boleh kosong'
                        : null,
                  ),
                ],
              ),
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
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialogSuccess(
                        function: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                        },
                        label: 'Pengaturan profil berhasil diubah'),
                  );
                },
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

  Widget editFormField({
    required String label,
    required TextEditingController controller,
    required String? Function(String?) validator,
    TextInputType? keyboardType,
    int? maxLines,
    String? gender,
  }) {
    if (label == "Jenis Kelamin") {
      return Padding(
        padding: const EdgeInsets.only(bottom: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6.0),
            DropdownButtonFormField<String>(
              value: gender,
              onChanged: (value) {
                setState(() {
                  controller.text = value ?? '';
                });
              },
              items: ['', 'm', 'f'].map((gender) {
                return DropdownMenuItem<String>(
                  value: gender,
                  child: Text(gender.toUpperCase()),
                );
              }).toList(),
              style: const TextStyle(fontSize: 13.0),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                contentPadding: const EdgeInsets.all(12.0),
              ),
            ),
          ],
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.only(bottom: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6.0),
          TextFormField(
            controller: controller,
            validator: validator,
            keyboardType: keyboardType,
            style: const TextStyle(fontSize: 13.0),
            maxLines: maxLines ?? 1,
            decoration: InputDecoration(
              hintStyle: const TextStyle(fontSize: 11.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              contentPadding: const EdgeInsets.all(12.0),
            ),
          ),
        ],
      ),
    );
  }
}
