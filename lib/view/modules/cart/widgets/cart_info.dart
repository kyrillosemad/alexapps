import 'package:alexapps/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
class CartInfo extends StatelessWidget {
  const CartInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 85.w,
      height: 13.h,
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 235, 235, 235),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "SubTotal:",
                style: TextStyle(fontSize: 10.sp, color: AppColor.customBlue),
              ),
              Text(
                "\$ 85.00 usd",
                style: TextStyle(fontSize: 10.sp, color: AppColor.customBlue),
              )
            ],
          ),
          SizedBox(height: 1.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Envio:",
                style: TextStyle(fontSize: 10.sp, color: AppColor.customBlue),
              ),
              Text(
                "Gratis",
                style: TextStyle(fontSize: 10.sp, color: AppColor.customBlue),
              )
            ],
          ),
          SizedBox(height: 1.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Total:",
                style: TextStyle(fontSize: 15.sp, color: AppColor.customBlue),
              ),
              Text(
                "\$ 85.00 usd",
                style: TextStyle(fontSize: 15.sp, color: AppColor.customBlue),
              )
            ],
          ),
        ],
      ),
    );
  }
}
