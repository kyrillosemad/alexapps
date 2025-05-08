import 'package:alexapps/core/constants/routes_name.dart';
import 'package:alexapps/model/product_model.dart';
import 'package:alexapps/model/recommended_products.dart';
import 'package:alexapps/view%20model/home_page/home_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';


class SearchDataDelegate extends SearchDelegate<String> {
  final List<ProductModel> products;
  final List<RecommendedProducts> recommendedProducts;

  SearchDataDelegate(
      {required this.products, required this.recommendedProducts});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<ProductModel> filteredProducts = products
        .where((product) =>
            product.label.toLowerCase().contains(query.toLowerCase()))
        .toList();
    final List<RecommendedProducts> filteredRecommendedProducts =
        recommendedProducts
            .where((recommendedProduct) => recommendedProduct.label
                .toLowerCase()
                .contains(query.toLowerCase()))
            .toList();
    final List<dynamic> filteredData = [
      ...filteredProducts,
      ...filteredRecommendedProducts
    ];

    if (filteredData.isEmpty) {
      return Center(
        child: Text(
          'No products found.',
          style: TextStyle(fontSize: 16.sp, color: Colors.grey),
        ),
      );
    }

    return ListView.builder(
      itemCount: filteredData.length,
      itemBuilder: (context, index) {
        final item = filteredData[index];
        return InkWell(
          onTap: () {
            Get.toNamed(AppRoutes().productDetails, arguments: {
              "product": item,
              'homeCubit': context.read<HomePageCubit>()
            });
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  offset: const Offset(0, 4),
                  blurRadius: 6,
                ),
              ],
            ),
            padding: EdgeInsets.all(2.w),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(item.image, width: 20.w, height: 10.h),
                ),
                SizedBox(width: 3.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.label,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 0.5.h),
                      Text(
                        item.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 1.h),
                      Text(
                        '\$${item.price}', // Displaying price
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<ProductModel> suggestedProducts = products
        .where((product) =>
            product.label.toLowerCase().contains(query.toLowerCase()))
        .toList();
    final List<RecommendedProducts> suggestedRecommendedProducts =
        recommendedProducts
            .where((recommendedProduct) => recommendedProduct.label
                .toLowerCase()
                .contains(query.toLowerCase()))
            .toList();

    final List<dynamic> suggestedData = [
      ...suggestedProducts,
      ...suggestedRecommendedProducts
    ];

    if (suggestedData.isEmpty) {
      return Center(
        child: Text(
          'No suggestions found.',
          style: TextStyle(fontSize: 16.sp, color: Colors.grey),
        ),
      );
    }

    return ListView.builder(
      itemCount: suggestedData.length,
      itemBuilder: (context, index) {
        final item = suggestedData[index];
        return InkWell(
          onTap: () {
            query = item.label;
            showResults(context);
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  offset: const Offset(0, 4),
                  blurRadius: 6,
                ),
              ],
            ),
            padding: EdgeInsets.all(2.w),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(item.image, width: 20.w, height: 10.h),
                ),
                SizedBox(width: 3.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.label,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 0.5.h),
                      Text(
                        item.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 1.h),
                      Text(
                        '\$${item.price}', // Displaying price
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
