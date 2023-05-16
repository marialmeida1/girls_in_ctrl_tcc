import 'package:flutter/material.dart';

Widget textBox(String name) {
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
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: name,
        ),
      ),
    ),
  );
}
