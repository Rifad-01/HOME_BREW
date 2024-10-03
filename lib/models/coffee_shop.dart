import 'package:flutter/material.dart';

import 'coffee.dart';

class CoffeeShop extends ChangeNotifier{
  final List<Coffee> _shop = [
    //black coffee

    Coffee(
      name: 'Long Black',
      price: '4.10',
    ),

    // latte coffee

    Coffee(
      name: 'Latte',
      price: '4.20',
    ),

    // espresso coffee

    Coffee(
      name: 'Espresso',
      price: '4.10',
    ),

    // iced coffee

    Coffee(
      name: 'Iced Coffee',
      price: '4.10',
    ),
  ];

  //  user cart

  List<Coffee> _userCart = [];

  // get coffee list

  List<Coffee> get coffeeShop => _shop;

  // add item to cart
  void additemToCart(Coffee coffee){
    _userCart.add(coffee);
    notifyListeners();
  }

  // remove item from cart

  void removeItemFromCart(Coffee coffee){
    _userCart.remove(coffee);
    notifyListeners();
  }


}
