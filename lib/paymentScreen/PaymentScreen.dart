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
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: const BackButton(),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              "SPLIT",
              style: TextStyle(color: Colors.white, letterSpacing: 1.1, fontSize: width * 0.04),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.03),
              Text(
                "Tk ${widget.total.toStringAsFixed(2)}",
                style: TextStyle(
                  fontSize: width * 0.08,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: height * 0.01),
              Text(
                "Total amount due",
                style: TextStyle(color: Colors.black54, fontSize: width * 0.045),

              ),
              SizedBox(height: height * 0.03),

              // Cash recived
              Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Cash recived",
                      style: TextStyle(color: Colors.black54, fontSize: width * 0.045),
                      //textAlign: TextAlign.start,
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
                    SizedBox(height: height * 0.005),
                    Text(
                      "Tk ${widget.total.toStringAsFixed(2)}",
                      style: TextStyle(color: Colors.black54, fontSize: width * 0.05),
                    ),
                  ],
                ),
              ),

              SizedBox(height: height * 0.02),
              _sectionGap(height),

              // Payment methods
              _methodTile(
                icon: Icons.money,
                label: "CASH",
                onTap: () {
                  /*handle cash*/
                },
                fontSize: width * 0.045,
              ),
              _sectionGap(height),
              _methodTile(
                icon: Icons.credit_card,
                label: "CARD",
                onTap: () {
                  /*handle card*/
                },
                fontSize: width * 0.045,
              ),
              _sectionGap(height),
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
                fontSize: width * 0.045,
              ),
              _sectionGap(height),
              _methodTile(
                icon: Icons.account_balance_wallet,
                label: "NAGAD",
                onTap: () {
                  /*handle nagad*/
                },
                fontSize: width * 0.045,
              ),
              SizedBox(height: height * 0.04),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionGap(double height) => SizedBox(
    height: height * 0.02,
    //color: Colors.white,
  );

  // A payment Option tile
  Widget _methodTile({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    required double fontSize,
  }) {
    return ListTile(
      leading: Icon(icon, size: fontSize * 1.2),
      title: Text(label, style: TextStyle(letterSpacing: 1.0, fontSize: fontSize)),
      tileColor: Colors.white,
      contentPadding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.02,
        vertical: MediaQuery.of(context).size.height * 0.005,

      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.04),
        //side: BorderSide(color: Colors.green, width: 1)
      ),
      onTap: onTap,
    );
  }
}
