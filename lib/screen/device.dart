import 'package:flutter/material.dart';
import 'package:spotify/screen/like.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spotify/screen/listArtist.dart';

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
    const ListArtistScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screenList[_currentScreen],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xFFB503D2), 
        unselectedItemColor: Colors.black,
        iconSize: 35,
        currentIndex: _currentScreen,
        onTap: onTabTapped,
        showSelectedLabels: false, 
        showUnselectedLabels: false, 
        items: const [
          BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.house), label: 'Home'),
          BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.heart), label: 'Artists likés'),
          BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.music), label: 'Concerts'),
          BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.list), label: 'lists'),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentScreen = index;
    });
  }
}
