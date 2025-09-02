import 'package:demoapp/paymentMethod/PaymentSuccessPage.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  final double total;
  final List<Map<String, dynamic>> orders;
  const PaymentScreen({super.key, required this.total, required this.orders});
  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  late final TextEditingController cashCtr1;

  @override
  void initState() {
    super.initState();
    cashCtr1 = TextEditingController(text: widget.total.toStringAsFixed(2));
  }

  @override
  void dispose() {
    cashCtr1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const bg = Color(0xFFF4F6FA);
    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: const BackButton(),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              "SPLIT",
              style: TextStyle(color: Colors.white, letterSpacing: 1.1),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              Text(
                "Tk ${widget.total.toStringAsFixed(2)}",
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                "Total amount due",
                style: TextStyle(color: Colors.black54),
              ),
              const SizedBox(height: 24),

              // Cash recived
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Cash recived",
                      style: TextStyle(color: Colors.black54),
                      textAlign: TextAlign.start,
                    ),
                    /*TextField(
                        controller: cashCtr1,
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        decoration: const InputDecoration(
                          prefixText: "Tk ",
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 12),
                          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black12, width: 1)),
                          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.blue, width: 2)),
                        ),
                      )*/
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Tk ${widget.total.toStringAsFixed(2)}",
                        style: TextStyle(color: Colors.black54),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),
              _sectionGap(),

              // Payment methods
              _methodTile(
                icon: Icons.money,
                label: "CASH",
                onTap: () {
                  /*handle cash*/
                },
              ),
              _sectionGap(),
              _methodTile(
                icon: Icons.credit_card,
                label: "CARD",
                onTap: () {
                  /*handle card*/
                },
              ),
              _sectionGap(),
              _methodTile(
                icon: Icons.account_balance_wallet_outlined,
                label: "BKASH",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => PaymentSuccessPage(total: widget.total, orders: widget.orders),
                    ),
                  );
                },
              ),
              _sectionGap(),
              _methodTile(
                icon: Icons.account_balance_wallet,
                label: "NAGAD",
                onTap: () {
                  /*handle nagad*/
                },
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionGap() => Container(
    height: 12,
    margin: const EdgeInsets.symmetric(vertical: 8),
    //color: Colors.white,
  );

  // A payment Option tile
  Widget _methodTile({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label, style: TextStyle(letterSpacing: 1.0)),
      tileColor: Colors.white,
      contentPadding: const EdgeInsets.only(
        top: 0,
        bottom: 0,
        left: 8,
        right: 8,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        //side: BorderSide(color: Colors.green, width: 1)
      ),
      onTap: onTap,
    );
  }
}
