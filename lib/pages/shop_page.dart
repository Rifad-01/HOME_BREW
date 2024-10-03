import 'package:first_app/components/coffee_tile.dart';
import 'package:first_app/models/coffee.dart';
import 'package:first_app/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
// add coffee to cart
  void addToCart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).additemToCart(coffee);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              // heading message
              const Text(
                "How would you like your coffee?",
                style: TextStyle(fontSize: 20),
              ),

              const SizedBox(
                height: 25,
              ),

              // list of coffee to buy
              Expanded(
                child: ListView.builder(
                    itemCount: value.coffeeShop.length,
                    itemBuilder: (context, index) {
                      // get individual coffee
                      Coffee eachCoffee = value.coffeeShop[index];

                      // return the title for this coffee
                      return CoffeeTile(
                        coffee: eachCoffee,
                        icon: Icon(Icons.delete),
                        onPressed: () => addToCart(eachCoffee),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
