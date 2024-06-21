import 'package:flutter/material.dart';
import '../services/artist.dart';
import '../services/event.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _result = "No data";

  void _fetchData() async {
    try {
      // Appel à la fonction fetchArtist avec des paramètres de test
      final response = await fetchEvent(params: "K8vZ9175Tr0");
      setState(() {
        _result = response.toString();
      });
    } catch (e) {
      setState(() {
        _result = "Error: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _fetchData,
              child: const Text('Fetch Artist'),
            ),
            const SizedBox(height: 20),
            Text(_result),
            // Text(_test),
          ],
        ),
      ),
    );
  }
}
