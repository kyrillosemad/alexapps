// import 'package:flutter/material.dart';
// import 'package:flutter_paymob/flutter_paymob.dart';
// import 'package:get/get.dart';
// import 'package:jawla/view%20model/travel_programs/payment_method_cubit.dart';

// //with Package Paymob_flutter
// paymobPayWithWallet(BuildContext context, double amount, String walletNumber,
//     PaymentMethodCubit controller) {
//   try {
//     FlutterPaymob.instance.payWithWallet(
//       context: context,
//       currency: "EGP",
//       amount: amount,
//       number: walletNumber,
//       onPayment: (response) {
//         if (response.responseCode ==
//             '200' /*&& response.success==true في حالة الحساب الحقيقي */) {
//       controller.completePayment();
//         } else {
//           controller.setInitialState();
//           Get.snackbar(
//             "Payment Failed",
//             response.message ?? "Payment failed. Please try again.",
//             backgroundColor: Colors.red.withOpacity(0.6),
//             colorText: Colors.white,
//           );
//         }
//       },
//     );
//   } catch (e) {
//     controller.setInitialState();
//     Get.snackbar(
//       "Error",
//       "An unexpected error occurred. Please try again later.",
//       backgroundColor: Colors.red.withOpacity(0.6),
//       colorText: Colors.white,
//     );
//   }
// }
