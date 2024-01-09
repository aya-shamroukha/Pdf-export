
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_pdf/presentation/pages/invoice_service.dart';
import 'package:flutter_pdf/presentation/widgets/button.dart';
import 'package:flutter_pdf/utilities/colors.dart';
import 'package:flutter_pdf/presentation/widgets/textfeild.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
TextEditingController firstnamecontroller = TextEditingController();
  TextEditingController lasttnamecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController discontroller = TextEditingController();

class HomePage extends StatelessWidget {
   HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(

body: SizedBox(child: 
SingleChildScrollView(
child: Column(children: [
  Text("Welcome",style: TextStyle(color:green,fontStyle: FontStyle.italic,fontSize: 30),),
  Padding(
    padding: const EdgeInsets.all(8.0),
    child: NameTextField(hintname: "First Name",Controller: firstnamecontroller,),
  ),
  Padding(
    padding: const EdgeInsets.all(8.0),
    child: NameTextField(hintname: "Last Name",Controller: lasttnamecontroller,),
  ),
  Padding(
    padding: const EdgeInsets.all(8.0),
    child: NameTextField(hintname: "Description",Controller: discontroller,),
  ),
  Padding(
    padding: const EdgeInsets.symmetric(horizontal: 48,vertical: 8),
    child:PhoneField(controller: phonecontroller,)
  ),
  MyButton(colors:black,height: 50,width: 100,radius: 20,
  title: "Export",fontsize: 17,textcolor:green,

  boxshadow:BoxShadow(
                                      color:green,
                                      blurRadius: 1,
                                      offset: Offset(7, -4)),
                                        onpress: ()async{
                                   final data=await PdfInvoiceService().creeatInvoice();
                                   PdfInvoiceService().savePdfFile('invoice', data);


                                        },
  
  )


],

),

),),


    ));
  }
}

