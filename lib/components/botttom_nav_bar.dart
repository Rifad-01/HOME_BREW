import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MybottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
   MybottomNavBar({super.key, required this.onTabChange,});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isTablet = screenWidth >= 600;
    final isDesktop = screenWidth >= 1024;
    
    // Calculate responsive margins and padding
    final horizontalMargin = isDesktop 
        ? screenWidth * 0.15 
        : isTablet 
            ? screenWidth * 0.1 
            : screenWidth * 0.06;
    
    final verticalMargin = isDesktop 
        ? 30.0 
        : isTablet 
            ? 25.0 
            : 20.0;
    
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: horizontalMargin,
        vertical: verticalMargin,
      ),
      child: GNav(
        onTabChange:(value) => onTabChange!(value),
        color: Colors.grey[400],
        mainAxisAlignment: MainAxisAlignment.center,
        activeColor: Colors.grey[700],
        tabBackgroundColor: Colors.grey.shade300,
        tabBorderRadius: isDesktop ? 28 : isTablet ? 26 : 24,
        tabActiveBorder: Border.all(color: Colors.white),
        gap: isDesktop ? 12 : isTablet ? 10 : 8,
        iconSize: isDesktop ? 28 : isTablet ? 24 : 20,
        textStyle: TextStyle(
          fontSize: isDesktop ? 16 : isTablet ? 14 : 12,
          fontWeight: FontWeight.w600,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: isDesktop ? 20 : isTablet ? 16 : 12,
          vertical: isDesktop ? 16 : isTablet ? 14 : 12,
        ),
        tabs: const [
          GButton(
            icon: Icons.home,
            text: 'Shop',
          ),
          GButton(
            icon: Icons.shopping_bag_outlined,
            text: 'Cart',
          ),
        ],
      ),
    );
  }
}