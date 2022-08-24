import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_whats_for_dinner/authentication/repository/authentication_repository.dart';
import 'package:flutter_whats_for_dinner/fridge/repository/fridge_repository.dart';
import 'package:flutter_whats_for_dinner/models/User.dart';

part 'fridge_event.dart';
part 'fridge_state.dart';

class FridgeBloc extends Bloc<FridgeEvent, FridgeState> {
  final AuthenticationRepository authenticationRepository = AuthenticationRepository();
  final FridgeRepository fridgeRepository = FridgeRepository();
  FridgeBloc() : super(FridgeInitial()) {
    on<FridgeEvent>((event, emit) {});
    on<FridgeLoadedEvent>((event, emit) {});

    on<FridgeLoadingEvent>((event, emit) async {
      // User user = await authenticationRepository.getUser();
      print("USER");
      var user = "";
      print(user);

      if (user != "null") {
        try {
          final fridge = await fridgeRepository.getUserFridge();
          print("RESPONSE DANS BLOC");
          print(fridge);
          if (fridge["total_results"] == 0) {
            emit(FridgeEmptyState());
          } else {
            emit(FridgeLoadedState(fridge["results"]));
          }
        } catch (e) {
          emit(FridgeErrorState());
        }
      } else {
        emit(FridgeInitial());
      }
    });
  }
}
