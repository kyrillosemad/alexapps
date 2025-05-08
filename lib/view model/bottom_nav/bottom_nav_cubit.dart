import 'package:alexapps/view%20model/home_page_state.dart';
import 'package:alexapps/view/modules/cart/screens/cart.dart';
import 'package:alexapps/view/modules/main/screens/favorite.dart';
import 'package:alexapps/view/modules/homepage/screens/home_page.dart';
import 'package:alexapps/view/modules/main/screens/profile.dart';
import 'package:alexapps/view/modules/main/screens/shop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class BottomNavCubit extends Cubit<AppState> {
  BottomNavCubit() : super(Initial());
  int curIndex = 0;
  changeIndex(int index) {
    curIndex = index;
    emit(Initial());
  }

  final List<Widget> pages = const [
    HomePage(),
    Shop(),
    Cart(),
    Favorite(),
    Profile(),
  ];
}
