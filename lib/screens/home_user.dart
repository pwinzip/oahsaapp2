import 'package:flutter/material.dart';

import 'account.dart';
import 'history.dart';
import 'home.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({super.key});

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedPageIndex = 1;

  final pages = [
    const HistoryPage(),
    const HomePage(),
    const AccountPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: const Color(0xFF41D207),
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'หน้าหลัก',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Open Sans',
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
        ),
        centerTitle: true,
        // toolbarHeight: MediaQuery.of(context).size.height * 0.15,
      ),
      body: SafeArea(
        child: Center(
          child: pages.elementAt(_selectedPageIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: "ประวัติ",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "หน้าหลัก",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "บัญชี",
          ),
        ],
        selectedIconTheme: const IconThemeData(size: 30),
        unselectedIconTheme: const IconThemeData(size: 22),
        backgroundColor: const Color(0xFF41D207),
        currentIndex: _selectedPageIndex,
        unselectedItemColor: Colors.grey[600],
        selectedItemColor: const Color.fromARGB(255, 40, 88, 20),
        onTap: _onItemTapped,
      ),
    );
  }
}
