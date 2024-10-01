import 'package:flutter/material.dart';

class CustomTextformfield extends StatelessWidget {
  String? hinttext;
  IconData? prefixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  CustomTextformfield(
      {super.key, this.hinttext,this.prefixIcon,this.controller,this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator:validator ,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: hinttext,
          prefixIcon: Icon(prefixIcon)),
    );
  }
}
