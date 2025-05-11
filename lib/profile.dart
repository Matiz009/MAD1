import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  String Name;
  Profile(this.Name, {super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Welcome ${widget.Name}")));
  }
}
