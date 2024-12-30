import 'package:flutter/material.dart';

class ChatSessionScreen extends StatefulWidget {
  static const routeName = '/ChatSession';

  const ChatSessionScreen({super.key});

  @override
  State<ChatSessionScreen> createState() => _ChatSessionScreenState();
}

class _ChatSessionScreenState extends State<ChatSessionScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 70,
        foregroundColor: Colors.white,
        toolbarHeight: 80.0,
        backgroundColor: Color(0xFF116487),
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Stack(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 3,
                  ),
                ),
                child: CircleAvatar(
                  backgroundImage:
                  NetworkImage('https://via.placeholder.com/150'),
                ),
              ),
            ],
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'dr. Waleed Abu Kareem, S.um',
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Dokter Umum',
              style: TextStyle(
                fontSize: 11.0,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: 180.0,
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 16),
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          decoration: BoxDecoration(
                            color: Color(0xFF40B5E3),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(16.0),
                              topLeft: Radius.circular(16.0),
                              topRight: Radius.circular(16.0),
                            ),
                          ),
                          child: Text(
                            'Halo dok, saya merasakan gejala batuk pilek, kira-kira penyebabnya apa ya?',
                            style: const TextStyle(
                                fontSize: 12.0, color: Colors.white),
                          ),
                        ),
                      ),
                      Text(
                        '13.59',
                        style: TextStyle(
                          fontSize: 8.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: 180.0,
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 16),
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          decoration: BoxDecoration(
                            color: Color(0xFFB9E4FF),
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(16.0),
                              topLeft: Radius.circular(16.0),
                              topRight: Radius.circular(16.0),
                            ),
                          ),
                          child: Text(
                            'Halo! Gejala batuk dan pilek bisa disebabkan oleh beberapa hal, paling sering adalah infeksi virus seperti flu biasa (common cold) atau infeksi saluran pernapasan atas lainnya. Namun, beberapa faktor lain juga bisa memicu batuk dan pilek seperti alergi debu atau bulu hewan, infeksi bakteri, polusi udara.\nBiasanya, gejala seperti ini bisa membaik dalam beberapa hari dengan istirahat cukup, minum air hangat, dan menjaga tubuh tetap terhidrasi. ',
                            style: const TextStyle(
                                fontSize: 12.0, color: Colors.black),
                          ),
                        ),
                      ),
                      Text(
                        '14.00',
                        style: TextStyle(
                          fontSize: 8.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: 'Ketik pesan...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 2.0,
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 15.0,
                        ),
                      ),
                    ),

                  ),
                  const SizedBox(width: 8.0),
                  IconButton(
                    onPressed: () {
                      print('Pesan dikirim: ${_controller.text}');
                      _controller.clear();
                    },
                    icon: const Icon(
                      Icons.send_rounded,
                      color: Color(0xFF086E96),
                      size: 30.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
