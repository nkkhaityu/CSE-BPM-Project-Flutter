import 'package:cse_bpm_project/chart/GalleryScaffold.dart';
import 'package:cse_bpm_project/chart/DashboardScreen.dart';
import 'package:cse_bpm_project/fragment/ChatFragment.dart';
import 'package:cse_bpm_project/fragment/SettingsFragment.dart';
import 'package:cse_bpm_project/secretary/SecretaryHomeFragment.dart';
import 'package:cse_bpm_project/source/MyColors.dart';
import 'package:after_layout/after_layout.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SecretaryScreen extends StatefulWidget {
  bool isCreatedNew = false;

  SecretaryScreen({Key key, this.isCreatedNew}) : super(key: key);

  @override
  _SecretaryScreenState createState() => _SecretaryScreenState();
}

class _SecretaryScreenState extends State<SecretaryScreen> with AfterLayoutMixin<SecretaryScreen> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    DashboardScreen(),
    SecretaryHomeFragment(),
    SettingsFragment(),
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
            title: Container(height: 0),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.assessment,
              color: _selectedIndex == 1 ? MyColors.brand : MyColors.mediumGray,
            ),
            title: Container(height: 0),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'images/ic-settings-24.png',
              color: _selectedIndex == 2 ? MyColors.brand : MyColors.mediumGray,
            ),
            title: Container(height: 0),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: MyColors.brand,
        onTap: _onItemTapped,
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    if (widget.isCreatedNew != null) {
      if (widget.isCreatedNew) {
        Flushbar(
          icon:
              Image.asset('images/ic-check-circle.png', width: 24, height: 24),
          message: 'Tạo yêu cầu thành công!',
          duration: Duration(seconds: 3),
          margin: EdgeInsets.all(8),
          borderRadius: 8,
        )..show(context);
        widget.isCreatedNew = false;
      }
    }
  }
}
