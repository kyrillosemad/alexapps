import 'package:alexapps/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Text(
          "Profile",
          style: TextStyle(
              fontSize: 20.sp,
              color: AppColor.primaryColor,
              fontWeight: FontWeight.w800),
        ),
      ),
    ));
  }
}
