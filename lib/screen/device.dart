import 'package:flutter/material.dart';
import 'package:spotify/screen/like.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import 'home.dart';
import 'concerts.dart';
import '../components/color.dart';

class DeviceScreen extends StatefulWidget {
  const DeviceScreen({super.key});

  @override
  _DeviceScreenState createState() => _DeviceScreenState();
}

class _DeviceScreenState extends State<DeviceScreen> {
  int _currentScreen = 0;
  final List<Widget> _screenList = [
    HomeScreen(),
    LikeScreen(),
    ConcertsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screenList[_currentScreen],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.black,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.white,
        currentIndex: _currentScreen,
        onTap: onTabTapped,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.house, size: 25.0,), label: 'Home'),
          BottomNavigationBarItem(
              icon: FaIcon(Icons.favorite, size: 30.0), label: 'Artists likés'),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.music, size: 25.0,), label: 'Concerts'),
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
