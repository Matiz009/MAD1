import 'package:app_one/model-2.dart';
import 'package:flutter/material.dart';

class Postdetails extends StatefulWidget {
  late PostsModel post;
  Postdetails(this.post, {super.key});

  @override
  State<Postdetails> createState() => _PostdetailsState();
}

class _PostdetailsState extends State<Postdetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post Details"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.post.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(widget.post.body, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
