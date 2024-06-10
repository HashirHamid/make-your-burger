import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:make_your_burger/bloc/burger_cubit/burger_cubit.dart';
import 'package:make_your_burger/screens/home_screen.dart';
import 'package:make_your_burger/screens/makeBurger/make_burger_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BurgerCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            fontFamily: "Poppins"),
        home: const HomeScreen(),
        routes: {
          MakeBurgerScreen.routeName: (context) => const MakeBurgerScreen()
        },
      ),
    );
  }
}
