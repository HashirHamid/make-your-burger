import 'package:flutter/material.dart';

class ItemCount extends StatelessWidget {
  const ItemCount(
      {required this.count,
      required this.add,
      required this.remove,
      super.key});
  final int count;
  final VoidCallback add;
  final VoidCallback remove;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            remove();
          },
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.shade300),
            child: const Center(
              child: Icon(Icons.remove),
            ),
          ),
        ),
        Text(count.toString()),
        GestureDetector(
          onTap: () {
            add();
          },
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.shade300),
            child: const Center(
              child: Icon(Icons.add),
            ),
          ),
        ),
      ],
    );
  }
}
