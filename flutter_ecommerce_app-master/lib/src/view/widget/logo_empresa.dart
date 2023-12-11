import 'package:flutter/material.dart';

class EmpresaLogoWidget extends StatelessWidget {
  const EmpresaLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100, 
      height: 100, 
      decoration: const BoxDecoration(
       
      ),
      child: Image.asset(
        'assets/images/logo.png', 
        fit: BoxFit.contain, 
      ),
      
    );
  }
}
