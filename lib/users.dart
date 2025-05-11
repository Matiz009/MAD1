import 'package:app_one/profile.dart';
import 'package:flutter/material.dart';

class Users extends StatefulWidget {
  const Users({super.key});

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hi there")),
      body: Column(
        children: [
          TextField(controller: nameController),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Profile(nameController.text),
                ),
              );
            },
            child: Text("Send Data"),
          ),
        ],
      ),
    );
  }
}
