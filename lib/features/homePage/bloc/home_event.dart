part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent{}
class AddClickEvent extends HomeEvent{
  final CoffeeModel clickedProduct;
  final double amount;

  AddClickEvent({required this.clickedProduct,required this.amount});
}

class AddNavigateEvent extends HomeEvent{
  final CoffeeModel addCoffee;

  AddNavigateEvent({required this.addCoffee});

}

class  FavoriteNavigateEvent extends HomeEvent{
  final CoffeeModel favorite;

  FavoriteNavigateEvent({required this.favorite});
}