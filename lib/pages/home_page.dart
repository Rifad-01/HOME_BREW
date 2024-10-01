import 'package:first_app/components/botttom_nav_bar.dart';
import 'package:first_app/pages/cart_page.dart';
import 'package:first_app/pages/const.dart';
import 'package:first_app/pages/shop_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


int _selectedindex = 0;
void navigateBotttomBar(int index) {
  setState(() {
    _selectedindex = index;
  });
}


final List<Widget> _pages = [

ShopPage(),

CartPage(),

];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,   
      bottomNavigationBar: MybottomNavBar(
        onTabChange: (index) => navigateBotttomBar(index),
      ),
      body: _pages[_selectedindex],
    );
  }
}