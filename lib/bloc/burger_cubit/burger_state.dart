import 'package:make_your_burger/models/burger_item_model.dart';

abstract class BurgerState {}

class Initial extends BurgerState {}

class MakeBurger extends BurgerState {
  MakeBurger(this.list, this.position, this.price);
  final List<BurgerItem> list;
  double position;
  int price;
}
// class  extends BurgerState {}

