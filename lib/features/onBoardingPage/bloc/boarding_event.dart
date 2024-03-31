part of 'boarding_bloc.dart';

@immutable
sealed class BoardingEvent {}

class BoardingInitialEvent extends BoardingEvent{}
