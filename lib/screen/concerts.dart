import 'package:flutter/material.dart';

class ConcertsScreen extends StatelessWidget{
  const ConcertsScreen({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: SingleChildScrollView(
        child: Text('Recherche concerts'),
      ),
    );
  }
}