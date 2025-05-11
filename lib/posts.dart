import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'model.dart'; // Make sure to import your model here

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  Future<Posts> getData() async {
    var url = Uri.parse("https://reqres.in/api/users");
    var response = await http.get(url);

    print('STATUS CODE: ${response.statusCode}');
    print('BODY: ${response.body}');

    if (response.statusCode == 200) {
      return Posts.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load data: ${response.statusCode}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Users via API")),
      body: FutureBuilder<Posts>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.data.isEmpty) {
            return const Center(child: Text("No data found."));
          } else {
            var users = snapshot.data!.data;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(user.avatar),
                  ),
                  title: Text('${user.firstName} ${user.lastName}'),
                  subtitle: Text(user.email),
                );
              },
            );
          }
        },
      ),
    );
  }
}
