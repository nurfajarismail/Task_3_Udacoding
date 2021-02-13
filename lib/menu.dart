import 'package:flutter/material.dart';
import 'package:task_3/hitungPage.dart';
import 'package:task_3/konversiPage.dart';
import 'package:task_3/loginPage.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int _currentIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    LoginPage(),
    HitungPage(),
    KonversiPage()
  ];

  void onTab(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_currentIndex),
      // body: _list[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTab,
        currentIndex: _currentIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.login),
            label: 'Login',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Fisika',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Konversi',
          ),
        ],
      ),
    );
  }
}
