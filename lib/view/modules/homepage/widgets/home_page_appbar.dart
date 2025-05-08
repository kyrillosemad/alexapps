import 'package:alexapps/core/constants/colors.dart';
import 'package:alexapps/core/constants/images.dart';
import 'package:alexapps/data/data.dart';
import 'package:alexapps/view/widgets/search_delegate.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


class HomePageAppbar extends StatelessWidget {
  const HomePageAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 12.h,
      padding: EdgeInsets.symmetric(horizontal: 3.w),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColor.customGrey.withOpacity(0.2),
            offset: const Offset(0, 2),
            blurRadius: 8,
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              // عند الضغط، يتم تنفيذ الفانكشن وتنقلك إلى الـ SearchDelegate
              print("Navigating to search delegate...");
              showSearch(
                context: context,
                delegate: SearchDataDelegate(
                  products: Data().products,
                  recommendedProducts: Data().recommendedProducts,
                ),
              );
            },
            child: Container(
              width: 30.w,
              height: 4.5.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: const Color(0xffE2EDF2),
                  width: 2,
                ),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 2.w,
                  ),
                  const Icon(
                    Icons.search,
                    size: 18,
                    color: AppColor.primaryColor,
                  ),
                  SizedBox(width: 2.w),
                  Text(
                    "Buscar",
                    style:
                        TextStyle(fontSize: 9.sp, color: AppColor.customGrey),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "Inicio",
                style: TextStyle(
                  fontSize: 20.sp,
                  color: AppColor.primaryColor,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 30.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Icon(
                  AppIcons.notification,
                  color: AppColor.secondColor,
                ),
                SizedBox(width: 3.w),
                const Icon(
                  AppIcons.percent,
                  color: AppColor.customRed,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
