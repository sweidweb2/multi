import 'package:flutter/material.dart';
import 'package:udemy_project2/main_screens/cart.dart';
import 'package:udemy_project2/main_screens/home.dart';
import 'package:udemy_project2/main_screens/profile.dart';
import 'package:udemy_project2/main_screens/store.dart';
import 'category.dart';

class CustomerHomeScreen extends StatefulWidget {
  const CustomerHomeScreen({super.key});

  @override
  State<CustomerHomeScreen> createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {

  int _selectedindex=0;
  final List<Widget> tabs=const[
    HomeScreen(),
    CategoryScreen(),
    StoresScreen(),
    CartScreen(),
    ProfileScreen(),
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
              icon: Icon(Icons.shopping_cart),
              label: 'Cart'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'profile'
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
