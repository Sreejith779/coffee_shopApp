part of 'boarding_bloc.dart';

@immutable
sealed class BoardingState {}

sealed class BoardingActionState extends BoardingState{}

class BoardingInitial extends BoardingState {}
class BoardingLoadedState extends BoardingState{}

class NavigateBoardingActionState extends BoardingActionState{}


