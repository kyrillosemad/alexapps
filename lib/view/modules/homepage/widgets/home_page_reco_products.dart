import 'package:alexapps/core/constants/colors.dart';
import 'package:alexapps/data/data.dart';
import 'package:alexapps/view%20model/home_page/home_page_cubit.dart';
import 'package:alexapps/view%20model/home_page_state.dart';
import 'package:alexapps/view/modules/homepage/widgets/homepage_heart_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';


class HomePageRecoProducts extends StatelessWidget {
  final HomePageCubit controller;
  const HomePageRecoProducts({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      width: 100.w,
      height: 18.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: Data().recommendedProducts.length,
        itemBuilder: (BuildContext context, int index) {
          var recoProduct = Data().recommendedProducts[index];
          return InkWell(
            onTap: () {
              controller.goToProductDetails(
                  controller.recoProducts[index], context);
            },
            child: Container(
              margin: const EdgeInsets.only(right: 3, left: 3),
              width: 75.w,
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 15.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: AppColor.customGrey.withOpacity(0.3),
                              blurRadius: 5,
                              blurStyle: BlurStyle.outer,
                              offset: const Offset(0, 0))
                        ]),
                    margin: const EdgeInsets.only(
                        bottom: 15, right: 10, left: 10, top: 5),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 30.w,
                        child: Image.asset(recoProduct.image),
                      ),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            children: [
                              Text(
                                recoProduct.type,
                                style: const TextStyle(
                                    fontSize: 12, color: AppColor.customGrey),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              BlocBuilder<HomePageCubit, AppState>(
                                builder: (context, state) {
                                  return HeartIcon(
                                    isFavorite:
                                        controller.recoProducts[index].favorite,
                                    onTap: () {
                                      controller.changeFavorite2(index);
                                    },
                                  );
                                },
                              )
                            ],
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text(
                            recoProduct.label,
                            style: const TextStyle(
                                fontSize: 13, color: AppColor.customBlue),
                          ),
                          SizedBox(
                            height: 0.3.h,
                          ),
                          Text(
                            recoProduct.description,
                            style: const TextStyle(
                                fontSize: 9, color: AppColor.customGrey),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Container(
                            child: Row(
                              children: [
                                Text("\$ ${recoProduct.price}"),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColor.customGrey
                                            .withOpacity(0.2),
                                        spreadRadius: 4,
                                        blurRadius: 5,
                                        offset: const Offset(0, 0),
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
                            ),
                          ),
                        ],
                      ))
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
