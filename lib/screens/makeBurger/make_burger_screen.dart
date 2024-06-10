import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:make_your_burger/bloc/burger_cubit/burger_cubit.dart';
import 'package:make_your_burger/bloc/burger_cubit/burger_state.dart';
import 'package:make_your_burger/configs/assets.dart';
import 'package:make_your_burger/configs/size.dart';
import 'package:make_your_burger/models/burger_item_model.dart';
import 'package:make_your_burger/screens/makeBurger/widgets/burger_item_container_widget.dart';
import 'package:make_your_burger/widgets/appBar.dart';

class MakeBurgerScreen extends StatelessWidget {
  static const routeName = '/make-burger';

  const MakeBurgerScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (pop) {
        if (pop) return;
        context.read<BurgerCubit>().disposeMakeBurger();
        Navigator.of(context).pop();
      },
      child: Scaffold(
        appBar: appBar(context),
        body: Column(
          children: [
            Container(
              height: getHeight(context) * .5,
              width: getWidth(context),
              padding: const EdgeInsets.all(8),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SvgPicture.asset(
                    Assets.bgBlobSvg,
                    height: 350,
                  ),
                  Positioned(
                      bottom: 30,
                      child: Image.asset(
                        Assets.bunBottomPng,
                        width: 200,
                      )),
                  BlocBuilder<BurgerCubit, BurgerState>(
                    builder: (context, state) {
                      List<BurgerItem> list = (state as MakeBurger).list;
                      double position = state.position;
                      return Stack(
                          alignment: Alignment.center,
                          children: list.map((item) {
                            position = position + item.position;
                            return Positioned(
                              bottom: position,
                              child: item.title == "BBun" || item.title == "Bun"
                                  ? Image.asset(
                                      item.icon,
                                      width: 200,
                                    )
                                  : SvgPicture.asset(
                                      item.icon,
                                      width: 200,
                                    ),
                            );
                          }).toList());
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: getHeight(context) * .2,
              child: BlocBuilder<BurgerCubit, BurgerState>(
                builder: (context, state) {
                  return ListView.separated(
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        width: 20,
                      );
                    },
                    scrollDirection: Axis.horizontal,
                    itemCount:
                        context.read<BurgerCubit>().burgerItemsList.length,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemBuilder: (context, index) {
                      final list = context.read<BurgerCubit>().burgerItemsList;
                      final item = list[index];
                      return BurgerItemContainer(
                          title: item.title,
                          icon: item.icon,
                          count: item.count,
                          add: () {
                            context
                                .read<BurgerCubit>()
                                .addItem(item.title.toLowerCase(), index);
                          },
                          remove: () {
                            context
                                .read<BurgerCubit>()
                                .removeItem(item.title.toLowerCase(), index);
                          });
                    },
                  );
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BlocBuilder<BurgerCubit, BurgerState>(
                    builder: (context, state) {
                      return Text(
                        "\$${(state as MakeBurger).price}",
                        style: TextStyle(
                            fontSize: 30,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold),
                      );
                    },
                  ),
                  CupertinoButton(
                      color: Theme.of(context).primaryColor,
                      child: const Text("Checkout"),
                      onPressed: () {}),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
