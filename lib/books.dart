import 'package:flutter/material.dart';

class Books extends StatefulWidget {
  const Books({super.key});

  @override
  State<Books> createState() => _BooksState();
}

class _BooksState extends State<Books> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Books")),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, "/users");
            },
            child: Icon(Icons.arrow_back),
          ),
        ],
      ),
    );
  }
}
