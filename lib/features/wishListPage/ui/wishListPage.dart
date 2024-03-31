import 'package:coffee_shop/model/favoriteList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/wish_list_bloc.dart';

class WishList extends StatefulWidget {
  const WishList({super.key});

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  @override
  void initState() {
    wishListBloc.add(WishlistInitialEvent());
    super.initState();
  }

  WishListBloc wishListBloc = WishListBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WishListBloc, WishListState>(
      bloc: wishListBloc,
      listenWhen: (previous, current) => (current is WishListActionState),
      buildWhen: (previous, current) => (current is! WishListActionState),
      listener: (context, state) {
        if (state is RemoveActionState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Item removed")));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case WishListLoadedState:
            return Scaffold(
              appBar: AppBar(
                title: const Text("Favorite"),
              ),
              body: Container(
                margin: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          itemCount: favoriteList.length,
                          itemBuilder: (context, index) {
                            bool isEmpty = favoriteList.isNotEmpty;

                       return
                         Container(
                                    padding: const EdgeInsets.all(10),
                                    child:
                                    Column(
                                      crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.only(
                                              top: 5, left: 20, right: 20),
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.brown.withOpacity(0.2),
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          width: double.maxFinite,
                                          height: 80,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                favoriteList[index].name,
                                                  style: const TextStyle(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              IconButton(
                                                  onPressed: () {
                                                    wishListBloc.add(
                                                        RemoveItemEvent(
                                                            remove:
                                                                favoriteList[
                                                                    index]));
                                                  },
                                                  icon: const Icon(
                                                      Icons.delete_outline))
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                          }),
                    )
                  ],
                ),
              ),
            );

          default:
            return const Center(child: Text("Error"));
        }
      },
    );
  }
}
