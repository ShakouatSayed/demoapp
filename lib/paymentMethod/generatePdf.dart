//import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
Future<void> generatePdf(List<Map<String, dynamic>> orders) async{
  final pdf = pw.Document();
  //final fontData = await rootBundle.load("assets/fonts/SolaimanLipi.ttf");
  //final ttf = pw.Font.ttf(fontData.buffer.asByteData());

  double total = orders.fold(
    0,
        (sum, item) => sum + (item["cost"] * item["qty"]),
  );
  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
          pw.Text("Ticket", style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold)),
          pw.SizedBox(height: 20),
          ...orders.map((item) => pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
             pw.Text("${item["name"]} * ${item["qty"]}"),
             pw.Text("Tk ${item["cost"]}"),
            ],
          )),
          pw.Divider(),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text("Total", style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
              pw.Text("Tk $total", style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
            ],
          ),
        ]);
      }
    ),
  );
  await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => pdf.save());
}