part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent{}

class AddNavigateEvent extends HomeEvent{
  final CoffeeModel addCoffee;

  AddNavigateEvent({required this.addCoffee});


}