import 'package:flutter/material.dart';
import 'coffee.dart'; // 'coffee.dart' dosyasında Coffee sınıfı tanımlı olmalı.

class CoffeeShop extends ChangeNotifier {
  // Coffee listesi
  final List<Coffee> _shop = [
    // Black Coffee
    Coffee(
      name: 'Long Black',
      price: "4.10",
      imagePath: "lib/images/black.png",
    ),
    // Latte
    Coffee(
      name: 'Latte',
      price: "4.20",
      imagePath: "lib/images/latte.png",
    ),
    // Espresso
    Coffee(
      name: 'Espresso',
      price: "3.50",
      imagePath: "lib/images/espresso.png",
    ),
    
  ];
  //user cart
  List<Coffee>_userCart=[];
  //get coffee list
  List<Coffee> get coffeeShop => _shop;
  //get user cart
  List<Coffee>get userCart =>_userCart;
  //add item to cart
  void addItemToCart(Coffee coffee){
    _userCart.add(coffee);
    notifyListeners();
  }
  //remove item from cart
    void removeItemFromCart(Coffee coffee){
    _userCart.remove(coffee);
    notifyListeners();
  }
}
