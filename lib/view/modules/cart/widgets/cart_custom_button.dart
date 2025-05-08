import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/constants/colors.dart';

class CartCustomButton extends StatelessWidget {
  const CartCustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: const LinearGradient(
              colors: [AppColor.primaryColor, AppColor.secondColor]),
          borderRadius: BorderRadius.circular(15)),
      width: 87.w,
      height: 7.h,
      child: Center(
        child: Text(
          "Realizar compra",
          style: TextStyle(fontSize: 15.sp, color: Colors.white),
        ),
      ),
    );
  }
}
