import 'package:flutter/material.dart';

Widget searchText() {
  return TextFormField(
    decoration: InputDecoration(
      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: Colors.black12,
          width: 0,
        ),
      ),
      filled: true,
      fillColor: Colors.white,
      prefixIcon: Icon(
        Icons.search,
        color: Colors.black45,
        size: 24,
      ),
      labelText: "Pesquisar",
    ),
  );
}
