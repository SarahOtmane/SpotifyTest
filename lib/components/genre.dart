import 'package:flutter/material.dart';

class Genre extends StatelessWidget {
  const Genre({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.purple,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
          child: const Row(
            children: [
              Icon(Icons.circle, color: Colors.white, size: 8),
              SizedBox(width: 8),
              Text('Legend',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center),
              SizedBox(width: 8),
            ],
          ),
        ),
      ],
    );
  }
}
