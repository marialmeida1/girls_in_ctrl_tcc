import 'package:flutter/material.dart';

AppBar myappBar(
    BuildContext context, Color color, String? title, String? subtitle) {
  return AppBar(
    elevation: 0,
    toolbarHeight: 80,
    backgroundColor: Colors.transparent,
    title: Container(
      width: double.infinity,
      alignment: Alignment.centerLeft,
      child: InkWell(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title ?? '',
              style: Theme.of(context).textTheme.headline2?.copyWith(
                    color: Colors.black,
                  ),
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              subtitle ?? '',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.black,
                  ),
            ),
          ],
        ),
      ),
    ),
  );
}
