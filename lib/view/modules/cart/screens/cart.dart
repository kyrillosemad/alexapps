import 'package:alexapps/core/constants/colors.dart';
import 'package:alexapps/data/data.dart';
import 'package:alexapps/view%20model/cart/cart_cubit.dart';
import 'package:alexapps/view/modules/product/widgets/address_container.dart';
import 'package:alexapps/view/modules/cart/widgets/cart_custom_button.dart';
import 'package:alexapps/view/modules/cart/widgets/cart_info.dart';
import 'package:alexapps/view/modules/cart/widgets/cart_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';


class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CartCubit(),
        child: Builder(
          builder: (context) {
            var controller = context.read<CartCubit>();
            int previousTotal1 = int.parse(Data().cartProducts[0].price);
            int previousTotal2 = int.parse(Data().cartProducts[1].price);
            return SafeArea(
                child: Scaffold(
                    appBar: AppBar(
                      toolbarHeight: 10.h,
                      backgroundColor: Colors.white,
                      shadowColor: AppColor.customGrey.withOpacity(0.3),
                      elevation: 5,
                      centerTitle: true,
                      title: Text(
                        "Carrito",
                        style: TextStyle(
                            fontSize: 18.sp, color: AppColor.primaryColor),
                      ),
                    ),
                    body: Center(
                      child: SizedBox(
                        width: 100.w,
                        height: 100.h,
                        child: Column(
                          children: [
                            SizedBox(height: 2.h),
                            Container(
                              margin: const EdgeInsets.only(left: 5),
                              width: 100.w,
                              height: 10.h,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 85.w,
                                    child: ListView.builder(
                                      physics: const BouncingScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      itemCount: 2,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return GestureDetector(
                                          onTap: () {
                                            context
                                                .read<CartCubit>()
                                                .changeAddressIndex(index);
                                          },
                                          child: AddressContainer(
                                            isSelected: context
                                                    .watch<CartCubit>()
                                                    .selectedAddressIndex ==
                                                index,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  const CircleAvatar(
                                    backgroundColor: AppColor.primaryColor,
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 2.h),
                            CartProducts(
                                controller: controller,
                                previousTotal1: previousTotal1,
                                previousTotal2: previousTotal2),
                            SizedBox(height: 4.h),
                            const CartInfo(),
                            const CartCustomButton(),
                          ],
                        ),
                      ),
                    )));
          },
        ));
  }
}
