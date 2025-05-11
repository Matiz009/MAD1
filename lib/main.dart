import 'package:app_one/books.dart';
import 'package:app_one/posts.dart';
import 'package:app_one/screen2.dart';
import 'package:app_one/splash_screen.dart';
import 'package:app_one/users.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: SplashScreen(),
      routes: {
        '/two': ((context) => Screen2()),
        '/books': ((context) => Books()),
        '/posts': ((context) => PostsScreen()),
        '/users': ((context) => Users()),
      },
    ),
  );
}
