import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CratPageState();
}

class _CratPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('CART'),);
  }
}