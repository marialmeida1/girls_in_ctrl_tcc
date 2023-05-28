import 'package:flutter/material.dart';

Widget searchText(void Function(String)? performSearch) {
  return TextFormField(
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Colors.black12,
          width: 0,
        ),
      ),
      filled: true,
      fillColor: Colors.white,
      prefixIcon: const Icon(
        Icons.search,
        color: Colors.black45,
        size: 24,
      ),
      labelText: "Pesquisar",
    ),
    onChanged: performSearch,
  );
}
