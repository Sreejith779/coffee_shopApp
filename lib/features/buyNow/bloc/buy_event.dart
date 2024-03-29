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

  DecrementEvent({required this.decrementAmount});
}

class TotalAmountEvent extends BuyEvent{
  final double totalAmount;

  TotalAmountEvent({required this.totalAmount});
}