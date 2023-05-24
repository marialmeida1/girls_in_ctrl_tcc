import 'package:flutter/material.dart';

typedef Validator = String? Function(String? value);

Widget textBox(
  String name,
  TextEditingController txt,
  TextInputType? type,
  Validator validator,
  bool obscure,
) {
  return Container(
    alignment: Alignment.centerRight,
    height: 46,
    width: double.infinity,
    decoration: const BoxDecoration(
      color: Colors.black12,
      borderRadius: BorderRadius.all(
        Radius.circular(20),
      ),
    ),
    child: Padding(
      padding: EdgeInsets.only(right: 20, left: 20, top: 10, bottom: 10),
      child: TextFormField(
        keyboardType: type,
        controller: txt,
        validator: validator,
        obscureText: obscure,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: name,
        ),
      ),
    ),
  );
}
