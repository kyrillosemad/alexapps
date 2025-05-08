import 'package:alexapps/core/constants/colors.dart';
import 'package:alexapps/core/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


class AddressContainer extends StatelessWidget {
  final bool isSelected;

  const AddressContainer({super.key, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 2),
          width: 40.w,
          height: 6.5.h,
          decoration: BoxDecoration(
            color: isSelected ? AppColor.primaryColor : Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              SizedBox(width: 5.w),
              Icon(
                AppIcons.home,
                color: isSelected ? Colors.white : AppColor.primaryColor,
              ),
              SizedBox(width: 3.w),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Mi casa",
                    style: TextStyle(
                      fontSize: 8.sp,
                      color: isSelected ? Colors.white : AppColor.primaryColor,
                    ),
                  ),
                  Text(
                    "Direción de ejemplo",
                    style: TextStyle(
                      fontSize: 6.sp,
                      color: isSelected ? Colors.white : AppColor.primaryColor,
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
