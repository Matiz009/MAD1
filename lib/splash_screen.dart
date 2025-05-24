import 'package:app_one/home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? userName;

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isLoggedIn = prefs.getBool("isLoggedIn");
    String? name = prefs.getString("name");

    if (isLoggedIn == true && name != null) {
      setState(() {
        userName = name;
      });
    }

    await Future.delayed(const Duration(seconds: 3));
    if (mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color(0xFF363567),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              backgroundColor: Colors.black,
              radius: 120,
              child: CircleAvatar(
                radius: 110,
                backgroundImage: NetworkImage(
                  'https://img.freepik.com/free-vector/learning-concept-illustration_114360-6186.jpg?w=740&t=st=1680637984~exp=1680638584~hmac=0275c987703c466942859aaabaee936921121b242e57b0f873045ecf55477c8b',
                ),
              ),
            ),
            const SizedBox(height: 50),
            Text(
              'Welcome ${userName ?? ''}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Britanic Bold',
                fontSize: 25,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 100),
            const CircularProgressIndicator(color: Colors.white),
          ],
        ),
      ),
    );
  }
}
