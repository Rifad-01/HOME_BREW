import 'package:flutter/material.dart';

import 'coffee.dart';

class CoffeeShop extends ChangeNotifier{
  final List<Coffee> _shop = [
    //black coffee

    Coffee(
      name: 'Long Black',
      price: '4.10',
      imagepath: "images/black.png",
    ),

    // latte coffee

    Coffee(
      name: 'Latte',
      price: '4.20',
      imagepath: "images/latte.jpg",
    ),

    // espresso coffee

    Coffee(
      name: 'Espresso',
      price: '4.10',
      imagepath: "images/espresso.png",
    ),

    // iced coffee

    Coffee(
      name: 'Iced Coffee',
      price: '4.10',
      imagepath: "images/cold.jpg",
    ),
  ];

  //  user cart

  List<Coffee> userCart = [];

  // get coffee list

  List<Coffee> get coffeeShop => _shop;

  // add item to cart
  void additemToCart(Coffee coffee){
    userCart.add(coffee);
    notifyListeners();
  }

  // remove item from cart

  void removeItemFromCart(Coffee coffee){
    userCart.remove(coffee);
    notifyListeners();
  }


}
