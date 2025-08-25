import 'package:flutter/material.dart';

class GrideIteam extends StatelessWidget{
  final List<Map<String, String>> menuItems = [
    {"name": "আলু চাপ", "image": "assets/aluchop.jpg"},
    {"name": "বিফ কাবাব", "image": "assets/beef_kabab.jpg"},
    {"name": "বিফ ভূনা", "image": "assets/beef_vuna.jpg"},
    {"name": "চিকেন গ্রীল", "image": "assets/chicken_grill.jpg"},
    {"name": "চিকেন মাসালা", "image": "assets/chicken_masala.jpg"},
    {"name": "চিকেন রুল", "image": "assets/chicken_roll.jpg"},
    {"name": "চিকেন সুপ", "image": "assets/chicken_soup.jpg"},
    {"name": "কপি", "image": "assets/coffee.jpg"},
    {"name": "ডিম ক্বারী", "image": "assets/egg_curry.jpg"},
    {"name": "ডিম ওমলেট", "image": "assets/egg_omelet.jpg"},
    {"name": "সুপ", "image": "assets/soup.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        padding: EdgeInsets.all(8),

        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 0.8,
        ),
        itemCount: menuItems.length,
        itemBuilder: (context, index){
          final iteam = menuItems[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            clipBehavior: Clip.antiAlias,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  iteam["image"]!,
                  fit: BoxFit.cover,
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.all(8),
                  color: Colors.black45,
                  child: Text(
                    iteam["name"]!,
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          );

        },
      ),
    );
  }
}