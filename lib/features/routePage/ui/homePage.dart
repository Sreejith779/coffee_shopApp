
import 'package:coffee_shop/features/buyNow/ui/buyNow.dart';
import 'package:coffee_shop/features/homePage/ui/homePage.dart';
import 'package:coffee_shop/features/onBoardingPage/ui/onBoardingPage.dart';
import 'package:coffee_shop/features/wishListPage/ui/wishListPage.dart';
import 'package:flutter/material.dart';


class RoutePage extends StatefulWidget {
  const RoutePage({super.key});

  @override
  State<RoutePage> createState() => _RoutePageState();
}

class _RoutePageState extends State<RoutePage> {
  int isSelect = 0;
  final _tabs = [
    HomePage(),
    WishList(),
    BuyNow()
  ];

  @override
  Widget build(BuildContext context) {
        return Scaffold(
          backgroundColor: Colors.white,
          bottomNavigationBar: NavigationBar(
            elevation: 0,
            onDestinationSelected: (index){
              setState(() {
                isSelect = index;
              });
            },
              selectedIndex: isSelect,
              destinations: const [
                NavigationDestination(icon: Icon(Icons.home), label: "Home"),
                NavigationDestination(icon: Icon(Icons.favorite_outline), label: "Favourite"),
                NavigationDestination(icon: Icon(Icons.coffee_maker_rounded,color: Colors.brown,), label: "Buy"),
                // NavigationDestination(icon: Icon(Icons.person_2_outlined), label: "Person"),
              ]),
          body: _tabs[isSelect],
        );

  }
}
