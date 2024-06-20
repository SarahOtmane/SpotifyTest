// screen/device.dart
import 'package:flutter/material.dart';
import 'package:spotify/screen/like.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'home.dart';
import 'like.dart';
import 'concerts.dart';

class DeviceScreen extends StatefulWidget {
  @override
  _DeviceScreenState createState() => _DeviceScreenState();
}

class _DeviceScreenState extends State<DeviceScreen> {
  int _currentScreen = 0;
  final List<Widget> _screenList = [
    const HomeScreen(),
    const LikeScreen(),
    const ConcertsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
      return Scaffold(
      body: _screenList[_currentScreen],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.black,
          iconSize: 35,
          currentIndex: _currentScreen,
          onTap: onTabTapped,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.heart), label: 'Artists likés'),
            BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.music), label: 'Concerts'),
          ]),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentScreen = index;
    });
  }
}
