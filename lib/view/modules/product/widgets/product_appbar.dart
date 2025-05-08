import 'package:alexapps/core/constants/colors.dart';
import 'package:alexapps/view%20model/product_details/product_details_cubit.dart';
import 'package:alexapps/view/modules/product/screens/product_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';


class ProductAppbar extends StatelessWidget {
 final ProductDetailsCubit controller;
  const ProductAppbar({super.key,required this.controller});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ContainerClipper(),
      child: Container(
        alignment: Alignment.topCenter,
        width: 100.w,
        height: 55.h,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColor.primaryColor.withOpacity(0.5),
              AppColor.secondColor.withOpacity(0.5)
            ],
          ),
          image: DecorationImage(
            image: AssetImage("${controller.product.image}"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.only(top: 4.h, right: 2.w, left: 2.w),
          child: SizedBox(
            width: 100.w,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: 1.h),
                    child: Text(
                      controller.product.label ?? '',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
