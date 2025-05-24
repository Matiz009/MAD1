import 'package:app_one/themeprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'books.dart';
import 'posts.dart';
import 'screen2.dart';
import 'splash_screen.dart';
import 'users.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.blue,
  fontFamily: 'Roboto',
  useMaterial3: true,
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.deepPurple,
  fontFamily: 'Roboto',
  useMaterial3: true,
);

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
        '/two': ((context) => Screen2()),
        '/books': ((context) => Books()),
        '/posts': ((context) => PostsScreen()),
        '/users': ((context) => Users()),
      },
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeProvider.themeMode,
    );
  }
}
