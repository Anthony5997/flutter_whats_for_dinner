import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'session_event.dart';
part 'session_state.dart';

class SessionBloc extends Bloc<SessionEvent, SessionState> {
  int currentIndex = 0;
  SessionBloc() : super(SessionInitial()) {
    on<SessionEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<SessionFridgeEvent>((event, emit) {
      emit(SessionInitial());
    });

    on<SessionPageSelectedEvent>((event, emit) async {
      print("Je change mon index ! ");
      currentIndex = await event.index;
      print(currentIndex);

      emit(SessionPageSelectedState(currentIndex: currentIndex));

      if (this.currentIndex == 0) {
        print("Jaffiche session initial!");
        print("===================================");

        //String data = await _getFirstPageData();
        emit(SessionInitial());
      }
      if (this.currentIndex == 1) {
        print("Jaffiche recette !");
        print("===================================");

        //int data = await _getSecondPageData();
        emit(SessionIngredientCategoryState());
      }
    });

    on<SessionLogoutEvent>((event, emit) {});
  }
}
