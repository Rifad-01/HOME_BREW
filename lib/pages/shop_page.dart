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

    // let user know it item added successfully

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Center(
          child: Text(
            "Successfully added to cart",
            textAlign: TextAlign.center,
          ),
        ),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: MediaQuery.of(context).size.width >= 600 ? 20 : 18,
        ),
        backgroundColor: Colors.brown,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    final isTablet = screenWidth >= 600;
    final isDesktop = screenWidth >= 1024;
    
    // Calculate responsive padding
    final horizontalPadding = isDesktop 
        ? screenWidth * 0.08 
        : isTablet 
            ? screenWidth * 0.06 
            : screenWidth * 0.06;
    
    final verticalPadding = isDesktop 
        ? 40.0 
        : isTablet 
            ? 30.0 
            : 25.0;
    
    return Consumer<CoffeeShop>(
      builder: (context, value, child) => SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: horizontalPadding,
                    vertical: verticalPadding,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // heading message
                      Text(
                        "How would you like your coffee?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: isDesktop ? 28 : isTablet ? 24 : 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800],
                        ),
                      ),

                      SizedBox(
                        height: isDesktop ? 40 : isTablet ? 30 : 25,
                      ),

                      // list of coffee to buy
                      Flexible(
                        child: isDesktop && screenWidth > 1200
                            ? _buildGridView(value, context)
                            : _buildListView(value, context),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
  
  Widget _buildListView(CoffeeShop value, BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: value.coffeeShop.length,
      itemBuilder: (context, index) {
        Coffee eachCoffee = value.coffeeShop[index];
        return CoffeeTile(
          coffee: eachCoffee,
          icon: const Icon(Icons.add),
          onPressed: () => addToCart(eachCoffee),
        );
      },
    );
  }
  
  Widget _buildGridView(CoffeeShop value, BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount = screenWidth > 1400 ? 3 : 2;
    
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 4.5,
      ),
      itemCount: value.coffeeShop.length,
      itemBuilder: (context, index) {
        Coffee eachCoffee = value.coffeeShop[index];
        return CoffeeTile(
          coffee: eachCoffee,
          icon: const Icon(Icons.add),
          onPressed: () => addToCart(eachCoffee),
        );
      },
    );
  }
}

                      // return the title for this coffee
                      return CoffeeTile(
                        coffee: eachCoffee,
                        icon: Icon(Icons.add),
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
