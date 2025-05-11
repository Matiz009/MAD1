import 'package:flutter/material.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen 2', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        titleSpacing: 20,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                "https://img.freepik.com/free-vector/user-blue-gradient_78370-4692.jpg?t=st=1746601527~exp=1746605127~hmac=bf1e7de841987f0fd0d6f6701e9ed9bd87d2e14cad0dd733a8e0f9702871914b&w=900",
              ),
              radius: 15,
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment:
            MainAxisAlignment.center, // Center content vertically
        children: [
          const SizedBox(height: 20),
          IconButton.filled(
            onPressed: () {
              Navigator.pushNamed(context, "/books");
            },
            icon: Icon(Icons.book),
          ),
        ],
      ),
    );
  }
}
