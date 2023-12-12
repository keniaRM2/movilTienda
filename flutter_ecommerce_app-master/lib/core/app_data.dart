import 'package:e_commerce_flutter/src/model/bottom_navy_bar_item.dart';
import 'package:e_commerce_flutter/src/model/principal_categories.dart';
import 'package:e_commerce_flutter/src/model/recommended_product.dart';
import 'package:e_commerce_flutter/src/model/product_size_type.dart';
import 'package:e_commerce_flutter/src/model/product_category.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:e_commerce_flutter/src/model/categorical.dart';
import 'package:e_commerce_flutter/src/model/numerical.dart';
import 'package:e_commerce_flutter/src/model/product.dart';
import 'package:flutter/material.dart';

class AppData {
  const AppData._();

  static String dummyText =
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      ' industry. Lorem Ipsum has been the industry\'s standard dummy text'
      ' ever since the 1500s, when an unknown printer took a galley of type'
      ' and scrambled it to make a type specimen book.';

  static List<Product> products = [
    Product(
      name: 'Samsung Galaxy A53 5G',
      price: 460,
      about: dummyText,
      isAvailable: true,
      off: 300,
      quantity: 0,
      images: [
        'assets/images/a53_1.png',
        'assets/images/a53_2.png',
        'assets/images/a53_3.png'
      ],
      isFavorite: true,
      rating: 1,
      type: ProductType.mobile,
    ),
    Product(
      name: 'Samsung Galaxy Tab S7 FE',
      price: 380,
      about: dummyText,
      isAvailable: false,
      off: 220,
      quantity: 0,
      images: [
        'assets/images/tab_s7_fe_1.png',
        'assets/images/tab_s7_fe_2.png',
        'assets/images/tab_s7_fe_3.png'
      ],
      isFavorite: false,
      rating: 4,
      type: ProductType.tablet,
    ),
    Product(
      name: 'Samsung Galaxy Tab S8+',
      price: 650,
      about: dummyText,
      isAvailable: true,
      off: null,
      quantity: 0,
      images: [
        'assets/images/tab_s8_1.png',
        'assets/images/tab_s8_2.png',
        'assets/images/tab_s8_3.png',
      ],
      isFavorite: false,
      rating: 3,
      type: ProductType.tablet,
    ),
    Product(
      name: 'Samsung Galaxy Watch 4',
      price: 229,
      about: dummyText,
      isAvailable: true,
      off: 200,
      quantity: 0,
      images: [
        'assets/images/galaxy_watch_4_1.png',
        'assets/images/galaxy_watch_4_2.png',
        'assets/images/galaxy_watch_4_3.png',
      ],
      isFavorite: false,
      rating: 5,
      sizes: ProductSizeType(
        categorical: [
          Categorical(CategoricalType.small, true),
          Categorical(CategoricalType.medium, false),
          Categorical(CategoricalType.large, false),
        ],
      ),
      type: ProductType.watch,
    ),
    Product(
      name: 'Apple Watch 7',
      price: 330,
      about: dummyText,
      isAvailable: true,
      off: null,
      quantity: 0,
      images: [
        'assets/images/apple_watch_series_7_1.png',
        'assets/images/apple_watch_series_7_2.png',
        'assets/images/apple_watch_series_7_3.png',
      ],
      isFavorite: false,
      rating: 4,
      sizes: ProductSizeType(
        numerical: [Numerical('41', true), Numerical('45', false)],
      ),
      type: ProductType.watch,
    ),
    Product(
        name: 'Beats studio 3',
        price: 230,
        about: dummyText,
        isAvailable: true,
        off: null,
        quantity: 0,
        images: [
          'assets/images/beats_studio_3-1.png',
          'assets/images/beats_studio_3-2.png',
          'assets/images/beats_studio_3-3.png',
          'assets/images/beats_studio_3-4.png',
        ],
        isFavorite: false,
        rating: 2,
        type: ProductType.headphone),
    Product(
      name: 'Samsung Q60 A',
      price: 497,
      about: dummyText,
      isAvailable: true,
      off: null,
      quantity: 0,
      images: [
        'assets/images/samsung_q_60_a_1.png',
        'assets/images/samsung_q_60_a_2.png',
      ],
      isFavorite: false,
      rating: 3,
      sizes: ProductSizeType(
        numerical: [
          Numerical('43', true),
          Numerical('50', false),
          Numerical('55', false)
        ],
      ),
      type: ProductType.tv,
    ),
    Product(
      name: 'Sony x 80 J',
      price: 498,
      about: dummyText,
      isAvailable: true,
      off: null,
      quantity: 0,
      images: [
        'assets/images/sony_x_80_j_1.png',
        'assets/images/sony_x_80_j_2.png',
      ],
      isFavorite: false,
      sizes: ProductSizeType(
        numerical: [
          Numerical('50', true),
          Numerical('65', false),
          Numerical('85', false)
        ],
      ),
      rating: 2,
      type: ProductType.tv,
    ),
  ];
///Iconos de Categorias principales
  static List<ProductCategory> categories = [
    ProductCategory(
      ProductType.all,
      true,
      Icons.all_inclusive,
    ),
    ProductCategory(
      ProductType.baby,
      false,
      FontAwesomeIcons.baby, 
    ),
    ProductCategory(
      ProductType.girl,
      false,
      FontAwesomeIcons.childDress, 
    ),
    ProductCategory(
      ProductType.boy,
      false,
      FontAwesomeIcons.child,
    ),
    ProductCategory(
      ProductType.women,
      false,
      FontAwesomeIcons.personDress,
       // Reemplaza con el icono de bebé que prefieras
    ),
    ProductCategory(
      ProductType.men,
      false,
      FontAwesomeIcons.person,
    ),
    // ProductCategory(
    //   ProductType.pet,
    //   false,
    //   FontAwesomeIcons.dog,
    // ),
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
      "Inicio",
      const Icon(Icons.home),
      const Color(0xFF9C27B0),
      Colors.grey,
    ),
    BottomNavyBarItem(
      "Categorias",
      const Icon(Icons.auto_awesome_mosaic_sharp),
      const Color(0xFF9C27B0),
      Colors.grey,
    ),
    BottomNavyBarItem(
      "Carrito",
      const Icon(Icons.shopping_cart),
      const Color(0xFF9C27B0),
      Colors.grey,
    ),
    BottomNavyBarItem(
      "Perfil",
      const Icon(Icons.person),
      const Color(0xFF9C27B0),
      Colors.grey,
    ),
    BottomNavyBarItem(
      "Login",
      const Icon(Icons.login),
      const Color(0xFF9C27B0),
      Colors.grey,
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
