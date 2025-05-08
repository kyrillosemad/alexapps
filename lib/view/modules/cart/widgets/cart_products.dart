// ignore_for_file: must_be_immutable

import 'package:alexapps/core/constants/colors.dart';
import 'package:alexapps/data/data.dart';
import 'package:alexapps/view%20model/cart/cart_cubit.dart';
import 'package:alexapps/view%20model/home_page_state.dart';
import 'package:animated_switcher_plus/animated_switcher_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class CartProducts extends StatelessWidget {
  final CartCubit controller;
  int previousTotal1;
  int previousTotal2;
  CartProducts(
      {super.key,
      required this.controller,
      required this.previousTotal1,
      required this.previousTotal2});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      width: 100.w,
      height: 33.h,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: Data().cartProducts.length,
        itemBuilder: (BuildContext context, int index) {
          var cartProduct = Data().cartProducts[index];
          return Container(
            width: 60.w,
            margin: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.all(10.sp),
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: AppColor.customGrey.withOpacity(0.3),
                      blurRadius: 4,
                      blurStyle: BlurStyle.outer,
                      offset: const Offset(0, 0),
                    ),
                  ], borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 2.h),
                      SizedBox(
                          width: 60.w,
                          height: 11.h,
                          child: Image.asset(cartProduct.image)),
                      SizedBox(height: 1.h),
                      Text(
                        cartProduct.label,
                        style: TextStyle(
                            fontSize: 13.sp, color: AppColor.customBlue),
                      ),
                      SizedBox(height: 0.5.h),
                      Text(
                        cartProduct.description,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 8.sp, color: AppColor.customGrey),
                      ),
                      SizedBox(height: 2.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  index == 0
                                      ? controller.add1()
                                      : controller.add2();
                                },
                                child: Container(
                                    width: 7.w,
                                    height: 3.h,
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 229, 229, 229),
                                        borderRadius: BorderRadius.circular(8)),
                                    child: const Icon(
                                      Icons.add,
                                      color: AppColor.primaryColor,
                                    )),
                              ),
                              SizedBox(width: 2.w),
                              BlocBuilder<CartCubit, AppState>(
                                builder: (context, state) {
                                  final amount = index == 0
                                      ? controller.amount1
                                      : controller.amount2;
                                  return AnimatedSwitcherFlip.flipX(
                                    duration: const Duration(milliseconds: 300),
                                    child: Text(
                                      "$amount",
                                      key: ValueKey<int>(amount),
                                      style: TextStyle(
                                        fontSize: 13.sp,
                                        color: AppColor.primaryColor,
                                      ),
                                    ),
                                  );
                                },
                              ),
                              SizedBox(width: 2.w),
                              InkWell(
                                onTap: () {
                                  index == 0
                                      ? controller.remove1()
                                      : controller.remove2();
                                },
                                child: Container(
                                    width: 7.w,
                                    height: 3.h,
                                    decoration: BoxDecoration(
                                        color: AppColor.primaryColor,
                                        borderRadius: BorderRadius.circular(8)),
                                    child: const Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                    )),
                              ),
                            ],
                          ),
                          BlocBuilder<CartCubit, AppState>(
                            builder: (context, state) {
                              final amount = index == 0
                                  ? controller.amount1
                                  : controller.amount2;
                              final price = int.parse(cartProduct.price);
                              final total = amount * price;

                              final isIncreased = (index == 0
                                  ? total > previousTotal1
                                  : total > previousTotal2);

                              if (index == 0) {
                                previousTotal1 = total;
                              } else {
                                previousTotal2 = total;
                              }

                              return isIncreased
                                  ? AnimatedSwitcherTranslation.bottom(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      child: Text(
                                        "\$ $total",
                                        key: ValueKey<int>(total),
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          color: AppColor.secondColor,
                                        ),
                                      ),
                                    )
                                  : AnimatedSwitcherTranslation.top(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      child: Text(
                                        "\$ $total",
                                        key: ValueKey<int>(total),
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          color: AppColor.secondColor,
                                        ),
                                      ),
                                    );
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const Positioned(
                    right: 0,
                    child: InkWell(
                      child: CircleAvatar(
                        backgroundColor: AppColor.customRed,
                        child: Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                    )),
              ],
            ),
          );
        },
      ),
    );
  }
}
