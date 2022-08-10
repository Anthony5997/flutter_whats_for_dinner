import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'fridge_event.dart';
part 'fridge_state.dart';

class FridgeBloc extends Bloc<FridgeEvent, FridgeState> {
  FridgeBloc() : super(FridgeInitial()) {
    on<FridgeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
