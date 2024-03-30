part of 'buy_bloc.dart';

@immutable
abstract class BuyEvent {}

class BuyInitialEvent extends BuyEvent{}

class IncrementEvent extends BuyEvent{
final int incrementAmount;

  IncrementEvent({required this.incrementAmount});




}

class DecrementEvent extends BuyEvent{
  final int decrementAmount;
  final CoffeeModel buyList;


  DecrementEvent({required this.decrementAmount,required this.buyList});
}

class TotalAmountEvent extends BuyEvent{
  final double totalAmount;

  TotalAmountEvent({required this.totalAmount});
}


class ItemRemoveEvent extends BuyEvent{}