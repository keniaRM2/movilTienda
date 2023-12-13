import 'package:e_commerce_flutter/src/view/screen/cart_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_flutter/core/app_color.dart';
import 'package:e_commerce_flutter/src/model/product.dart';
import 'package:e_commerce_flutter/src/view/widget/page_wrapper.dart';
import 'package:e_commerce_flutter/src/view/widget/carousel_slider.dart';
import 'package:e_commerce_flutter/src/controller/product_controller.dart';

final ProductController controller = Get.put(ProductController());

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen(this.product, {super.key});

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back, color: Colors.black),
      ),
    );
  }

  Widget productPageView(double width, double height) {
    return Container(
      height: height * 0.42,
      width: width,
      decoration: const BoxDecoration(
        color: AppColor.lightYellow,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(80),
          bottomLeft: Radius.circular(80),
        ),
      ),
      child: CarouselSlider(items: product.images),
    );
  }

  Widget _ratingBar(BuildContext context, Product product) {
    return Wrap(
      spacing: 30,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(
          '${product.existence} disponibles',
          style: Theme.of(context)
              .textTheme
              .displaySmall
              ?.copyWith(fontWeight: FontWeight.w300),
        )
      ],
    );
  }

  Widget _showColor(String hexColor) {
    Color color;
    if (hexColor.isNotEmpty) {
      color = Color(int.parse(hexColor.replaceAll('#', '0xFF')));
    } else {
      // Color por defecto si el valor es nulo o vacío
      color = Colors.grey; // Puedes cambiar este color por el que desees
    }

    return Container(
      width: 20, // Ancho del contenedor del color
      height: 20, // Alto del contenedor del color
      decoration: BoxDecoration(
        color: color, // Color del contenedor
        borderRadius:
            BorderRadius.circular(8.0), // Opcional: bordes redondeados
      ),
    );
  }

  Widget _detailsBar(BuildContext context, Product product) {
    return Wrap(
      spacing: 0,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 25.0),
          child: Spacer(),
        ),
        const SizedBox(height: 30),
        Text(
          "Talla",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 10),
        Text(" ${product.sizeName ?? 'Unitalla'}"),
        const Padding(
          padding: EdgeInsets.only(right: 25.0),
          child: Spacer(),
        ),
        const SizedBox(height: 30),
        Text(
          "Color ",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 10),
        _showColor(product.color ?? '')
      ],
    );
  }

  Widget productSizesListView() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: controller.sizeType(product).length,
      itemBuilder: (_, index) {
        return InkWell(
          onTap: () => controller.switchBetweenProductSizes(product, index),
          child: AnimatedContainer(
            margin: const EdgeInsets.only(right: 5, left: 5),
            alignment: Alignment.center,
            width: controller.isNominal(product) ? 40 : 70,
            decoration: BoxDecoration(
              color: controller.sizeType(product)[index].isSelected == false
                  ? Colors.white
                  : AppColor.lightPurple,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey, width: 0.4),
            ),
            duration: const Duration(milliseconds: 300),
            child: FittedBox(
              child: Text(
                controller.sizeType(product)[index].numerical,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: _appBar(context),
        body: SingleChildScrollView(
          child: PageWrapper(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                productPageView(width, height),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      const SizedBox(height: 10),
                      _ratingBar(context, product),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            product.off != null
                                ? "\$${product.off}"
                                : "\$${product.price}",
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                          const SizedBox(width: 3),
                          Visibility(
                            visible: product.off != null ? true : false,
                            child: Text(
                              "\$${product.price}",
                              style: const TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const Spacer(),
                          Text(
                            product.isAvailable
                                ? "Disponible en stock"
                                : "Agotado",
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      const SizedBox(height: 30),
                      Text(
                        "Descripción",
                        style: Theme.of(context).textTheme.headlineMedium,
                        
                      ),
                      const SizedBox(height: 10),
                      Text(product.about),
                      _detailsBar(context, product),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: product.isAvailable
                              ? () {
                                  try {
                                    
                                    controller.addToCart(product);
                                    
                                    myToast.showToastSuccess(context, "¡Producto agregado!");
                                    
                                    Navigator.pop(context);
                                  } catch (e) {
                                    myToast.showToastError( context,e.toString());
                                  }
                                }
                              : null,
                          child: const Text("Agregar al carrito"),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
