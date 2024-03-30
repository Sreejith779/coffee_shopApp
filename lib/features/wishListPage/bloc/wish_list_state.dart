part of 'wish_list_bloc.dart';

@immutable
abstract class WishListState {}
abstract class WishListActionState extends WishListState{}

class WishListInitial extends WishListState {}


class WishListLoadedState extends WishListState{}

class RemoveActionState extends WishListActionState{}

