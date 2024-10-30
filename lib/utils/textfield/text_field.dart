import 'package:alison_ecommerce/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      required this.onChanged,
      this.prefix,
      this.hintText,
      this.textEditingController});

  Function(String? text) onChanged;
  TextEditingController? textEditingController;
  Widget? prefix;
  String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          prefixIcon: prefix,
          hintText: hintText,
          hintStyle: textStyles.font16,
          counter: const Text(""),
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white))),
      controller: textEditingController,
      onChanged: onChanged,
      style: textStyles.font16,
    );
  }
}
