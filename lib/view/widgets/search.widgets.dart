import 'package:flutter/material.dart';

Widget searchText() {
  return Container(
    height: 44,
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: const BorderRadius.all(
        Radius.circular(10),
      ),
      border: Border.all(
        color: Colors.black12,
        width: 1,
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.only(
        right: 10,
        left: 10,
      ),
      child: Row(
        children: const [
          Icon(
            Icons.search,
            color: Colors.black45,
            size: 24,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                fillColor: Colors.black45,
                labelText: "Pesquisar",
                border: InputBorder.none,
              ),
            ),
          )
        ],
      ),
    ),
  );
}
