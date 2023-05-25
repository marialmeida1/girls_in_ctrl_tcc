import 'package:flutter/material.dart';

AppBar myappBar(
  BuildContext context,
  Color color,
  String? title,
  String? subtitle,
  IconData? icon,
  Function()? function,
) {
  return AppBar(
    elevation: 0,
    toolbarHeight: 80,
    backgroundColor: Colors.transparent,
    title: Container(
      width: double.infinity,
      alignment: Alignment.centerLeft,
      child: InkWell(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
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
            GestureDetector(
              child: Container(
                height: 40,
                width: 40,
                child: Icon(
                  icon,
                  size: 25,
                  color: Colors.black,
                ),
              ),
              onTap: () {
                function!();
              },
            )
          ],
        ),
      ),
    ),
  );
}
