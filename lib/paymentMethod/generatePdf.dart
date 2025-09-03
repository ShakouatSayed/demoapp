//import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
Future<void> generatePdf(List<Map<String, dynamic>> orders) async{
  final pdf = pw.Document();
  final pageWidth = PdfPageFormat.a4.availableWidth;
  final pageHeight = PdfPageFormat.a4.availableHeight;

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
        return pw.Padding(
            padding: pw.EdgeInsets.all(pageWidth * 0.05),
          child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
            pw.Text("Ticket", style: pw.TextStyle(fontSize: pageWidth * 0.07, fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: pageHeight * 0.03),
            ...orders.map((item) => pw.Padding(
              padding: pw.EdgeInsets.symmetric(vertical: pageHeight * 0.005),
              child: pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Expanded(
                    child: pw.Text("${item["name"]} * ${item["qty"]}",style: pw.TextStyle(fontSize: pageWidth * 0.04))),
                    pw.Text("Tk ${item["cost"]}",style: pw.TextStyle(fontSize: pageWidth * 0.04)),
                ],
              ),
            )
            ),
            pw.Divider(),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text("Total", style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: pageWidth * 0.045)),
                pw.Text("Tk $total", style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: pageWidth * 0.045)),
              ],
            ),
          ])
        );
      }
    ),
  );
  await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => pdf.save());
}