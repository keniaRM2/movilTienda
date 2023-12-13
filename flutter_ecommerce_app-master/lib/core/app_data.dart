import 'package:e_commerce_flutter/core/main_constants.dart';
import 'package:e_commerce_flutter/src/model/bottom_navy_bar_item.dart';
import 'package:e_commerce_flutter/src/model/principal_categories.dart';
import 'package:e_commerce_flutter/src/model/recommended_product.dart';
import 'package:e_commerce_flutter/src/model/product_category.dart';
import 'package:e_commerce_flutter/src/model/product.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_flutter/src/view/screen/cart_screen.dart';
import 'package:e_commerce_flutter/src/view/screen/login_screen.dart';
import 'package:e_commerce_flutter/src/view/screen/profile_screen.dart';
import 'package:e_commerce_flutter/src/view/screen/categories_screen.dart';
import 'package:e_commerce_flutter/src/view/screen/product_list_screen.dart';
class AppData {
  const AppData._();

    
///Iconos de Categorias principales
  static List<ProductCategory> categories = [
    ProductCategory(
      ProductType.all,
      true,
      Icons.all_inclusive,
    )
  ];

  static const List<Widget> screens = [
    ProductListScreen(),
    CategoriesScreen(),
    CartScreen(),
    ProfileScreen(),
    LoginScreen()
  ];

  static List<Color> randomColors = [
    const Color(0xFFFCE4EC),
    const Color(0xFFF3E5F5),
    const Color(0xFFEDE7F6),
    const Color(0xFFE3F2FD),
    const Color(0xFFE0F2F1),
    const Color(0xFFF1F8E9),
    const Color(0xFFFFF8E1),
    const Color(0xFFECEFF1),
  ];
// iconos de navegador
  static List<BottomNavyBarItem> bottomNavyBarItems = [
    BottomNavyBarItem(
      MainConstants.home,
      const Icon(Icons.home),
      const Color(0xFF9C27B0),
      Colors.grey,
      true,
      const ProductListScreen(),
    ),
    BottomNavyBarItem(
      MainConstants.categories,
      const Icon(Icons.auto_awesome_mosaic_sharp),
      const Color(0xFF9C27B0),
      Colors.grey,
      true,
      const CategoriesScreen()

    ),
    BottomNavyBarItem(
      MainConstants.car,
      const Icon(Icons.shopping_cart),
      const Color(0xFF9C27B0),
      Colors.grey,
      false,
      const  CartScreen()

    ),
    BottomNavyBarItem(
      MainConstants.profile,
      const Icon(Icons.person),
      const Color(0xFF9C27B0),
      Colors.grey,
      false,
       const ProfileScreen(),
    ),
    BottomNavyBarItem(
      MainConstants.login,
      const Icon(Icons.login),
      const Color(0xFF9C27B0),
      Colors.grey,
      true,
      const LoginScreen()
    ),
  ];

 static List<RecommendedProduct> recommendedProducts = [
    RecommendedProduct(
      textCard: 'ENVÍO GRATIS \n A TODO MÉXICO',
      cardBackgroundColor: const Color(0xFFCE93D8),
    ),
    RecommendedProduct(
      textCard: 'DEVOLUCIONES \n GRATIS',
      cardBackgroundColor: const Color(0xFFF9A825),
      buttonBackgroundColor: const Color(0xFF9C46FF),
      buttonTextColor: Colors.white,
    ),
    RecommendedProduct(
      textCard: 'PAGOS \n SEGUROS',
      cardBackgroundColor: const Color(0xFFCE93D8),
    ),
  ];


   static List<PrincipalCategories> principalCategories = [
    PrincipalCategories(
      imageCategories: 'assets/images/baby.png',
      titleCategories: 'Bebé',
      onPressed:(){
        

      },
    ),
      PrincipalCategories(
      imageCategories: 'assets/images/girl.png',
      titleCategories: 'Niña',
      onPressed:(){

      },
      
    ),
       PrincipalCategories(
      imageCategories: 'assets/images/boy.png',
      titleCategories: 'Niño',
      onPressed:(){

      },
      
    ),
       PrincipalCategories(
      imageCategories: 'assets/images/women.png',
      titleCategories: 'Mujer',
      onPressed:(){

      },
      
    ),
       PrincipalCategories(
      imageCategories: 'assets/images/men.png',
      titleCategories: 'Hombre',
      onPressed:(){

      },
      
    ),
     PrincipalCategories(
      imageCategories: 'assets/images/pet.png',
      titleCategories: 'Mascota',
      onPressed:(){

      },
      
    ),
    
  ];

}
