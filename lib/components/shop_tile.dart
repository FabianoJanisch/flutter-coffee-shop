import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/coffee_model.dart';
import '../models/coffee_provider.dart';

class ShopTile extends StatelessWidget {
  final Coffee coffee;

  const ShopTile({super.key, required this.coffee});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(30),
      ),
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 5,
      ),
      child: ListTile(
        title: Text(coffee.name),
        subtitle: Text('\$${coffee.price}'),
        leading: Image.asset(coffee.imagePath),
        onTap: () {
          final coffeeShop = Provider.of<CoffeeShop>(context, listen: false);

          final existingCoffee =
              coffeeShop.userCart.any((item) => item.name == coffee.name);

          if (existingCoffee) {
            coffee.quantity = coffee.quantity + 1;
            coffee.cartPrice =
                coffee.quantity.toDouble() * double.parse(coffee.price);
          } else {
            coffeeShop.addItemToCart(coffee);
            coffee.quantity = 1;
            coffee.cartPrice = double.parse(coffee.price);
          }

          final scaffoldMessenger = ScaffoldMessenger.of(context);
          scaffoldMessenger.hideCurrentSnackBar();
          scaffoldMessenger.showSnackBar(
            SnackBar(
              backgroundColor: Colors.grey,
              content: Text(
                '${coffee.name} added to cart!',
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }
}
