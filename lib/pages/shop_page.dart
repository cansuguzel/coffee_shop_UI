import 'package:coffe_app/components/coffee_tile.dart';
import 'package:coffe_app/models/coffee.dart';
import 'package:coffe_app/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Eğer Provider kullanıyorsanız bu import gereklidir.

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  //add coffe to cart
  void addToCart(Coffee coffee){
     Provider.of<CoffeeShop>(context,listen: false).addItemToCart(coffee);
     //let user know it add been successfully adden
     showDialog(
      context: context,
      builder: (context)=>AlertDialog(
          title: Text("Successfully added to cart"),
      ),);
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              // Heading message
              const Text(
                "How would you like your coffee?",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 25),

              // List of coffee to buy
              Expanded(
                child: ListView.builder(
                  itemCount: value.coffeeShop.length, // Coffee list length
                  itemBuilder: (context, index) {
                    // Get individual coffee
                    Coffee eachCoffee = value.coffeeShop[index];

                    // Return the tile for this coffee
                    return CoffeeTile(
                      coffee: eachCoffee,
                      icon: Icon(Icons.add),
                      onPressed:()=>addToCart(eachCoffee),
                      );
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


