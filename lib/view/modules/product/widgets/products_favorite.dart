import 'package:alexapps/view%20model/home_page_state.dart';
import 'package:alexapps/view%20model/product_details/product_details_cubit.dart';
import 'package:alexapps/view/modules/homepage/widgets/homepage_heart_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';


class ProductFavorite extends StatelessWidget {
  final ProductDetailsCubit controller;
  const ProductFavorite({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 40.h,
        right: 15.w,
        child: BlocBuilder<ProductDetailsCubit, AppState>(
          builder: (context, state) {
            return CircleAvatar(
              radius: 27,
              backgroundColor: const Color.fromARGB(255, 216, 217, 216),
              child: HeartIcon(
                isFavorite: controller.product.favorite,
                onTap: () {
                  controller.changeFavorite();
                },
              ),
            );
          },
        ));
  }
}
