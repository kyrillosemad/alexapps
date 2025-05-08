import 'package:alexapps/core/constants/colors.dart';
import 'package:alexapps/core/constants/images.dart';
import 'package:alexapps/view%20model/bottom_nav/bottom_nav_cubit.dart';
import 'package:alexapps/view%20model/home_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavCubit(),
      child: BlocBuilder<BottomNavCubit, AppState>(
        builder: (context, state) {
          var controller = context.read<BottomNavCubit>();
          return Scaffold(
            backgroundColor: Colors.white,
            body: controller.pages[controller.curIndex],
            bottomNavigationBar: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Container(
                    height: 9.5.h,
                    margin: EdgeInsets.only(bottom: 1.5.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.sp),
                      boxShadow: const [],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.sp),
                      child: BottomAppBar(
                        elevation: 0,
                        color: const Color.fromARGB(255, 244, 244, 244),
                        child: SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                icon: const Icon(AppIcons.home),
                                onPressed: () => controller.changeIndex(0),
                                color: controller.curIndex == 0
                                    ? AppColor.secondColor
                                    : Colors.grey,
                              ),
                              IconButton(
                                icon: const Icon(AppIcons.shop),
                                onPressed: () => controller.changeIndex(1),
                                color: controller.curIndex == 1
                                    ? AppColor.secondColor
                                    : Colors.grey,
                              ),
                              Container(
                                width: 30.w,
                                height: 9.5.h,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26.withOpacity(0.12),
                                      blurRadius: 70,
                                      spreadRadius: 0,
                                      offset: const Offset(0, 1),
                                    ),
                                  ],
                                ),
                                child: ClipPath(
                                  clipper: ContainerClipper2(),
                                  child: Container(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: const Icon(AppIcons.favorite),
                                onPressed: () => controller.changeIndex(3),
                                color: controller.curIndex == 3
                                    ? AppColor.secondColor
                                    : Colors.grey,
                              ),
                              IconButton(
                                icon: CircleAvatar(
                                  radius: 12,
                                  backgroundImage:
                                      AssetImage(AppImages().women),
                                ),
                                onPressed: () => controller.changeIndex(4),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 1.3.h,
                  child: Container(
                    height: 10.h,
                    width: 18.w,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: FloatingActionButton(
                      elevation: 0,
                      onPressed: () => controller.changeIndex(2),
                      backgroundColor: AppColor.primaryColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(AppIcons.basket),
                          SizedBox(
                            width: 1.5.w,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ContainerClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.moveTo(size.width * 0.2, 0);

    path.quadraticBezierTo(
      -15,
      size.height * 0.5,
      size.width * 0.2,
      size.height,
    );

    path.lineTo(size.width * 0.8, size.height);

    path.quadraticBezierTo(
      size.width + 15,
      size.height * 0.5,
      size.width * 0.8,
      0,
    );

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
