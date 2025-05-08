import 'package:alexapps/view%20model/product_details/product_details_cubit.dart';
import 'package:alexapps/view/modules/product/widgets/product_appbar.dart';
import 'package:alexapps/view/modules/product/widgets/product_info.dart';
import 'package:alexapps/view/modules/product/widgets/products_favorite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';


class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductDetailsCubit(Get.arguments['homeCubit']),
      child: Builder(
        builder: (context) {
          var controller = context.read<ProductDetailsCubit>();
          return SafeArea(
            child: Scaffold(
              body: SizedBox(
                width: 100.w,
                height: 100.h,
                child: Stack(
                  children: [
                    ProductInfo(
                      controller: controller,
                    ),
                    ProductAppbar(controller: controller),
                    ProductFavorite(controller: controller),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ContainerClipper extends CustomClipper<Path> {
  var path = Path();

  @override
  Path getClip(Size size) {
    path.lineTo(0, size.height - 20);
    path.quadraticBezierTo(size.width * 0.01, size.height - 100,
        size.width * 0.3, size.height - 95);
    path.lineTo(size.width - 70, size.height - 95);
    path.quadraticBezierTo(
        size.width, size.height - 100, size.width, size.height - 150);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}



