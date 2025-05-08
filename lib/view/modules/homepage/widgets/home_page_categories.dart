import 'package:alexapps/core/constants/colors.dart';
import 'package:alexapps/data/data.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


class HomePageCategories extends StatelessWidget {
  const HomePageCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 12.h,
      padding: const EdgeInsets.only(left: 10),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: Data().categories.length,
        itemBuilder: (BuildContext context, int index) {
          var element = Data().categories[index];
          return Container(
            margin: const EdgeInsets.only(left: 3, right: 3, top: 2, bottom: 2),
            padding: const EdgeInsets.only(left: 1, right: 1),
            width: 22.w,
            height: 7.h,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  width: 20.w,
                  height: 8.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: element.color,
                  ),
                  child: Image.asset(element.image),
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                Text(
                  element.label,
                  style: TextStyle(fontSize: 12.sp, color: AppColor.customBlue),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
