import 'package:alexapps/core/constants/colors.dart';
import 'package:alexapps/view%20model/home_page/home_page_cubit.dart';
import 'package:alexapps/view/modules/homepage/widgets/home_page_appbar.dart';
import 'package:alexapps/view/modules/homepage/widgets/home_page_categories.dart';
import 'package:alexapps/view/modules/homepage/widgets/home_page_products.dart';
import 'package:alexapps/view/modules/homepage/widgets/home_page_reco_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        var controller = context.read<HomePageCubit>();
        return SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: SizedBox(
                width: 100.w,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const HomePageAppbar(),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    SizedBox(
                      width: 85.w,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Explorar categorias",
                              style: TextStyle(
                                  fontSize: 13.sp, color: AppColor.customBlue),
                            ),
                            Text(
                              "Ver todos",
                              style: TextStyle(
                                  fontSize: 10.sp, color: AppColor.customGrey),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    const HomePageCategories(),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    Container(
                      width: 100.w,
                      padding: EdgeInsets.symmetric(horizontal: 7.w),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Productos populares",
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: AppColor.customBlue,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    HomePageProducts(controller: controller),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    Container(
                      width: 100.w,
                      padding: EdgeInsets.symmetric(horizontal: 7.w),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Recomendados",
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: AppColor.customBlue,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    HomePageRecoProducts(
                      controller: controller,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
