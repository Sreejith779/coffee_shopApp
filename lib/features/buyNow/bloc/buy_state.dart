part of 'buy_bloc.dart';

@immutable
abstract class BuyState {}
abstract class BuyActionState extends BuyState{}

class BuyInitial extends BuyState {}

class BuyLoadedState extends BuyState{
  final List<CoffeeModel> buyModel;

  BuyLoadedState({required this.buyModel});
}

class IncrementActionState extends BuyState{}