import 'package:alexapps/view%20model/home_page_state.dart';
import 'package:bloc/bloc.dart';


class CartCubit extends Cubit<AppState> {
  CartCubit() : super(Initial());

  int selectedAddressIndex = 0;

  void changeAddressIndex(int index) {
    selectedAddressIndex = index;
    emit(Initial());
  }

  int amount1 = 1;
  add1() {
    amount1++;
    emit(Initial());
  }

  remove1() {
    if (amount1 < 0 || amount1 == 0) {
    } else {
      amount1--;
      emit(Initial());
    }
  }

  int amount2 = 1;
  add2() {
    amount2++;
    emit(Initial());
  }

  remove2() {
    if (amount2 < 0 || amount2 == 0) {
    } else {
      amount2--;
      emit(Initial());
    }
  }
}
