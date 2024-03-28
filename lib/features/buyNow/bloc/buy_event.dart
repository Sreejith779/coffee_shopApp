part of 'buy_bloc.dart';

@immutable
abstract class BuyEvent {}

class BuyInitialEvent extends BuyEvent{}

class IncrementEvent extends BuyEvent{

}