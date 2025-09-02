import 'package:demoapp/dataClear/DataClearButton.dart';

import 'package:demoapp/inputBox/InputBox.dart';
import 'package:demoapp/paymentMethod/PrintReceiptButton.dart';
import 'package:demoapp/paymentMethod/generatePdf.dart';
import 'package:flutter/material.dart';

import '../newUpdateCode/HomePage.dart';
import '../newUpdateCode/ProductAppBar.dart';

class PaymentSuccessPage extends StatelessWidget {
  final double total;
  final List<Map<String, dynamic>> orders;
  const PaymentSuccessPage({super.key, required this.total, required this.orders});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProductAppBar(
        cartCount: HomePage.cart.length,
        onCartPressed: () {},
      ),

      drawer: Drawer(),
      body: SafeArea(
        minimum: EdgeInsets.only(bottom: 20),
        child: Column(
          //mainAxisSize: MainAxisSize.min,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Center(
              child: Text(
                "Tk ${total.toStringAsFixed(2)}",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black12,
                ),
              ),
            ),
            SizedBox(width: 8),
            Text(
              "Total Paid",
              style: TextStyle(fontSize: 18, color: Colors.black54),
            ),
            const SizedBox(height: 100),
            InputBox(
              hintText: "Enter email",
              prefixIcon: Icons.mail,
              suffixIcon: Icons.send_rounded,
              inputType: TextInputType.emailAddress,
              onAction: (value) {
                debugPrint("Email : $value");
              },
            ),
            const SizedBox(height: 10),
            // InputBox(
            //   hintText: "Enter phone",
            //   prefixIcon: Icons.phone,
            //   suffixIcon: Icons.check,
            //   inputType: TextInputType.phone,
            //   prefixBgColor: Colors.blueGrey,
            //   suffixColor: Colors.green,
            //   onAction: (value) {
            //     debugPrint("phone : $value");
            //   },
            // ),
            PrintReceiptButton(onPressed: () async {await generatePdf(orders);}),
            const SizedBox(height: 150),
            //SaleScrean(orders: orders),
            DataClearButton(onConfirm: (){
              HomePage.cart.clear();
              debugPrint("Cart is clear!");
            }, homePageBuilder:(_) => const HomePage())
          ],
        ),
      ),
    );
  }
}
