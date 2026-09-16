import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ExampleTwo extends StatefulWidget {
  const ExampleTwo({super.key});

  @override
  State<ExampleTwo> createState() => _ExampleTwoState();
}

class _ExampleTwoState extends State<ExampleTwo> {
  List<Photos> photosList = [];

  Future<List<Photos>> getPhotos() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/photos'),
    );

    var data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      photosList.clear();

      for (Map<String, dynamic> i in data) {
        Photos photo = Photos(
          title: i['title'],
          url: i['url'],
          id: i['id'],
        );

        photosList.add(photo);
      }

      return photosList;
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API Course"),
        backgroundColor: Colors.green.shade900,
        foregroundColor: Colors.white,
      ),
      body: FutureBuilder<List<Photos>>(
        future: getPhotos(),
        builder: (context, AsyncSnapshot<List<Photos>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text("No Data Found"),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                    snapshot.data![index].url,
                  ),
                ),
                title: Text(
                  snapshot.data![index].title,
                ),
                subtitle: Text(
                  "Photo ID: ${snapshot.data![index].id}",
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class Photos {
  final String title;
  final String url;
  final int id;

  Photos({
    required this.title,
    required this.url,
    required this.id,
  });
}