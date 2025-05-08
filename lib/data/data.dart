import 'package:alexapps/core/constants/colors.dart';
import 'package:alexapps/core/constants/images.dart';
import 'package:alexapps/model/cart_products.dart';
import 'package:alexapps/model/categories_model.dart';
import 'package:alexapps/model/product_model.dart';
import 'package:alexapps/model/recommended_products.dart';

class Data {
  List<CategoriesModel> categories = [
    CategoriesModel(
        color: AppColor.color1, image: AppImages().tacos, label: "Tacos"),
    CategoriesModel(
        color: AppColor.color2, image: AppImages().frias, label: "Frias"),
    CategoriesModel(
        color: AppColor.color3, image: AppImages().burger, label: "Burger"),
    CategoriesModel(
        color: AppColor.color4, image: AppImages().pizza, label: "Pizza"),
    CategoriesModel(
        color: AppColor.color5, image: AppImages().burritos, label: "Burritos")
  ];

/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////

  List<ProductModel> products = [
    ProductModel(
        favorite: false,
        image: AppImages().pizza2,
        label: "Pizza Clásica",
        description: "Salsa clásica de la casa",
        price: "12.58",
        related: [
          {
            "label": "Arrachera",
            "image": AppImages().burger5,
          },
          {
            "label": "Pan ajonjoli",
            "image": AppImages().bread,
          },
          {
            "label": "Lechuga",
            "image": AppImages().lechuga,
          },
          {
            "label": "Cebolla",
            "image": AppImages().onions,
          }
        ]),
    ////////////////////////////////////////
    ProductModel(
        favorite: true,
        image: AppImages().burger6,
        label: "Hamburguesa mix",
        description: "Doble carne con queso",
        price: "12.58",
        related: [
          {
            "label": "Arrachera",
            "image": AppImages().burger5,
          },
          {
            "label": "Pan ajonjoli",
            "image": AppImages().bread,
          },
          {
            "label": "Lechuga",
            "image": AppImages().lechuga,
          },
          {
            "label": "Cebolla",
            "image": AppImages().onions,
          }
        ]),
    ProductModel(
        favorite: true,
        image: AppImages().burger4,
        label: "special Hamburger",
        description: "Doble carne con queso",
        price: "12.58",
        related: [
          {
            "label": "Arrachera",
            "image": AppImages().burger5,
          },
          {
            "label": "Pan ajonjoli",
            "image": AppImages().bread,
          },
          {
            "label": "Lechuga",
            "image": AppImages().lechuga,
          },
          {
            "label": "Cebolla",
            "image": AppImages().onions,
          }
        ]),
    //////////////////////////////////////////////////
  ];
/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
  List<RecommendedProducts> recommendedProducts = [
    RecommendedProducts(
        favorite: true,
        image: AppImages().juice2,
        label: "Malteadas tropicales",
        description: "Elaborado con jugos naturales",
        price: "12.58",
        related: [
          {
            "label": "Malteadas tropicales",
            "image": AppImages().juice1,
          },
        ],
        type: "Naturales"),
    ///////////////////////////////////////////////////
    RecommendedProducts(
        favorite: true,
        image: AppImages().juice1,
        label: "Malteadas tropical2",
        description: "Salsa clásica de la casa",
        price: "20.58",
        related: [
          {
            "label": "Malteadas tropicales",
            "image": AppImages().juice2,
          },
        ],
        type: "Naturales"),
  ];

  /////////////////////////////////////////
  /////////////////////////////////////////
  /////////////////////////////////////////
  List<CartProducts> cartProducts = [
    CartProducts(
        image: AppImages().burger2,
        label: "Big Burger Queso",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi, atque eaque eius ",
        price: "20"),
    CartProducts(
        image: AppImages().burger3,
        label: "Big Burger Queso",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi, atque eaque eius esse et ",
        price: "20")
  ];
}
