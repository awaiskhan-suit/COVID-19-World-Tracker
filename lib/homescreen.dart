import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'models/posts_model.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Homescreen> {

  Future<List<PostsModel>> getPostApi() async {

    List<PostsModel> postList = [];

    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
    );

    if (response.statusCode == 200) {

      var data = jsonDecode(response.body);

      for (Map<String, dynamic> i in data) {
        postList.add(
          PostsModel.fromJson(i),
        );
      }

      return postList;

    } else {

      throw Exception("Failed to load posts");

    }
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xffF5F7FB),

      appBar: AppBar(

        elevation: 0,

        centerTitle: true,

        title: const Text(
          "Posts API",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),

        flexibleSpace: Container(

          decoration: const BoxDecoration(

            gradient: LinearGradient(

              colors: [
                Color(0xff11998e),
                Color(0xff38ef7d),
              ],

              begin: Alignment.topLeft,
              end: Alignment.bottomRight,

            ),
          ),
        ),

        foregroundColor: Colors.white,

      ),


      body: FutureBuilder<List<PostsModel>>(

        future: getPostApi(),

        builder: (context, snapshot) {


          if(snapshot.connectionState == ConnectionState.waiting){

            return const Center(

              child: CircularProgressIndicator(
                color: Colors.green,
              ),

            );

          }


          if(snapshot.hasError){

            return Center(

              child: Column(

                mainAxisAlignment: MainAxisAlignment.center,

                children: [

                  const Icon(
                    Icons.error_outline,
                    size: 60,
                    color: Colors.red,
                  ),

                  const SizedBox(height: 10),

                  Text(
                    snapshot.error.toString(),
                    textAlign: TextAlign.center,
                  ),

                ],
              ),
            );

          }


          List<PostsModel> posts = snapshot.data!;


          return ListView.builder(

            padding: const EdgeInsets.all(15),

            itemCount: posts.length,


            itemBuilder: (context,index){


              return Container(

                margin: const EdgeInsets.only(bottom: 15),

                decoration: BoxDecoration(

                  color: Colors.white,

                  borderRadius: BorderRadius.circular(18),

                  boxShadow: [

                    BoxShadow(

                      color: Colors.black.withOpacity(0.08),

                      blurRadius: 10,

                      offset: const Offset(0,5),

                    )

                  ],

                ),


                child: Padding(

                  padding: const EdgeInsets.all(16),

                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.start,


                    children: [


                      Row(

                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [


                          Container(

                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),

                            decoration: BoxDecoration(

                              color: Colors.green.shade50,

                              borderRadius:
                              BorderRadius.circular(20),

                            ),

                            child: Text(

                              "Post #${index+1}",

                              style: TextStyle(

                                color: Colors.green.shade700,

                                fontWeight: FontWeight.bold,

                              ),

                            ),

                          ),



                          CircleAvatar(

                            radius: 18,

                            backgroundColor:
                            Colors.green.shade100,

                            child: Text(

                              posts[index].userId.toString(),

                              style: TextStyle(

                                color: Colors.green.shade800,

                                fontWeight: FontWeight.bold,

                              ),

                            ),

                          )


                        ],
                      ),



                      const SizedBox(height:15),



                      Text(

                        posts[index].title,

                        style: const TextStyle(

                          fontSize:18,

                          fontWeight: FontWeight.bold,

                          color: Colors.black87,

                        ),

                      ),



                      const SizedBox(height:10),



                      Text(

                        posts[index].body,

                        style: TextStyle(

                          fontSize:15,

                          height:1.5,

                          color: Colors.grey.shade700,

                        ),

                      ),


                    ],

                  ),
                ),
              );

            },

          );


        },

      ),

    );
  }
}