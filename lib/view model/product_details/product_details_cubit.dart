import 'package:alexapps/view%20model/home_page/home_page_cubit.dart';
import 'package:alexapps/view%20model/home_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class ProductDetailsCubit extends Cubit<AppState> {
  final HomePageCubit homeCubit;
  var product = Get.arguments['product'];

  ProductDetailsCubit(this.homeCubit) : super(Initial());

  void changeFavorite() {
    product.favorite = !product.favorite;
    emit(Initial());
    homeCubit.emit(Initial());
  }
}