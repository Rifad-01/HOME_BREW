import 'package:first_app/components/coffee_tile.dart';
import 'package:first_app/models/coffee.dart';
import 'package:first_app/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
// remove item from cart
  void removeFromCart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).removeItemFromCart(coffee);
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
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: verticalPadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // heading
                  Text(
                    'Your Cart',
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

                  // list of cart items
                  Expanded(
                    child: value.userCart.isEmpty
                        ? _buildEmptyCart(context)
                        : _buildCartList(value, context),
                  ),

                  // pay button
                  SafeArea(
                    top: false,
                    child: Container(
                      width: double.infinity,
                      constraints: BoxConstraints(
                        maxWidth: isDesktop ? 400 : double.infinity,
                      ),
                      margin: EdgeInsets.only(
                        top: isDesktop ? 30 : isTablet ? 25 : 20,
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            vertical: isDesktop ? 20 : isTablet ? 18 : 16,
                            horizontal: isDesktop ? 32 : isTablet ? 28 : 24,
                          ),
                          backgroundColor: Colors.brown[500],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 2,
                        ),
                        onPressed: value.userCart.isEmpty ? null : () {
                          _showPaymentDialog(context);
                        },
                        child: Text(
                          "Pay Now",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: isDesktop ? 18 : isTablet ? 16 : 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
  
  Widget _buildEmptyCart(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;
    final isDesktop = screenWidth >= 1024;
    
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart_outlined,
            size: isDesktop ? 80 : isTablet ? 70 : 60,
            color: Colors.grey[400],
          ),
          SizedBox(height: isDesktop ? 24 : isTablet ? 20 : 16),
          Text(
            'Your cart is empty',
            style: TextStyle(
              fontSize: isDesktop ? 24 : isTablet ? 20 : 18,
              fontWeight: FontWeight.w600,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: isDesktop ? 12 : isTablet ? 10 : 8),
          Text(
            'Add some coffee to get started!',
            style: TextStyle(
              fontSize: isDesktop ? 16 : isTablet ? 14 : 12,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildCartList(CoffeeShop value, BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 1024;
    
    return SingleChildScrollView(
      child: Column(
        children: [
          if (isDesktop && screenWidth > 1200)
            _buildGridCartView(value, context)
          else
            _buildListCartView(value, context),
        ],
      ),
    );
  }
  
  Widget _buildListCartView(CoffeeShop value, BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: value.userCart.length,
      itemBuilder: (context, index) {
        Coffee eachCoffee = value.userCart[index];
        return CoffeeTile(
          coffee: eachCoffee,
          onPressed: () => removeFromCart(eachCoffee),
          icon: const Icon(Icons.delete, color: Colors.red),
        );
      },
    );
  }
  
  Widget _buildGridCartView(CoffeeShop value, BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount = screenWidth > 1400 ? 2 : 1;
    
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 4.5,
      ),
      itemCount: value.userCart.length,
      itemBuilder: (context, index) {
        Coffee eachCoffee = value.userCart[index];
        return CoffeeTile(
          coffee: eachCoffee,
          onPressed: () => removeFromCart(eachCoffee),
          icon: const Icon(Icons.delete, color: Colors.red),
        );
      },
    );
  }
  
  void _showPaymentDialog(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Payment Confirmation'),
        content: Text(
          'Proceed with payment?',
          style: TextStyle(
            fontSize: isTablet ? 16 : 14,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              print("Payment processed");
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.brown[500],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'Pay Now',
              style: TextStyle(color: Colors.white),
            ),
                  ),
        ],
      ),
    );
  }
}
          ),
        ),
      ),
    );
  }
}
