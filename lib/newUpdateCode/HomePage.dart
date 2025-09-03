import 'package:demoapp/newUpdateCode/ProductAppBar.dart';
import 'package:demoapp/newUpdateCode/ProductCard.dart';
import 'package:flutter/material.dart';

import '../foodMenuScreen/FilterSearchBox.dart';
import '../foodMenuScreen/TickChargeBar.dart';
import '../ticketCart/TicketCard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static List<Map<String, dynamic>> cart = [];
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> menuItems = [
    {"name": "Alu Chop", "image": "assets/aluchop.jpg", "cost": 20.0},
    {"name": "Beef Kabab", "image": "assets/beef_kabab.jpg", "cost": 250.0},
    {"name": "Beef Vuna", "image": "assets/beef_vuna.jpg", "cost": 200.0},
    {"name": "Chicken Grill", "image": "assets/chicken_grill.jpg", "cost": 150.0},
    {
      "name": "Chicken Masala",
      "image": "assets/chicken_masala.jpg",
      "cost": 120.0,
    },
    {"name": "Chicken Roll", "image": "assets/chicken_roll.jpg", "cost": 50.0},
    {"name": "Chicken Soup", "image": "assets/chicken_soup.jpg", "cost": 80.0},
    {"name": "Coffee", "image": "assets/coffee.jpg", "cost": 40.0},
    {"name": "Egg Curry", "image": "assets/egg_curry.jpg", "cost": 20.0},
    {"name": "Egg Omelet", "image": "assets/egg_omelet.jpg", "cost": 20.0},
    {"name": "Soup", "image": "assets/soup.jpg", "cost": 25.0 },
  ];

  void addToCart(Map<String, dynamic> item) {
    setState(() {
      HomePage.cart.add({"name": item["name"], "qty": 1, "cost": item["cost"]});
    });
  }

  double get totalCost {
    return HomePage.cart.fold(0, (sum, item) => sum + item["cost"]  * item["qty"]);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    //Responsive Sizing
    final padding = screenWidth * 0.020;
    final mainAxisSpacing = screenHeight * 0.01;
    final crossAxisSpacing = screenWidth * 0.02;

    final crossAxisCount = screenWidth < 600 ? 2 : 3;
    final childAspectRatio = screenWidth < 600 ? 0.75 : (screenWidth / screenHeight) * 0.10;

    return Scaffold(
      appBar: ProductAppBar(
        cartCount: HomePage.cart.length,
        onCartPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TicketCard(orders: HomePage.cart),
            ),
          );
        },
      ),
      drawer: Drawer(),
      body: SafeArea(
        minimum: EdgeInsets.only(bottom: screenHeight * 0.02),
        child: Column(
          children: [
            SizedBox(width: screenWidth * 0.01),
            TickChargeBar(total: totalCost),

            // filter + search
            FilterSearchBox(),
            Expanded(child: GridView.builder(
              padding: EdgeInsets.all(padding),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                childAspectRatio: childAspectRatio,
                mainAxisSpacing: mainAxisSpacing,
                crossAxisSpacing: crossAxisSpacing,
              ),
              itemCount: menuItems.length,
              itemBuilder: (context, index) {
                final item = menuItems[index];
                return ProductCard(
                  name: item["name"],
                  image: item["image"],
                  cost: item["cost"],
                  onTap: () => addToCart(item),
                );
              },
            )),
          ],
        ),
      ),
    );
  }


}
