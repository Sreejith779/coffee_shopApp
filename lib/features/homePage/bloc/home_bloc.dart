import 'dart:async';


import 'package:bloc/bloc.dart';
import 'package:coffee_shop/model/buyList.dart';
import 'package:coffee_shop/model/coffee_modelData.dart';
import 'package:coffee_shop/model/favoriteList.dart';
import 'package:meta/meta.dart';

import '../../../model/coffee_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
   on<HomeInitialEvent>(homeInitialEvent);
   on<AddClickEvent>(addClickEvent);
   on<AddNavigateEvent>(addNavigateEvent);
on<FavoriteNavigateEvent>(favoriteNavigateEvent);
  }

  FutureOr<void> homeInitialEvent(HomeInitialEvent event, Emitter<HomeState> emit)async {
    emit(HomeLoadingState());
   await Future.delayed(const Duration(milliseconds: 13));

    emit(HomeLoadedState());
  }

  FutureOr<void> addNavigateEvent(AddNavigateEvent event, Emitter<HomeState> emit) {
    emit(AddNavigateActionState());
  }

  FutureOr<void> addClickEvent(AddClickEvent event, Emitter<HomeState> emit) {
    buyList.add(event.clickedProduct);
    emit(AddClickedState());
  }

  FutureOr<void> favoriteNavigateEvent(FavoriteNavigateEvent event, Emitter<HomeState> emit) {
    favoriteList.add(event.favorite);
    emit(FavoriteNavigateActionState());
  }
}
