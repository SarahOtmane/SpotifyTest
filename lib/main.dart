import 'package:flutter/material.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'screen/device.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Pour enlever la barre de debug
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: DeviceScreen(),
        ),
      ),
    );
  }
}
