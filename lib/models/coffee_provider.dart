import 'package:coffee_shop/models/coffee_model.dart';
import 'package:flutter/material.dart';

class CoffeeShop extends ChangeNotifier {
  final List<Coffee> _shop = [
    Coffee(
        name: 'Espresso',
        quantity: 0,
        price: '2.50',
        imagePath: 'lib/images/espresso.png'),
    Coffee(
        name: 'Long Black',
        quantity: 0,
        price: '4.50',
        imagePath: 'lib/images/coffee-cup.png'),
    Coffee(
        name: 'Latte',
        quantity: 0,
        price: '4.00',
        imagePath: 'lib/images/latte.png'),
    Coffee(
        name: 'Cappuccino',
        quantity: 0,
        price: '5.00',
        imagePath: 'lib/images/capuccino.png'),
    Coffee(
        name: 'Flat white',
        quantity: 0,
        price: '4.50',
        imagePath: 'lib/images/latte.png'),
    Coffee(
        name: 'Macchiato',
        quantity: 0,
        price: '4.00',
        imagePath: 'lib/images/macchiato.png'),
    Coffee(
        name: 'Mocha',
        quantity: 0,
        price: '6.00',
        imagePath: 'lib/images/mocha.png'),
    Coffee(
        name: 'Affogato',
        quantity: 0,
        price: '7.00',
        imagePath: 'lib/images/affogato.png'),
  ];

  final List<Coffee> _userCart = [];

  List<Coffee> get coffees => _shop;

  List<Coffee> get userCart => _userCart;

  double get totalPrice {
    double total = 0;
    for (var coffee in _userCart) {
      total += coffee.cartPrice;
    }
    return total;
  }

  void addItemToCart(Coffee coffee) {
    _userCart.add(coffee);
    notifyListeners();
  }

  void removeItemFromCart(Coffee coffee) {
    _userCart.remove(coffee);
    notifyListeners();
  }

  void updateCartItem(Coffee coffee) {
    if (coffee.quantity > 1) {
      coffee.quantity--;
      coffee.cartPrice = coffee.quantity * double.parse(coffee.price);
      notifyListeners();
    } else {
      removeItemFromCart(coffee);
    }
  }
}
