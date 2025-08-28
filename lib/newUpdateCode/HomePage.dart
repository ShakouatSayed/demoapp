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
    {"name": "আলু চাপ", "image": "assets/aluchop.jpg", "cost": "20.0"},
    {"name": "বিফ কাবাব", "image": "assets/beef_kabab.jpg", "cost": "250.2"},
    {"name": "বিফ ভূনা", "image": "assets/beef_vuna.jpg", "cost": "200.2"},
    {"name": "চিকেন গ্রীল", "image": "assets/chicken_grill.jpg", "cost": "150.5"},
    {
      "name": "চিকেন মাসালা",
      "image": "assets/chicken_masala.jpg",
      "cost": "120.12",
    },
    {"name": "চিকেন রুল", "image": "assets/chicken_roll.jpg", "cost": "50.21"},
    {"name": "চিকেন সুপ", "image": "assets/chicken_soup.jpg", "cost": "80.2"},
    {"name": "কপি", "image": "assets/coffee.jpg", "cost": "40.2"},
    {"name": "ডিম ক্বারী", "image": "assets/egg_curry.jpg", "cost": "20.3"},
    {"name": "ডিম ওমলেট", "image": "assets/egg_omelet.jpg", "cost": "20.10"},
    {"name": "সুপ", "image": "assets/soup.jpg", "cost": "25.02"},
  ];

  void addToCart(Map<String, dynamic> item) {
    setState(() {
      HomePage.cart.add({"name": item["name"], "qty": 1, "cost": item["cost"]});
    });
  }

  @override
  Widget build(BuildContext context) {
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
      body: Column(
        children: [
          SizedBox(width: 8),
          TickChargeBar(),

          // filter + search
          FilterSearchBox(),
          Expanded(child: GridView.builder(
            padding: const EdgeInsets.all(8),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
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
    );
  }
}
