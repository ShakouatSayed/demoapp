import 'package:demoapp/paymentScreen/PaymentScreen.dart';
import 'package:demoapp/ticketCart/BottomBar.dart';
import 'package:flutter/material.dart';

class TicketCard extends StatelessWidget {
  final List<Map<String, dynamic>> orders;
  const TicketCard({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600;

    double total = orders.fold(
      0,
      (sum, item) => sum + (item["cost"] * item["qty"]),
    );

    //WidgetsBinding.instance.addPostFrameCallback((_){onTotalCalculated(total);});
    return Scaffold(
      appBar: AppBar(title: Text("Ticket"), backgroundColor: Colors.green),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(isTablet ? 24.0 : 12.0),
          child: Card(
            elevation: 3,
            child: Padding(
              padding: EdgeInsets.all(isTablet ? 24.0 : 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Day In",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: isTablet ? 22 : 16,
                    ),
                  ),
                  SizedBox(height: isTablet ? 20 : 10),
                  Expanded(
                    child: ListView(
                      children: [
                        ...orders.map(
                          (item) => Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: isTablet ? 10 : 6,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    "${item["name"]} * ${item["qty"]}",
                                    style: TextStyle(
                                      fontSize: isTablet ? 18 : 14,
                                    ),
                                  ),
                                ),
                                Text(
                                  "Tk ${item["cost"]}",
                                  style: TextStyle(
                                    fontSize: isTablet ? 18 : 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: isTablet ? 20 : 16,
                        ),
                      ),
                      Text(
                        "Tk $total",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: isTablet ? 20 : 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(
        total: total,
        onSave: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PaymentScreen(total: total, orders: orders),
            ),
          );
        },
      ),
    );
  }
}
