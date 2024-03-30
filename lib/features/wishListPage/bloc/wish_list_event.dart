part of 'wish_list_bloc.dart';

@immutable
abstract class WishListEvent {}
class WishlistInitialEvent extends WishListEvent{}

class RemoveItemEvent extends WishListEvent{
  final CoffeeModel remove;

  RemoveItemEvent({required this.remove});
}

