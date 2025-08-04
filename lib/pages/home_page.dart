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
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final isTablet = screenWidth >= 600;
    final isDesktop = screenWidth >= 1024;
    
    return Scaffold(
      backgroundColor: backgroundColor,   
      bottomNavigationBar: SafeArea(
        child: MybottomNavBar(
          onTabChange: (index) => navigateBotttomBar(index),
        ),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            // For desktop, we can show a side navigation instead of bottom nav
            if (isDesktop && screenWidth > 1200) {
              return Row(
                children: [
                  // Side navigation for desktop
                  Container(
                    width: 250,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      border: Border(
                        right: BorderSide(color: Colors.grey[300]!),
                      ),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 40),
                        Text(
                          'Coffee Shop',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800],
                          ),
                        ),
                        const SizedBox(height: 40),
                        _buildSideNavItem(
                          icon: Icons.home,
                          label: 'Shop',
                          index: 0,
                          isSelected: _selectedindex == 0,
                        ),
                        const SizedBox(height: 16),
                        _buildSideNavItem(
                          icon: Icons.shopping_bag_outlined,
                          label: 'Cart',
                          index: 1,
                          isSelected: _selectedindex == 1,
                        ),
                      ],
                    ),
                  ),
                  // Main content
                  Expanded(
                    child: _pages[_selectedindex],
                  ),
                ],
              );
            } else {
              // Mobile and tablet layout
              return _pages[_selectedindex];
            }
          },
        ),
      ),
    );
  }
  
  Widget _buildSideNavItem({
    required IconData icon,
    required String label,
    required int index,
    required bool isSelected,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Material(
        color: isSelected ? Colors.grey[300] : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () => navigateBotttomBar(index),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: isSelected ? Colors.grey[700] : Colors.grey[500],
                  size: 24,
                ),
                const SizedBox(width: 16),
                Text(
                  label,
                  style: TextStyle(
                    color: isSelected ? Colors.grey[700] : Colors.grey[500],
                    fontSize: 16,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}