import 'dart:convert';
import 'package:app_one/postdetails.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'model-2.dart';

class Posts2 extends StatefulWidget {
  const Posts2({super.key});

  @override
  State<Posts2> createState() => _Posts2State();
}

class _Posts2State extends State<Posts2> {
  Future<List<PostsModel>> fetchPosts() async {
    final url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map((json) => PostsModel.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load posts: ${response.statusCode}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts via API"),
        backgroundColor: Colors.blueAccent,
      ),
      body: FutureBuilder<List<PostsModel>>(
        future: fetchPosts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No post found."));
          } else {
            final posts = snapshot.data!;
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Postdetails(post),
                      ),
                    );
                  },
                  child: Card(
                    margin: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            post.title,
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(post.body),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
