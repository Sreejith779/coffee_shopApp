import 'package:coffee_shop/model/buyList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../bloc/buy_bloc.dart';

class BuyNow extends StatefulWidget {
  const BuyNow({super.key});

  @override
  State<BuyNow> createState() => _BuyNowState();
}

class _BuyNowState extends State<BuyNow> {
   int count = 1;
   double totalSum = 0;
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
     if(state is IncrementActionState){
 setState(() {
 if(count>=0){
   setState(() {
     count++;
   });
 }
 });
     }
     else if(state is DecrementActionState){
    setState(() {
      if(count>=1){
        setState(() {
          count--;
        });
      }
    });
     }
      },
      builder: (context, state) {
        bool isEmpty = buyList.isEmpty;
        switch(state.runtimeType){
          case BuyLoadedState:
            return Scaffold(
              appBar: AppBar(
                title: const Text("Items"),
              ),
              body:
 isEmpty?
  Center(
   child: Lottie.network("https://lottie.host/0dfbbb3c-46d5-4779-9ec3-b1b2458f48f1/ukDzDgJgAW.json",
   height: 280),):
 Column(
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
                                  double totalAmount = buyList[index].price;
totalSum = totalSum + totalAmount;
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
                                           IconButton(onPressed: (){
                                         buyBloc.add(DecrementEvent(decrementAmount: count, buyList: buyList[index]));
                                           },
                                               icon: const Icon(Icons.remove)),
                                            SizedBox(width: 25,
                                           child: Text(count.toString()),),
                                           IconButton(onPressed: (){
                                             buyBloc.add(IncrementEvent(incrementAmount:count));
                                           },
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
                                 Text("Total Amount $totalSum rs",
                                style: const TextStyle(fontSize: 20,
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
              ));
          default:
            return Center(child: Text("Error"));
        }

      },
    );
  }
}
