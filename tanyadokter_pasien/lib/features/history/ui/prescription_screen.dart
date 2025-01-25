import 'package:flutter/material.dart';
import 'package:tanyadokter_pasien/app/session_helper.dart';
import 'package:tanyadokter_pasien/core/constant/assets_manager.dart';
import 'package:tanyadokter_pasien/core/widget/alert_dialog_widget.dart';
import 'package:tanyadokter_pasien/core/widget/loading_widget.dart';

class PrescriptionScreen extends StatefulWidget {
  static const routeName = '/resep';

  const PrescriptionScreen({super.key});

  @override
  State<PrescriptionScreen> createState() => _PrescriptionScreenState();
}

class _PrescriptionScreenState extends State<PrescriptionScreen> {
  Future<Map<String, String?>> getUserData() async {
    final userData = await SessionHelper.getUserSession();
    return userData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Resep Obat',
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
                padding: EdgeInsets.symmetric(
                  horizontal: 18.0,
                  vertical: 12.0,
                ),
                child: Column(
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
                    SizedBox(height: 18.0),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        color: Color(0xFFDDF2FF),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.sick_outlined),
                                    SizedBox(width: 8.0),
                                    Text('Keluhan',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                SizedBox(height: 12.0),
                                Text(
                                  'Batuk pilek disertai gejala demam',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 12.0),
                                Divider(
                                    color: Color(0xFF116487), thickness: 0.3),
                                SizedBox(height: 12.0),
                                Row(
                                  children: [
                                    Icon(Icons.medication_rounded),
                                    SizedBox(width: 8.0),
                                    Text('Resep Obat',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                PrescriptionDetail(),
                                PrescriptionDetail(),
                                PrescriptionDetail(),
                                PrescriptionDetail(),
                                PrescriptionDetail(),
                                SizedBox(height: 12.0),
                                Divider(
                                    color: Color(0xFF116487), thickness: 0.3),
                                SizedBox(height: 12.0),
                                Row(
                                  children: [
                                    Icon(Icons.edit_note),
                                    SizedBox(width: 8.0),
                                    Text('Catatan Dokter',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                SizedBox(height: 12.0),
                                Text(
                                  'Jika batuk masih berlanjut, perlu diganti resep obat',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 12.0),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        height: 60.0,
        shadowColor: Colors.black,
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
              elevation: 0.0,
              backgroundColor: Color(0xFFDDF2FF),
              foregroundColor: Color(0xFF116487),
              minimumSize: Size(370.0, 30.0)),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialogFailed(
                  label: 'Maaf, fitur ini belum tersedia',
                  function: () {
                    Navigator.of(context).pop();
                  }),
            );
          },
          icon: Icon(Icons.print_rounded, size: 18.0),
          label: Text(
            'Cetak',
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

class EmptyPrescription extends StatelessWidget {
  const EmptyPrescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset(AssetsManager.noRecipeImage),
          SizedBox(height: 12.0),
          Text('Dokter tidak membuat resep untuk konsultasi ini')
        ],
      ),
    );
  }
}

class PrescriptionDetail extends StatelessWidget {
  const PrescriptionDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 12.0),
        Row(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    'Paracetamol',
                    style: TextStyle(
                      fontSize: 8.0,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 4.0),
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    '3x sehari',
                    style: TextStyle(
                      fontSize: 8.0,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 4.0),
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    'Sesudah makan',
                    style: TextStyle(
                      fontSize: 8.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
