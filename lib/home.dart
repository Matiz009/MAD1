import 'package:app_one/books.dart';
import 'package:app_one/themeprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var likes = 0;

  void incrementLikes() {
    setState(() {
      likes = likes + 1;
    });
  }

  void decrementLikes() {
    setState(() {
      likes = likes - 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Design', style: TextStyle(color: Colors.white)),
        leading: const Icon(Icons.menu, color: Colors.white),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        titleSpacing: 20,
        actions: [
          // 🔁 Theme toggle switch
          Switch(
            value: themeProvider.isDarkMode,
            onChanged: (value) {
              themeProvider.toggleTheme(value);
            },
            activeColor: Colors.white,
          ),
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Image.asset('assets/hero-image.png'),
            Text(
              'Likes: $likes',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: incrementLikes,
                    child: const Icon(Icons.add, color: Colors.blueAccent),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: decrementLikes,
                    child: const Icon(Icons.remove, color: Colors.blueAccent),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Books()),
                );
              },
              child: const Text("Send Data"),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "/posts");
              },
              child: const Text("View Posts"),
            ),
          ],
        ),
      ),
    );
  }
}
