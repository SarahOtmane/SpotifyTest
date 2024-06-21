import 'package:flutter/material.dart';
import '../components/color.dart';

class DetailsArtistScreen extends StatefulWidget {
  const DetailsArtistScreen({super.key});

  @override
  _DetailsArtistScreenState createState() => _DetailsArtistScreenState();
}

class _DetailsArtistScreenState extends State<DetailsArtistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('../assets/mj.jpg'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 20,
                  left: 25,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.25),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 4.0, horizontal: 8.0),
                    child: const Text(
                      'Mickael Jackson',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 15,
                  left: 25,
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 4.0, horizontal: 8.0),
                        child: const Row(
                          children: [
                            Icon(Icons.circle, color: Colors.white, size: 8),
                            SizedBox(width: 8),
                            Text('Pop',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center),
                            SizedBox(width: 8),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 4.0, horizontal: 8.0),
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
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'This is a full-width text below the image his is a full-width text below the image his is a full-width text below the image his is a full-width text below the image his is a full-width text below the image his is a full-width text below the image.',
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}
