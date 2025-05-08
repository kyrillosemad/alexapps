import 'package:alexapps/core/constants/colors.dart';
import 'package:alexapps/view%20model/product_details/product_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


class ProductInfo extends StatelessWidget {
  final ProductDetailsCubit controller;
  const ProductInfo({super.key,required this.controller});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 43.h,
      child: Container(
        padding: EdgeInsets.only(top: 5.h),
        width: 100.w,
        height: 70.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(left: 8.w),
              child: Text(
                "Descripción",
                style: TextStyle(fontSize: 15.sp, color: AppColor.customBlue),
              ),
            ),
            SizedBox(height: 2.h),
            Container(
              padding: EdgeInsets.only(left: 10.w),
              child: Text(
                "${controller.product.description}",
                style: TextStyle(fontSize: 11.sp, color: AppColor.customBlue),
              ),
            ),
            SizedBox(height: 4.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "  Ingredientes",
                  style: TextStyle(fontSize: 15.sp, color: AppColor.customBlue),
                ),
                Container(
                  padding: EdgeInsets.only(right: 3.w),
                  child: Text(
                    "${controller.product.related.length} ingredientes",
                    style:
                        TextStyle(fontSize: 11.sp, color: AppColor.customBlue),
                  ),
                ),
              ],
            ),
            SizedBox(height: 2.h),
            Container(
              margin: EdgeInsets.only(left: 3.w),
              width: 100.w,
              height: 17.h,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: controller.product.related.length,
                itemBuilder: (BuildContext context, int index) {
                  var related = controller.product.related[index];
                  return Container(
                    width: 27.w,
                    margin: const EdgeInsets.only(left: 5, right: 5),
                    child: Column(
                      children: [
                        Container(
                          width: 30.w,
                          height: 13.h,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("${related['image']}"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 0.5.h),
                        Text(
                          "${related['label']}",
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontSize: 9.sp,
                              color: AppColor.customGrey),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 5.h),
            SizedBox(
              width: 100.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 60.w,
                    height: 8.h,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      gradient: LinearGradient(colors: [
                        AppColor.primaryColor,
                        AppColor.secondColor
                      ]),
                    ),
                    child: Center(
                      child: Text(
                        "Ordenar ahora",
                        style: TextStyle(fontSize: 13.sp, color: Colors.white),
                      ),
                    ),
                  ),
                  Text(
                    "\$ ${controller.product.price}",
                    style:
                        TextStyle(fontSize: 17.sp, color: AppColor.customBlue),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
