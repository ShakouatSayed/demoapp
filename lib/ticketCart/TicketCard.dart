import 'package:demoapp/paymentScreen/PaymentScreen.dart';
import 'package:demoapp/ticketCart/BottomBar.dart';
import 'package:flutter/material.dart';

class TicketCard extends StatelessWidget {
  final List<Map<String, dynamic>> orders;
  const TicketCard({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    double total = orders.fold(
      0,
      (sum, item) => sum + (item["cost"] * item["qty"]),
    );

    //WidgetsBinding.instance.addPostFrameCallback((_){onTotalCalculated(total);});
    return Scaffold(
      appBar: AppBar(title: Text("Ticket"), backgroundColor: Colors.green),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Card(
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Day In",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 10),
                ...orders.map(
                  (item) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Text("${item["name"]} * ${item["qty"]}")
                      ),
                      Text("Tk ${item["cost"]}"),
                    ],
                  ),
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total ", style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("Tk $total", style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(total: total, onSave: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentScreen(total: total, orders: orders)));
      })
    );
  }
}
