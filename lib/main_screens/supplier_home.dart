import 'package:flutter/material.dart';
import 'package:udemy_project2/main_screens/cart.dart';
import 'package:udemy_project2/main_screens/dashboard.dart';
import 'package:udemy_project2/main_screens/home.dart';
import 'package:udemy_project2/main_screens/profile.dart';
import 'package:udemy_project2/main_screens/store.dart';
import 'category.dart';

class SupplierHomeScreen extends StatefulWidget {
  const SupplierHomeScreen({super.key});

  @override
  State<SupplierHomeScreen> createState() => _SupplierHomeScreen();
}

class _SupplierHomeScreen extends State<SupplierHomeScreen> {

  int _selectedindex=0;
  final List<Widget> tabs=const[
    HomeScreen(),
    CategoryScreen(),
    StoresScreen(),
    DashboardScreen(),
    Center(child: Text('upload'),),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w600,
        ),
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        currentIndex: _selectedindex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',

          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Category'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.shop),
              label: 'Stores'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: 'Dashboard'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.upload),
              label: 'Upload'
          ),
        ],
        onTap: (index){
          setState(() {
            _selectedindex=index;
          });
        },
      ),
      body: tabs[_selectedindex],
    );
  }
}
