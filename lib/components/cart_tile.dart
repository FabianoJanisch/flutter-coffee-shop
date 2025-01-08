import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/coffee_provider.dart';

class CartTile extends StatelessWidget {
  const CartTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, coffeeShop, child) {
        final userCart = coffeeShop.userCart;

        return ListView.builder(
          itemCount: userCart.length,
          itemBuilder: (context, index) {
            final coffee = userCart[index];
            return ListTile(
              title: Text(coffee.name),
              subtitle: Text('\$${coffee.cartPrice.toStringAsFixed(2)}'),
              leading: Image.asset(coffee.imagePath),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () {
                      coffeeShop.updateCartItem(coffee);
                      final scaffoldMessenger = ScaffoldMessenger.of(context);
                      scaffoldMessenger.hideCurrentSnackBar();
                      scaffoldMessenger.showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(
                            '${coffee.name} removed from your cart!',
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      );
                    },
                  ),
                  Text(
                    coffee.quantity.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
