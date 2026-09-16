import 'package:flutter/material.dart';

class LastExampleScreen extends StatefulWidget{
  const LastExampleScreen({super.key});
  @override
  State<LastExampleScreen> createState()=>_LastExampleScreenState();
}
class _LastExampleScreenState extends State<LastExampleScreen>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("API"),
        centerTitle: true,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          
        ],
      ),
    );
  }
}