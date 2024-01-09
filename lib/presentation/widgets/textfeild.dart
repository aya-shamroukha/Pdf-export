import 'package:flutter/material.dart';
import 'package:flutter_pdf/utilities/colors.dart';
import 'package:intl_phone_field/intl_phone_field.dart';




class NameTextField extends StatefulWidget {

  NameTextField({
    super.key, required this.Controller, required this.hintname,
  
  });
  final TextEditingController Controller;
  final String hintname;

  @override
  State<NameTextField> createState() => _NameTextFieldState();
}

class _NameTextFieldState extends State<NameTextField> {
        GlobalKey<FormState> formstatee = GlobalKey<FormState>();

  TextDirection _textDirection = TextDirection.ltr;

bool _hasArabicCharacters(String text) {
    final pattern = RegExp(r'[\u0600-\u06FF\u0750-\u077F\uFB50-\uFDFF\uFE70-\uFEFF]');
    return pattern.hasMatch(text);
  }

  @override
  Widget build(BuildContext context) {

    return Form(
      key: formstatee,
      child: Padding(
        padding:  const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: [
            TextFormField(
              textDirection: _textDirection,
               onChanged: (value) {
        // Check if the entered text contains Arabic characters
        if (_hasArabicCharacters(value)) {
          setState(() {
            _textDirection = TextDirection.rtl;
          });
        } else {
          setState(() {
            _textDirection = TextDirection.ltr;
          });
        }
      },
 autovalidateMode: AutovalidateMode.always,
               validator: (text) {
                if(text!.length==0){
                  return "Please Enter your name";
                }
                else{return '';}
              },
              controller: widget.Controller,
              cursorColor: Colors.grey,
               decoration: InputDecoration(
                errorStyle: TextStyle(color:Colors.grey),
                errorBorder: OutlineInputBorder(borderSide: BorderSide(color:black),
                      borderRadius: BorderRadius.circular(12)),
                      focusedErrorBorder:OutlineInputBorder(borderSide: BorderSide(color:Colors.black),
                      borderRadius: BorderRadius.circular(12)) ,
               
                 
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:green),
                      borderRadius: BorderRadius.circular(12)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:green),
                      borderRadius: BorderRadius.circular(12)),
                  border: OutlineInputBorder(borderSide: BorderSide(color:green)),
               labelText:widget.hintname,
                  labelStyle: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ),
          ],
        ),
      ),
      
    );
  }
}class PhoneField extends StatelessWidget {
  const PhoneField({
    super.key, required this.controller,
  });
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      controller: controller,
          cursorColor: Colors.grey,
    decoration:InputDecoration(
                errorStyle: TextStyle(color:Colors.grey),
                errorBorder: OutlineInputBorder(borderSide: BorderSide(color:black),
                      borderRadius: BorderRadius.circular(12)),
                      focusedErrorBorder:OutlineInputBorder(borderSide: BorderSide(color:Colors.black),
                      borderRadius: BorderRadius.circular(12)) ,
               
                 
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:green),
                      borderRadius: BorderRadius.circular(12)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:green),
                      borderRadius: BorderRadius.circular(12)),
                  border: OutlineInputBorder(borderSide: BorderSide(color:green)),
              
                  labelStyle: TextStyle(fontSize: 14, color:black),
                ),
    initialCountryCode: 'SY',
    onChanged: (phone) {
        print(phone.completeNumber);
    },
);
  }
}