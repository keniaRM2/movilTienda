import 'package:e_commerce_flutter/core/app_color.dart';
import 'package:e_commerce_flutter/core/app_data.dart';
import 'package:e_commerce_flutter/src/view/screen/product_filter_screen.dart';
import 'package:flutter/material.dart';

class UploadImageScreen extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const UploadImageScreen({Key? key});

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      title: Text(
        "SubCategorias",
        style: Theme.of(context).textTheme.displayLarge,
      ),
    );
  }
  
  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: _appBar(context),
    body: GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: AppData.principalCategories.length,
      itemBuilder: (BuildContext ctx, int index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProductFilterScreen(), // Reemplaza 'PantallaDestino()' con el nombre de tu pantalla de destino
              ),
            );
          },
          child: Card(
            elevation: 3,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  AppData.principalCategories[index].imageCategories!,
                  fit: BoxFit.cover,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                    child: Container(
                      color: AppColor.darkYellow,
                      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                      child: Text(
                        AppData.principalCategories[index].titleCategories!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25, // Cambia el tamaño del texto aquí
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}

}


