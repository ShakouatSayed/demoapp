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
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      appBar: ProductAppBar(
        cartCount: HomePage.cart.length,
        onCartPressed: () {},
      ),

      drawer: Drawer(),
      body: SafeArea(
        minimum: EdgeInsets.only(bottom: height * 0.02),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Column(
            //mainAxisSize: MainAxisSize.min,
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: height * 0.02),
              Center(
                child: Text(
                  "Tk ${total.toStringAsFixed(2)}",
                  style: TextStyle(
                    fontSize: width * 0.08,
                    fontWeight: FontWeight.bold,
                    color: Colors.black12,
                  ),
                ),
              ),
              SizedBox(width: height * 0.01),
              Text(
                "Total Paid",
                style: TextStyle(fontSize: width * 0.045, color: Colors.black54),
              ),
              SizedBox(height: height * 0.15),
              InputBox(
                hintText: "Enter email",
                prefixIcon: Icons.mail,
                suffixIcon: Icons.send_rounded,
                inputType: TextInputType.emailAddress,
                onAction: (value) {
                  debugPrint("Email : $value");
                },
              ),
              SizedBox(height: height * 0.01),
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
              SizedBox(height: height * 0.35),
              //SaleScrean(orders: orders),
              DataClearButton(onConfirm: (){
                HomePage.cart.clear();
                debugPrint("Cart is clear!");
              }, homePageBuilder:(_) => const HomePage())
            ],
          ),
        ),
      ),
    );
  }
}
