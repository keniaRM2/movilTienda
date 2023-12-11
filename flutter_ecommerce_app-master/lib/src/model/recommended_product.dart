import 'package:e_commerce_flutter/core/app_color.dart';
import 'package:flutter/material.dart' show Color, Colors; // Importa la clase Text

class RecommendedProduct {
  Color? cardBackgroundColor;
  Color? buttonTextColor;
  Color? buttonBackgroundColor;
  String? textCard; 

  RecommendedProduct({
    this.cardBackgroundColor,
    this.buttonTextColor = AppColor.darkPurple,
    this.buttonBackgroundColor = Colors.white,
   required this.textCard, 
  });
}
