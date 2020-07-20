import 'package:cse_bpm_project/screen/HomeFragment.dart';
import 'package:cse_bpm_project/screen/NoChat.dart';
import 'package:cse_bpm_project/screen/Setting.dart';
import 'package:cse_bpm_project/secretary/SecretaryHomeFragment.dart';
import 'package:cse_bpm_project/source/MyColors.dart';

import 'package:flutter/material.dart';

class SecretaryHomeScreen extends StatefulWidget {
  const SecretaryHomeScreen({Key key}) : super(key: key);

  @override
  _SecretaryHomeScreenState createState() => _SecretaryHomeScreenState();
}

class _SecretaryHomeScreenState extends State<SecretaryHomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    SecretaryHomeFragment(),
    NoChatScreen(),
    SettingScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _selectedIndex == 0 ? MyColors.brand : MyColors.mediumGray,
            ),
            title: Text('Trang chủ'),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'images/ic-chat-24.png',
              color: _selectedIndex == 1 ? MyColors.brand : MyColors.mediumGray,
            ),
            title: Text('Chat'),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'images/ic-settings-24.png',
              color: _selectedIndex == 2 ? MyColors.brand : MyColors.mediumGray,
            ),
            title: Text('Cài đặt'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: MyColors.brand,
        onTap: _onItemTapped,
      ),
    );
  }
}
