import 'package:flutter/material.dart';

class ParametersScreen extends StatelessWidget {

  const ParametersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw Scaffold(
      appBar: AppBar(
        title: const Text("All parameters"),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 /2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20 ),
        children: [
          
        ],
      ),
    );
  }
}