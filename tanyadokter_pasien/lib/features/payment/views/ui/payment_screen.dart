import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tanyadokter_pasien/features/doctor_list/data/doctor_model.dart';
import 'package:tanyadokter_pasien/features/payment/bloc/payment_bloc.dart';
import 'package:tanyadokter_pasien/features/payment/bloc/payment_event.dart';
import 'package:tanyadokter_pasien/features/payment/bloc/payment_state.dart';
import 'package:tanyadokter_pasien/features/payment/data/payment_model.dart';
import 'package:tanyadokter_pasien/features/payment/views/ui/payment_confirmation_screen.dart';
import 'package:tanyadokter_pasien/features/payment/views/widget/payment_method_widget.dart';

class PaymentScreen extends StatelessWidget {
  static const routeName = '/payment';

  final String name;
  final String category;
  final String image;
  final String price;
  final DoctorModel doctor;

  const PaymentScreen({
    super.key,
    required this.name,
    required this.category,
    required this.image,
    required this.price,
    required this.doctor,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentBloc(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_rounded),
          ),
          title: const Text(
            'Pembayaran',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: BlocBuilder<PaymentBloc, PaymentState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18.0, vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Konsultasi dengan'),
                      SizedBox(height: 24.0),
                      Row(
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: 77,
                                height: 77,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Color(0xFF116487),
                                    width: 3,
                                  ),
                                ),
                                child: CircleAvatar(
                                  radius: 36,
                                  backgroundImage: NetworkImage(image),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 18.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                name,
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                category,
                                style: TextStyle(
                                  fontSize: 12.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 24.0),
                      Container(
                        height: 130.0,
                        width: 370.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFD7F0FF),
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 32.0, vertical: 24.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Harga Total',
                                      style: TextStyle(fontSize: 13.0)),
                                  Text('Rp. $price',
                                      style: TextStyle(fontSize: 13.0)),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Harga Total',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Rp. $price',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 36.0),
                      Text('Metode Pembayaran'),
                      SizedBox(height: 18.0),
                      Container(
                        width: 370.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFD7F0FF),
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 12.0),
                          child: Column(
                            children: paymentMethod.map((method) {
                              return ListTile(
                                title: Text(
                                  method.paymentName,
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                trailing: Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 20.0,
                                ),
                                onTap: () {
                                  context.read<PaymentBloc>().add(
                                        SelectPaymentMethod(
                                          method.id,
                                          method.paymentName,
                                        ),
                                      );
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return BlocProvider.value(
                                        value: context.read<PaymentBloc>(),
                                        child: PaymentMethodWidget(
                                          paymentName: method.paymentName,
                                          options: method.paymentOptions,
                                          onSelect: (option) {
                                            context.read<PaymentBloc>().add(
                                                  SelectPaymentMethod(
                                                    method.id,
                                                    method.paymentName,
                                                  ),
                                                );
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      );
                                    },
                                  );
                                },
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      if (state is PaymentMethodSelected)
                        Padding(
                          padding: const EdgeInsets.only(top: 24.0),
                          child: Container(
                            width: 370.0,
                            padding: EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                              color: Color(0xFFD7F0FF),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Text(
                              'Metode pembayaran yang dipilih: ${state.paymentOptions}',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
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
          height: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (context.read<PaymentBloc>().state is PaymentMethodSelected)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Metode yang dipilih: ${(context.read<PaymentBloc>().state as PaymentMethodSelected).methodName}',
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0.0,
                  backgroundColor: Color(0xFFDDF2FF),
                  foregroundColor: Color(0xFF116487),
                  minimumSize: Size(370.0, 30.0),
                ),
                onPressed:
                    context.read<PaymentBloc>().state is PaymentMethodSelected
                        ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PaymentConfirmScreen(
                                  name: doctor.name,
                                  category: doctor.category,
                                  image: doctor.image,
                                  doctor: doctor,
                                ),
                              ),
                            );
                          }
                        : null,
                child: Text(
                  'Buat Transaksi',
                  style: TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
