import 'package:first_app/models/coffee.dart';
import 'package:flutter/material.dart';

class CoffeeTile extends StatelessWidget {
  final Coffee coffee;
  void Function()? onPressed;
  final Widget icon;
  CoffeeTile({
    super.key,
    required this.coffee,
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;
    final isDesktop = screenWidth >= 1024;
    
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(12)),
      margin: EdgeInsets.only(
        bottom: isDesktop ? 16 : isTablet ? 12 : 10,
      ),
      padding: EdgeInsets.symmetric(
        vertical: isDesktop ? 20 : isTablet ? 18 : 16,
        horizontal: isDesktop ? 20 : isTablet ? 16 : 12,
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(
          coffee.name,
          style: TextStyle(
            fontSize: isDesktop ? 18 : isTablet ? 16 : 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          '\$${coffee.price}',
          style: TextStyle(
            fontSize: isDesktop ? 16 : isTablet ? 14 : 12,
            color: Colors.grey[600],
          ),
        ),
        // leading: Image.asset(coffee.imagepath),
        trailing: IconButton(
          icon: icon,
          iconSize: isDesktop ? 28 : isTablet ? 24 : 20,
          onPressed: onPressed,
        ),
      ),
    );
  }
}
