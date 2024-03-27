import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:coffee_shop/model/buyList.dart';
import 'package:coffee_shop/model/coffee_model.dart';
import 'package:meta/meta.dart';

part 'buy_event.dart';
part 'buy_state.dart';

class BuyBloc extends Bloc<BuyEvent, BuyState> {
  BuyBloc() : super(BuyInitial()) {
 on<BuyInitialEvent>(buyInitialEvent);
  }

  FutureOr<void> buyInitialEvent(BuyInitialEvent event, Emitter<BuyState> emit) {
    emit(BuyLoadedState(buyModel: buyList));
  }
}
