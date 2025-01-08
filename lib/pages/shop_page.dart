import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/shop_tile.dart';
import '../models/coffee_model.dart';
import '../models/coffee_provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, coffeeShop, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'How would you like your coffee?',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 25),
              Expanded(
                child: ListView.builder(
                  itemCount: coffeeShop.coffees.length,
                  itemBuilder: (context, index) {
                    Coffee eachCoffee = coffeeShop.coffees[index];
                    return ShopTile(coffee: eachCoffee);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
