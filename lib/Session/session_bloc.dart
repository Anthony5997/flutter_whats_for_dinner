import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_whats_for_dinner/authentication/repository/authentication_repository.dart';
import 'package:flutter_whats_for_dinner/fridge/repository/fridge_repository.dart';
import 'package:flutter_whats_for_dinner/models/Fridge.dart';
import 'package:flutter_whats_for_dinner/models/User.dart';
import 'package:flutter_whats_for_dinner/screen/loading_screen.dart';

part 'session_event.dart';
part 'session_state.dart';

class SessionBloc extends Bloc<SessionEvent, SessionState> {
  // int currentIndex = 0;
  SessionBloc() : super(SessionInitial()) {
    on<SessionEvent>((event, emit) {});

    on<SessionFridgeEvent>((event, emit) {
      emit(SessionInitial());
    });

    on<SessionIngredientCategoryEvent>((event, emit) {
      emit(SessionIngredientCategoryState());
    });

    on<SessionPageSelectedEvent>((event, emit) async {
      if (event.index == 0) {
        emit(SessionInitial());
      }
      if (event.index == 1) {
        emit(SessionRecipeListState());
      }
      if (event.index == 2) {
        emit(SessionFavoriteState());
      }
      if (event.index == 3) {
        User userInfo = await AuthenticationRepository().getUserSharedPreferences();
        Fridge userfridge = await FridgeRepository().getUserFridge();
        print(userInfo.email);
        print(userInfo.nickname);
        emit(SessionProfileState(userInfo, userfridge));
      }
    });

    on<SessionLogoutEvent>((event, emit) {});
  }
}
