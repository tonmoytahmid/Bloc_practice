import 'package:bloc_practice/fetures/navigation/bloc/navEvent.dart';
import 'package:bloc_practice/fetures/navigation/bloc/navState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Navbloc extends Bloc<NavEvent, Navstate> {
  Navbloc() : super(Navstate(selectedIndex: 0)) {
    on<NavigateToPage>((event, emit) {
      emit(Navstate(selectedIndex: event.index));
    });
  }
}
