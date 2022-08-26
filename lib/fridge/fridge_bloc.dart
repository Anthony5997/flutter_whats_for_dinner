import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_whats_for_dinner/authentication/repository/authentication_repository.dart';
import 'package:flutter_whats_for_dinner/fridge/repository/fridge_repository.dart';
import 'package:flutter_whats_for_dinner/models/Fridge.dart';
import 'package:flutter_whats_for_dinner/models/User.dart';

part 'fridge_event.dart';
part 'fridge_state.dart';

class FridgeBloc extends Bloc<FridgeEvent, FridgeState> {
  final AuthenticationRepository authenticationRepository =
      AuthenticationRepository();
  final FridgeRepository fridgeRepository = FridgeRepository();
  FridgeBloc() : super(FridgeInitial()) {
    on<FridgeEvent>((event, emit) {});
    on<FridgeLoadedEvent>((event, emit) {});

    on<FridgeLoadingEvent>((event, emit) async {
      try {
        final fridge = await fridgeRepository.getUserFridge();
        print("RESPONSE DANS BLOC");
        print(fridge);
        emit(FridgeLoadedState(fridge));
      } catch (e) {
        emit(FridgeEmptyState());
      }
    });
  }
}
