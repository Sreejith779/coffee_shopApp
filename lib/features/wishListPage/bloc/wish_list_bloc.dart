import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:coffee_shop/model/coffee_model.dart';
import 'package:coffee_shop/model/favoriteList.dart';
import 'package:meta/meta.dart';

part 'wish_list_event.dart';
part 'wish_list_state.dart';

class WishListBloc extends Bloc<WishListEvent, WishListState> {
  WishListBloc() : super(WishListInitial()) {
on<WishlistInitialEvent>(wishlistInitialEvent);
on<RemoveItemEvent>(removeItemEvent);
  }

  FutureOr<void> wishlistInitialEvent(WishlistInitialEvent event, Emitter<WishListState> emit) {
    emit(WishListLoadedState());
  }

  FutureOr<void> removeItemEvent(RemoveItemEvent event, Emitter<WishListState> emit) {
favoriteList.remove(event.remove);
emit(WishListLoadedState());
emit(RemoveActionState());
  }
}
