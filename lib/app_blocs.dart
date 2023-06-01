import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:elearn_app/app_events.dart';
import 'package:elearn_app/app_states.dart';

class AppBlocks extends Bloc<AppEvents, AppStates> {
  AppBlocks():super(InitStates()){
    on<Increment>((event, emit) {
      emit(AppStates(counter: state.counter+1));
    });

    on<Decrement>((event, emit) => emit(AppStates(counter: state.counter-1)));
  }
}