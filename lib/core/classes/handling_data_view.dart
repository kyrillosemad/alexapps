// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
// import 'package:test/core/constants/colors.dart';
// import 'package:test/core/constants/images.dart';
// import 'package:test/view%20model/home_page_state.dart';

// class HandlingDataView extends StatelessWidget {
//   final AppState state;
//   final Widget widget;

//   const HandlingDataView({
//     super.key,
//     required this.state,
//     required this.widget,
//   });

//   @override
//   Widget build(BuildContext context) {
//     if (state is InternetError) {
//       return Center(
//         child: Lottie.asset(AppImages().basket, height: 250),
//       );
//     } else if (state is ServerError) {
//       return Center(
//         child: Lottie.asset(AppImages().basket, height: 300),
//       );
//     } else if (state is Loading) {
//       return const Center(
//         child: Center(
//           child: CircularProgressIndicator(
//               color: Colors.white,
//               backgroundColor: AppColor.primaryColor,
//               strokeWidth: 5),
//         ),
//       );
//     } else if (state is Success) {
//       return widget;
//     }
//     else {
//       return Container();
//     }
//   }
// }
