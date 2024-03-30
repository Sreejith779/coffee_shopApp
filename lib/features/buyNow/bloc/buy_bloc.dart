import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:coffee_shop/features/buyNow/ui/buyNow.dart';
import 'package:coffee_shop/model/buyList.dart';
import 'package:coffee_shop/model/coffee_model.dart';
import 'package:meta/meta.dart';

part 'buy_event.dart';
part 'buy_state.dart';

class BuyBloc extends Bloc<BuyEvent, BuyState> {
  BuyBloc() : super(BuyInitial()) {
 on<BuyInitialEvent>(buyInitialEvent);
 on<IncrementEvent>(incrementEvent);
 on<DecrementEvent>(decrementEvent);
  }

  FutureOr<void> buyInitialEvent(BuyInitialEvent event, Emitter<BuyState> emit) {
    emit(BuyLoadedState(buyModel: buyList));
  }

  FutureOr<void> incrementEvent(IncrementEvent event, Emitter<BuyState> emit) {
    emit(IncrementActionState());
  }

  FutureOr<void> decrementEvent(DecrementEvent event, Emitter<BuyState> emit) {
    if(event.decrementAmount==1){
      buyList.remove(event.buyList);
    }

    emit(DecrementActionState());

  }
}
