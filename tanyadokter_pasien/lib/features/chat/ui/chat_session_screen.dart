import 'package:flutter/material.dart';

class ChatSessionScreen extends StatefulWidget {
  static const routeName = '/chat';

  const ChatSessionScreen({super.key});

  @override
  State<ChatSessionScreen> createState() => _ChatSessionScreenState();
}

class _ChatSessionScreenState extends State<ChatSessionScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 70,
        foregroundColor: Colors.white,
        toolbarHeight: 80.0,
        backgroundColor: Color(0xFF116487),
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: Row(
            children: [
              SizedBox(width: 4.0),
              Icon(Icons.arrow_back_rounded),
              Stack(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                    child: CircleAvatar(
                      backgroundImage:
                          NetworkImage('https://via.placeholder.com/150'),
                    ),
                  ),
                ],
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                physics: ScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  bool isMe = index % 2 == 0;
                  return Container(
                    margin: EdgeInsets.only(bottom: 12.0),
                    child: Row(
                      mainAxisAlignment: isMe
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: isMe ? Color(0xFF40B5E3) : Color(0xFFB9E4FF),
                            borderRadius: isMe
                                ? BorderRadius.only(
                                    bottomLeft: Radius.circular(12.0),
                                    topLeft: Radius.circular(12.0),
                                    topRight: Radius.circular(12.0),
                                  )
                                : BorderRadius.only(
                                    bottomRight: Radius.circular(12.0),
                                    topLeft: Radius.circular(12.0),
                                    topRight: Radius.circular(12.0),
                                  ),
                          ),
                          constraints: BoxConstraints(
                            maxWidth: size.width * 0.6,
                          ),
                          child: Text(
                            'Hallo Dog jebdbhcbehbchbdhfbjhjhjhjhjhjhhjhjhjhjhjh',
                            style: TextStyle(fontSize: 11.0),
                          ),
                        )
                      ],
                    ),
                  );
                },
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
                        style: TextStyle(fontSize: 11.0),
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
      ),
    );
  }
}
