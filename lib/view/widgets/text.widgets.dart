import 'package:flutter/material.dart';

typedef Validator = String? Function(String? value);

Widget textBox(
  String? name,
  TextEditingController txt,
  TextInputType? type,
  Validator validator,
  bool obscure,
) {
  return TextFormField(
    keyboardType: type,
    controller: txt,
    validator: validator,
    obscureText: obscure,
    decoration: InputDecoration(
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(26),
          borderSide: BorderSide(
            width: 0,
            color: Colors.black12,
          )),
      filled: true,
      fillColor: Colors.black12,
      hintText: name,
      errorStyle: TextStyle(
        height: 0.8, // Ajuste a altura do texto de erro conforme necessário
      ),
      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    ),
    textAlignVertical: TextAlignVertical.center,
    textAlign: TextAlign.left,
    maxLines: 1,
    autovalidateMode: AutovalidateMode.onUserInteraction,
  );
}
