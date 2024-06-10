import 'package:flutter/material.dart';

PreferredSizeWidget appBar(BuildContext context) {
  return AppBar(
    title: const Text(
      "Make Your Burger",
      style: TextStyle(fontWeight: FontWeight.w600),
    ),
    actions: [
      Container(
        height: 45,
        width: 45,
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(30),
        ),
        child: const Icon(Icons.person),
      ),
    ],
  );
}
