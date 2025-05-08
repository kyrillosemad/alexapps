import 'package:alexapps/core/constants/routes_name.dart';
import 'package:alexapps/data/data.dart';
import 'package:alexapps/model/product_model.dart';
import 'package:alexapps/model/recommended_products.dart';
import 'package:alexapps/view%20model/home_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class HomePageCubit extends Cubit<AppState> {
  HomePageCubit() : super(Initial());

  List<ProductModel> products = Data().products;
  List<RecommendedProducts> recoProducts = Data().recommendedProducts;
  changeFavorite(int index) {
    products[index].favorite = !products[index].favorite;
    emit(Initial());
  }

  changeFavorite2(int index) {
    recoProducts[index].favorite = !recoProducts[index].favorite;
    emit(Initial());
  }

  goToProductDetails(var product, BuildContext context) {
    Get.toNamed(AppRoutes().productDetails, arguments: {
      "product": product,
      'homeCubit': context.read<HomePageCubit>()
    });
  }
 
}
