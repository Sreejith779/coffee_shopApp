import 'package:coffee_shop/model/buyList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/buy_bloc.dart';

class BuyNow extends StatefulWidget {
  const BuyNow({super.key});

  @override
  State<BuyNow> createState() => _BuyNowState();
}

class _BuyNowState extends State<BuyNow> {
  @override
  void initState() {
  buyBloc.add(BuyInitialEvent());
    super.initState();
  }
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
              body: Column(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                                itemCount: buyList.length,
                                itemBuilder: (context,index){
                                  return SizedBox(
                                    height: 40,
                                    child: Row(
                                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(buyList[index].name,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18
                                        ),),
                                     Text('x ${buyList[index].price.toString()} Rs'),
                                     Container(
                                       child: Row(
                                         children: [
                                           IconButton(onPressed: (){},
                                               icon: const Icon(Icons.remove)),
                                           const SizedBox(width: 5,
                                           child: Text("1"),),
                                           IconButton(onPressed: (){},
                                               icon: const Icon(Icons.add,
                                               size: 22,))
                                         ],
                                       ),
                                     )
                                      ],
                                    ),
                                  );
                                }),
                          ),
                          Container(
                            padding: const EdgeInsets.all(20),
                            height: 120,
                           decoration: BoxDecoration(
                             color: Colors.brown.withOpacity(0.4),
                             borderRadius: BorderRadius.circular(15)
                           ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Total Amount 120rs",
                                style: TextStyle(fontSize: 20,
                                fontWeight: FontWeight.w600),),

                                Container(
                                  width: 60,
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.8),
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: const Center(
                                    child: Text("Buy",
                                                                    style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600
                                                                    ),),
                                  ),)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          default:
            return Center(child: Text("Error"));
        }

      },
    );
  }
}
