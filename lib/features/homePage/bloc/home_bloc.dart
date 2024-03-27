import 'dart:async';


import 'package:bloc/bloc.dart';
import 'package:coffee_shop/model/buyList.dart';
import 'package:coffee_shop/model/coffee_modelData.dart';
import 'package:meta/meta.dart';

import '../../../model/coffee_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
   on<HomeInitialEvent>(homeInitialEvent);
   on<AddClickEvent>(addClickEvent);
   on<AddNavigateEvent>(addNavigateEvent);
  }

  FutureOr<void> homeInitialEvent(HomeInitialEvent event, Emitter<HomeState> emit)async {
    emit(HomeLoadingState());
   await Future.delayed(const Duration(seconds: 3));

    emit(HomeLoadedState());
  }

  FutureOr<void> addNavigateEvent(AddNavigateEvent event, Emitter<HomeState> emit) {
    emit(AddNavigateActionState());
  }

  FutureOr<void> addClickEvent(AddClickEvent event, Emitter<HomeState> emit) {
    buyList.add(event.clickedProduct);
    emit(AddClickedState());
  }
}
