import 'package:alexapps/core/constants/colors.dart';
import 'package:alexapps/data/data.dart';
import 'package:alexapps/view%20model/home_page/home_page_cubit.dart';
import 'package:alexapps/view%20model/home_page_state.dart';
import 'package:alexapps/view/modules/homepage/widgets/homepage_heart_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class HomePageProducts extends StatelessWidget {
  final HomePageCubit controller;
  const HomePageProducts({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
      height: 28.h,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: Data().products.length,
        itemBuilder: (BuildContext context, int index) {
          var product = Data().products[index];
          return InkWell(
            onTap: () {
              controller.goToProductDetails(
                  controller.products[index], context);
            },
            child: Container(
              width: 45.w,
              height: 30.h,
              margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: AppColor.customGrey.withOpacity(0.3),
                    blurRadius: 4,
                    blurStyle: BlurStyle.outer,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BlocBuilder<HomePageCubit, AppState>(
                        builder: (context, state) {
                          return Align(
                            alignment: Alignment.topRight,
                            child: HeartIcon(
                              isFavorite: controller.products[index].favorite,
                              onTap: () {
                                controller.changeFavorite(index);
                              },
                            ),
                          );
                        },
                      ),
                      Center(
                        child: index == 2
                            ? Container(
                                width: 30.w,
                                height: 12.h,
                                decoration: BoxDecoration(
                                  color: AppColor.color2,
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage(product.image),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )
                            : Image.asset(
                                product.image,
                                width: 35.w,
                                height: 12.h,
                                fit: BoxFit.cover,
                              ),
                      ),
                      Text(
                        product.label,
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: AppColor.customGrey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 0.5.h),
                      Text(
                        product.description,
                        style: TextStyle(
                          fontSize: 8.sp,
                          color: AppColor.customGrey,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 1.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "\$ ${product.price}",
                            style: TextStyle(
                              fontSize: 9.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColor.customBlue,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: AppColor.customGrey.withOpacity(0.2),
                                  spreadRadius: 4,
                                  blurRadius: 5,
                                ),
                              ],
                            ),
                            child: const CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: AppColor.customBlue,
                                size: 15,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
