import 'package:make_your_burger/bloc/burger_cubit/burger_cubit.dart';
import 'package:make_your_burger/configs/assets.dart';
import 'package:make_your_burger/models/burger_item_model.dart';

Map<String, BurgerItem> burgerItems = {
  BurgerItems.cutlet.name: BurgerItem(
    title: "Cutlet",
    icon: Assets.cutletSvg,
    count: 0,
    position: 18,
    price: 2,
  ),
  BurgerItems.cheese.name: BurgerItem(
    title: "Cheese",
    icon: Assets.cheeseSvg,
    count: 0,
    position: 15,
    price: 2,
  ),
  BurgerItems.mayo.name: BurgerItem(
    title: "Mayo",
    icon: Assets.mayoSvg,
    count: 0,
    position: 15,
    price: 1,
  ),
  BurgerItems.onion.name: BurgerItem(
    title: "Onion",
    icon: Assets.onionSvg,
    count: 0,
    position: 18,
    price: 1,
  ),
  BurgerItems.tomato.name: BurgerItem(
    title: "Tomato",
    icon: Assets.tomatoSvg,
    count: 0,
    position: 18,
    price: 1,
  ),
  BurgerItems.salad.name: BurgerItem(
    title: "Salad",
    icon: Assets.saladSvg,
    count: 0,
    position: 18,
    price: 1,
  ),
  BurgerItems.cucumber.name: BurgerItem(
    title: "Cucumber",
    icon: Assets.cucumberSvg,
    count: 0,
    position: 18,
    price: 1,
  ),
  BurgerItems.bun.name: BurgerItem(
    title: "Bun",
    icon: Assets.bunTopPng,
    count: 0,
    position: 22,
    price: 1,
  ),
};
