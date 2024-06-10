import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:make_your_burger/screens/makeBurger/widgets/item_count_widget.dart';

class BurgerItemContainer extends StatelessWidget {
  BurgerItemContainer(
      {required this.title,
      required this.icon,
      required this.count,
      required this.add,
      required this.remove,
      super.key});
  final String title;
  final String icon;
  final int count;
  VoidCallback add;
  VoidCallback remove;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 130,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.4,
          color: Colors.blue.withOpacity(0.2),
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          title == "Bun" ? Image.asset(icon) : SvgPicture.asset(icon),
          Text(title),
          ItemCount(count: count, add: add, remove: remove),
        ],
      ),
    );
  }
}
