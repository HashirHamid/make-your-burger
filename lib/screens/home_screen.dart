import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:make_your_burger/bloc/burger_cubit/burger_cubit.dart';
import 'package:make_your_burger/configs/assets.dart';
import 'package:make_your_burger/screens/makeBurger/make_burger_screen.dart';
import 'package:make_your_burger/widgets/appBar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Assets.mainImgPng,
            ),
            GestureDetector(
              onTap: () {
                context.read<BurgerCubit>().initMakeBurger();
                Navigator.of(context).pushNamed(MakeBurgerScreen.routeName);
              },
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90),
                    color: Theme.of(context).primaryColor),
                child: const Center(
                  child: Text(
                    "MAKE\nBURGER",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
