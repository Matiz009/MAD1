import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  final String Name;
  Profile(this.Name, {super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  SharedPreferences? prefs;
  saveUser(String name) async {
    prefs = await SharedPreferences.getInstance();
    prefs?.setString("name", name);
    prefs?.setBool("isLoggedIn", true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Welcome ${widget.Name}")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Welcome to your profile"),
            const SizedBox(height: 20),
            Text("Name: ${widget.Name}"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                saveUser(widget.Name);
              },
              child: const Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
