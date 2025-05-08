import 'package:alexapps/core/constants/colors.dart';
import 'package:alexapps/core/constants/images.dart';
import 'package:alexapps/core/constants/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';


class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: 100.w,
        height: 100.h,
        child: Column(
          children: [
            SizedBox(
              height: 25.h,
            ),
            SizedBox(
              width: 80.w,
              height: 30.h,
              child: Image.asset(
                AppImages().logo,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              "Restaurant App",
              style: TextStyle(fontSize: 20.sp, color: Colors.black),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              "explore and order your favorite food",
              style: TextStyle(fontSize: 12.sp, color: Colors.grey),
            ),
            SizedBox(
              height: 10.h,
            ),
            InkWell(
              onTap: () {
                Get.offAllNamed(AppRoutes().bottomNav);
              },
              child: Container(
                width: 80.w,
                height: 7.h,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [AppColor.primaryColor, AppColor.secondColor]),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    )),
                child: Center(
                  child: Text(
                    "GO",
                    style: TextStyle(fontSize: 15.sp, color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
