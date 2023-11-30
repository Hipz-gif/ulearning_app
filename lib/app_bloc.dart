
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/app_events.dart';
import 'package:ulearning_app/app_state.dart';

class AppBlocs extends Bloc<AppEvent, AppState>{
  AppBlocs() : super(InitStates()){
    on<Increment>((event, ask){
      ask(AppState(counter: state.counter+1));
    });
    on<Decrement>((event, ask){
      ask(AppState(counter: state.counter-1));
    });
  }
}