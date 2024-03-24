import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:coffee_shop/model/coffee_modelData.dart';
import 'package:meta/meta.dart';

import '../../../model/coffee_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
   on<HomeInitialEvent>(homeInitialEvent);
  }

  FutureOr<void> homeInitialEvent(HomeInitialEvent event, Emitter<HomeState> emit) {
    emit(HomeLoadedState());
  }
}
