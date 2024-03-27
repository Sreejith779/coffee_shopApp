part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent{}
class AddClickEvent extends HomeEvent{
  final CoffeeModel clickedProduct;

  AddClickEvent({required this.clickedProduct});
}

class AddNavigateEvent extends HomeEvent{
  final CoffeeModel addCoffee;

  AddNavigateEvent({required this.addCoffee});
}