import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'buy_event.dart';
part 'buy_state.dart';

class BuyBloc extends Bloc<BuyEvent, BuyState> {
  BuyBloc() : super(BuyInitial()) {
    on<BuyEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
