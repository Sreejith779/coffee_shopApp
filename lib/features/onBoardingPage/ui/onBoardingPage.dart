import 'package:coffee_shop/features/routePage/ui/homePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../bloc/boarding_bloc.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  void initState() {
boardingBloc.add(BoardingInitialEvent());
    super.initState();
  }
  BoardingBloc boardingBloc = BoardingBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BoardingBloc, BoardingState>(
      bloc: boardingBloc,
      listenWhen: (previous,current)=> (current is BoardingActionState),
      buildWhen: (previous,current)=> (current is !BoardingActionState),

      listener: (context, state) {
if(state is NavigateBoardingActionState){
Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>RoutePage()));
}
      },
      builder: (context, state) {
        switch(state.runtimeType){
          case BoardingLoadedState:
            return  Scaffold(
              backgroundColor: Colors.white,
              body: Center(
                child: Lottie.network(
                    'https://lottie.host/b6764ef6-0e3f-42eb-b3e3-691fcce5e8a6/H3XxpcJcPc.json')
              ),
            );
            
          default:
            return Center( 
              child: Text("Error"),
            );
        }
    
      },
    );
  }
}
