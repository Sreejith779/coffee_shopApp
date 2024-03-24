import 'package:carousel_slider/carousel_slider.dart';
import 'package:coffee_shop/features/homePage/ui/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadedState:
            final loadedState = state as HomeLoadedState;
            return Scaffold(
              body: Column(
                children: [
                  Container(
                    height: 150,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/coffee.jpg"),
                            fit: BoxFit.contain)),
                  ),
                  const Search(),
                  Container(
                      padding: const EdgeInsets.all(10),
                      alignment: Alignment.topLeft,
                      child: const Text(
                        "Categories",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w500),
                      )),
                  SizedBox(
                    height: 40,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: loadedState.coffeeModel.length,
                        itemBuilder: (context, index) {
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  width: 90,
                                  margin: const EdgeInsets.only(
                                      top: 5, left: 10, right: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.grey.withOpacity(0.2)),
                                  child: InkWell(
                                      focusColor: Colors.brown,
                                      onTap: () {},
                                      child: Center(
                                          child: Text(loadedState
                                              .coffeeModel[index].name)))),

                              // Container(
                              //   color: Colors.brown,
                              //   height: 40,
                              //   width: 150,
                              // )
                            ],
                          );
                        }),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 350,
                    child: CarouselSlider.builder(
                        itemCount: loadedState.coffeeModel.length,
                        itemBuilder: (context, index, realIndex) {
                          return Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 30),
                                child: Container(
                                  margin: const EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                      color: Colors.brown,
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                              ),
                              Positioned(
                                left: 50,
                                child: Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(loadedState
                                              .coffeeModel[index].image
                                              .toString()),
                                          fit: BoxFit.cover)),
                                  height: 160,
                                  margin: const EdgeInsets.only(bottom: 130),
                                  width: 190,
                                ),
                              ),
                              Positioned(
                                left: 30,
                                top: 160,
                                child: Text(
                                  loadedState.coffeeModel[index].name,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white.withOpacity(0.9)),
                                ),
                              ),
                              Positioned(
                                top: 190,
                                left: 28,
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  width: 70,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Center(
                                        child: Text(
                                          loadedState.coffeeModel[index].rating
                                              .toString(),
                                          style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const Positioned(
                                  top: 210,
                                  left: 170,
                                  child: Row(
                                    children: [
                                      Text(
                                        "Vol. ",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15),
                                      ),
                                      Text(
                                        "160ml.",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white),
                                      ),
                                    ],
                                  )),
                              const Positioned(
                                  top: 250,
                                  left: 190,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 35,
                                    child: Icon(
                                      Icons.add,
                                      size: 40,
                                      color: Colors.brown,
                                    ),
                                  )),
                              Positioned(
                                  top: 270,
                                  left: 30,
                                  child: Text(
                                    'Rs ${loadedState.coffeeModel[index].price.toString()}',
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ))
                            ],
                          );
                        },
                        options: CarouselOptions(
                            height: 400,
                            viewportFraction: 0.75,
                            enlargeCenterPage: true)),
                  )
                ],
              ),
            );

          default:
            return const Center(child: Text("Error"));
        }
      },
    );
  }
}
