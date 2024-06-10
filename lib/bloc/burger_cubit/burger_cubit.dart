import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:make_your_burger/bloc/burger_cubit/burger_state.dart';
import 'package:make_your_burger/configs/burgerItems.dart';
import 'package:make_your_burger/models/burger_item_model.dart';

enum BurgerItems {
  cutlet,
  cheese,
  mayo,
  onion,
  tomato,
  salad,
  cucumber,
  bun,
  bbun
}

class BurgerCubit extends Cubit<BurgerState> {
  BurgerCubit() : super(Initial());

  List<BurgerItem> makeBurgerList = [];

  calculatePrice() {
    int count = 0;
    for (var item in makeBurgerList) {
      count = count + item.count;
    }
    return count;
  }

  List<BurgerItem> burgerItemsList = [
    burgerItems[BurgerItems.cheese.name]!,
    burgerItems[BurgerItems.cutlet.name]!,
    burgerItems[BurgerItems.mayo.name]!,
    burgerItems[BurgerItems.onion.name]!,
    burgerItems[BurgerItems.tomato.name]!,
    burgerItems[BurgerItems.salad.name]!,
    burgerItems[BurgerItems.cucumber.name]!,
    burgerItems[BurgerItems.bun.name]!,
  ];

  initMakeBurger() {
    emit(MakeBurger(makeBurgerList, 30, calculatePrice()));
  }

  void addItem(String name, int index) {
    if (makeBurgerList.isNotEmpty) {
      if (makeBurgerList.last.title == "Bun") {
        return;
      }
    }
    if (name == "bun") {
      if (makeBurgerList.length < 5) {
        return;
      }
    }
    if (burgerItemsList[index].count < 2) {
      burgerItemsList[index].count++;
      makeBurgerList.add(
        burgerItems[name]!,
      );
      emit(MakeBurger(makeBurgerList, 30, calculatePrice()));
    }
  }

  void removeItem(String name, int index) {
    if (burgerItemsList[index].count > 0) {
      burgerItemsList[index].count--;
      makeBurgerList.remove(
        burgerItems[name]!,
      );
      emit(MakeBurger(makeBurgerList, 30, calculatePrice()));
    }
  }

  disposeMakeBurger() {
    makeBurgerList.clear();
    for (var element in burgerItemsList) {
      element.count = 0;
    }
  }
}
