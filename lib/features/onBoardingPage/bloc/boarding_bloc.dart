import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'boarding_event.dart';
part 'boarding_state.dart';

class BoardingBloc extends Bloc<BoardingEvent, BoardingState> {
  BoardingBloc() : super(BoardingInitial()) {
  on<BoardingInitialEvent>(boardingInitialEvent);
  }

  FutureOr<void> boardingInitialEvent(BoardingInitialEvent event, Emitter<BoardingState> emit) async{
emit(BoardingLoadedState());

  await  Future.delayed(const Duration(seconds: 8));
    emit(NavigateBoardingActionState());

  }
}
