import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/buy_bloc.dart';

class BuyNow extends StatefulWidget {
  const BuyNow({super.key});

  @override
  State<BuyNow> createState() => _BuyNowState();
}

class _BuyNowState extends State<BuyNow> {
  BuyBloc buyBloc = BuyBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BuyBloc, BuyState>(
      bloc: buyBloc,
      listenWhen: (previous,current)=>(current is BuyActionState),
      buildWhen: (previous,current)=>(current is !BuyActionState),
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        switch(state.runtimeType){
          case BuyLoadedState:
            return Scaffold(
              appBar: AppBar(
                title: const Text("Items"),
              ),
            );
          default:
            return Center(child: Text("Error"));
        }

      },
    );
  }
}
