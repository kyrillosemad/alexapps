import 'package:alexapps/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Text(
          "Favorite",
          style: TextStyle(
              fontSize: 20.sp,
              color: AppColor.primaryColor,
              fontWeight: FontWeight.w800),
        ),
      ),
    ));
  }
}
