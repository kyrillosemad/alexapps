import 'package:alexapps/core/constants/routes_name.dart';
import 'package:alexapps/view/modules/main/screens/bottom_nav.dart';
import 'package:alexapps/view/modules/cart/screens/cart.dart';
import 'package:alexapps/view/modules/main/screens/favorite.dart';
import 'package:alexapps/view/modules/homepage/screens/home_page.dart';
import 'package:alexapps/view/modules/product/screens/product_details.dart';
import 'package:alexapps/view/modules/main/screens/profile.dart';
import 'package:alexapps/view/modules/main/screens/shop.dart';
import 'package:flutter/material.dart';


Map<String, Widget Function(BuildContext)> routes = {
  AppRoutes().bottomNav: (context) => const BottomNav(),
  AppRoutes().homePage: (context) => const HomePage(),
  AppRoutes().cart: (context) => const Cart(),
  AppRoutes().favorite: (context) => const Favorite(),
  AppRoutes().profile: (context) => const Profile(),
  AppRoutes().market: (context) => const Shop(),
  AppRoutes().productDetails: (context) => const ProductDetails(),
};
