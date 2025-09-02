import 'package:demoapp/dataClear/DataClearButton.dart';
import 'package:demoapp/newUpdateCode/HomePage.dart';
import 'package:demoapp/ticketCart/TicketCard.dart';
import 'package:flutter/material.dart';

class SaleScrean extends StatefulWidget {
  final List<Map<String, dynamic>> orders;
  const SaleScrean({super.key, required this.orders});

  @override
  State<SaleScrean> createState() => _SaleScreenState();
}

class _SaleScreenState extends State<SaleScrean> {
  void _startNewSale() {
    setState(() {
      widget.orders.clear();
    });

    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const HomePage()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.7,
            maxWidth: double.infinity
          ),
          child: TicketCard(orders: widget.orders),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(12),
        child: DataClearButton(
          onConfirm: _startNewSale,
          homePageBuilder: (_) => const HomePage(),
        ),
      ),
    );
  }
}
