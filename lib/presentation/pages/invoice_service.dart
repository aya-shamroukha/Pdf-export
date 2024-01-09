import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdf/presentation/pages/homepage.dart';
import 'package:open_document/my_files/init.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';

class PdfInvoiceService{
  TextDirection _textDirection = TextDirection.ltr;

bool _hasArabicCharacters(String text) {
    final pattern = RegExp(r'[\u0600-\u06FF\u0750-\u077F\uFB50-\uFDFF\uFE70-\uFEFF]');
    return pattern.hasMatch(text);
  }

static late Font font ;
static init()async{
font=Font.ttf((await rootBundle.load("assets/Marhey-VariableFont_wght.ttf")));
}
  Future<Uint8List> creeatInvoice()async{
final pdf=pw.Document();

final image=(await rootBundle.load("assets/images/KnackChat Logo.png")).buffer.asUint8List();
pdf.addPage(pw.Page(
  theme: pw.ThemeData.withFont(base: font),
  textDirection:_hasArabicCharacters(firstnamecontroller.text)?pw.TextDirection.rtl:pw.TextDirection.ltr,
  pageFormat: PdfPageFormat.a4,build: (pw.Context context){
return  pw.Column(children: [pw.Image(pw.MemoryImage(image),width: 150,height: 150,fit: pw.BoxFit.cover),
pw.Column(children: [

  pw.Row(children: [

    pw.Text("First Name: "),
    pw.Text(firstnamecontroller.text.toString())
  ]),
  pw.SizedBox(height: 10),
  pw.Row(children: [
    pw.Text("Last Name: "),
    pw.Text(lasttnamecontroller.text.toString()),
  ]),
    pw.SizedBox(height: 10),
  pw.Row(children: [

    pw.Text("Phone Number: "),
    pw.Text(phonecontroller.text.toString())
  ]), pw.SizedBox(height: 10),
   pw.Row(children: [

    pw.Text("Description: "),
    pw.Text(discontroller.text.toString())
  ])
])



]);

}));
return pdf.save();
  }
Future<void> savePdfFile(String fileName ,Uint8List byteList)async{
 final output=await getTemporaryDirectory();
 var filepath="${output.path}/$fileName.pdf";

final file=File(filepath);
await file.writeAsBytes(byteList);
await OpenFile.open(filepath);
// await OpenDocument.openDocument(filePath: filepath);
await Share.shareXFiles([XFile(filepath)],text: "Share Pdf",subject: "Share");
//Share.share( "Share Pdf");
}
 
}