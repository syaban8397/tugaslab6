import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Map<String, String> data;

  const DetailPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, // judul di tengah
        title: Text(data['title']!),
        backgroundColor: Colors.pinkAccent,
      ),

      body: Column(
        children: [
          Image.network(
            data['image']!,
            height: 250,
            width: double.infinity,
            fit: BoxFit.cover,
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              data['desc']!,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
