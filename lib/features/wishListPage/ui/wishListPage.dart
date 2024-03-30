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
      listenWhen: (previous,current)=>(current is WishListActionState),
      buildWhen: (previous,current)=>(current is !WishListActionState),
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        switch(state.runtimeType){
          case WishListLoadedState:
            return  Scaffold(
              appBar: AppBar(
                title: const Text("Favorite"),
              ),
            );

          default:
            return const Center(
              child: Text("Error")
            );
        }

      },
    );
  }
}
