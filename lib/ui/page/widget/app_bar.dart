import 'package:flutter/material.dart';

AppBar appBar(
  BuildContext context, {
  String title = 'Home',
  bool isLeading = true,
}) {
  return AppBar(
    elevation: 0,
    toolbarHeight: kToolbarHeight + 10,
    leading: isLeading
        ? IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            splashRadius: 25,
            icon: const Icon(Icons.arrow_back_ios, size: 20))
        : null,
    centerTitle: false,
    title: Text(
      title,
      style: const TextStyle(fontWeight: FontWeight.bold),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(
            onPressed: () {},
            splashRadius: 25,
            icon: const Icon(
              Icons.notifications_outlined,
              size: 28,
            )),
      ),
    ],
  );
}
