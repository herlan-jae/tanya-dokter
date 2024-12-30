import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  static const routeName = '/PaymentScreen';

  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_rounded)),
        title: const Text(
          'Pembayaran',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
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
                            backgroundImage:
                                NetworkImage('https://via.placeholder.com/150'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 18.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'dr. Waleed Abu Kareem, S.um',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'Dokter Umum',
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
                    padding:
                        EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Harga Total',
                                style: TextStyle(fontSize: 13.0)),
                            Text('50.000', style: TextStyle(fontSize: 13.0)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Harga Total',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '50.000',
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
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            'Transfer Bank',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          trailing:
                              Icon(Icons.arrow_forward_ios_rounded, size: 20.0),
                        ),
                        ListTile(
                          title: Text(
                            'Kartu Kredit/Debit',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          trailing:
                              Icon(Icons.arrow_forward_ios_rounded, size: 20.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 60.0,
        shadowColor: Colors.black,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0.0,
            backgroundColor: Color(0xFFDDF2FF),
            foregroundColor: Color(0xFF116487),
            minimumSize: Size(370.0, 30.0),
          ),
          onPressed: () {
            Navigator.of(context).pushNamed('/MethodPayment');
          },
          child: Text(
            'Buat Transaksi',
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
