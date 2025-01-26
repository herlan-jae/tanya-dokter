import 'package:flutter/material.dart';
import 'package:tanyadokter_pasien/core/widget/alert_dialog_widget.dart';
import 'package:tanyadokter_pasien/features/consultation/doctor_list/data/doctor_model.dart';
import 'package:tanyadokter_pasien/features/consultation/doctor_list/views/widget/doctor_card.dart';
import 'package:tanyadokter_pasien/features/consultation/doctor_list/views/widget/doctor_profile.dart';
import 'package:tanyadokter_pasien/features/consultation/payment/views/ui/payment_screen.dart';

class DoctorListScreen extends StatelessWidget {
  static const routeName = '/doctor-list';
  final List<DoctorModel> doctors;
  final String categoryName;

  const DoctorListScreen({
    super.key,
    required this.doctors,
    required this.categoryName,
  });

  void showDoctorDetail(BuildContext context, DoctorModel doctor) {
    if (doctor.status) {
      showDialog(
        context: context,
        builder: (context) => ShowDoctorProfile(
          name: doctor.name,
          category: doctor.category,
          image: doctor.image,
          description: doctor.description,
          patient: doctor.patient,
          price: doctor.price,
          status: doctor.status,
          paymentFunction: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PaymentScreen(
                  doctor: doctor,
                  name: doctor.name,
                  category: doctor.category,
                  image: doctor.image,
                  price: doctor.price,
                ),
              ),
            );
          },
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialogFailed(
            label: 'Maaf, dokter sedang tidak aktif',
            function: () {
              Navigator.of(context).pop();
            }),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_rounded),
        ),
        title: Text(
          categoryName,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: doctors.length,
                  itemBuilder: (context, index) {
                    final doctor = doctors[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: DoctorCard(
                        name: doctor.name,
                        category: doctor.category,
                        image: doctor.image,
                        patient: doctor.patient,
                        price: doctor.price,
                        rating: doctor.rating,
                        status: doctor.status,
                        function: () => showDoctorDetail(context, doctor),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
