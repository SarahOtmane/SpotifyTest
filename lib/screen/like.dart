import 'package:flutter/material.dart';

class LikeScreen extends StatelessWidget{
  const LikeScreen({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: SingleChildScrollView(
        child: Text('List artist liked'),
      ),
    );
  }
}