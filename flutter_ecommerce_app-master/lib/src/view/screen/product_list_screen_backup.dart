import 'package:e_commerce_flutter/src/view/screen/cart_screen.dart';
import 'package:e_commerce_flutter/src/view/screen/categories_screen.dart';
//import 'package:e_commerce_flutter/src/view/widget/categories_grid_view.dart';
import 'package:e_commerce_flutter/src/view/widget/logo_empresa.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_flutter/core/app_data.dart';
import 'package:e_commerce_flutter/core/app_color.dart';
import 'package:e_commerce_flutter/src/controller/product_controller.dart';
import 'package:e_commerce_flutter/src/view/widget/product_grid_view.dart';
import 'package:e_commerce_flutter/src/view/widget/list_item_selector.dart';

enum AppbarActionType { leading, trailing }

final ProductController controller = Get.put(ProductController());

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  PreferredSize _getAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(100),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const EmpresaLogoWidget(),
              _appBarActionButton(AppbarActionType.trailing, context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _appBarActionButton(AppbarActionType type, BuildContext context) {
    IconData icon = Icons.shopping_cart;

    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColor.darkPurple,
      ),
      child: IconButton(
        padding: const EdgeInsets.all(8),
        constraints: const BoxConstraints(),
        onPressed: () {
          // Navegar a la pantalla shopping_cart.dart
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>const CartScreen()),
          );
        },
        icon: Icon(icon, color: AppColor.white),
      ),
    );
  }

  Widget _recommendedProductListView(BuildContext context) {
    return SizedBox(
      height: 170,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 10),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: AppData.recommendedProducts.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Container(
              width: 300,
              decoration: BoxDecoration(
                color: AppData.recommendedProducts[index].cardBackgroundColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppData.recommendedProducts[index].textCard ?? '',
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(color: Colors.white),
                        ),
                        const SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const CategoriesScreen()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppData.recommendedProducts[index]
                                .buttonBackgroundColor,
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(horizontal: 18),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                          child: Text(
                            "Comprar Ahora",
                            style: TextStyle(
                              color: AppData
                                  .recommendedProducts[index].buttonTextColor!,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                  Image.asset(
                    'assets/images/shopping.png',
                    height: 110,
                    fit: BoxFit.cover,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

Widget _topCategoriesHeader(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Categorias",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
        const SizedBox(height: 10), 
      ],
    ),
  );
}


  Widget _topCategoriesListView() {
    return ListItemSelector(
      categories: controller.categories,
      onItemPressed: (index) {
        controller.filterItemsByCategory(index);
      },
    );
  }


   

  @override
Widget build(BuildContext context) {
  controller.getAllItems();
  return Scaffold(
    extendBodyBehindAppBar: true,
    appBar: _getAppBar(context),
    body: SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20), // Apliqué el padding al SingleChildScrollView
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Tejiendo Estilo Con Encanto ",
              style: Theme.of(context).textTheme.displayLarge,
            ),
            Text(
              "Contamos con variedad de diseños",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            _recommendedProductListView(context),
            _topCategoriesHeader(context),
            _topCategoriesListView(),
            const SizedBox(height: 20), // Espacio entre los elementos
            Text(
              "Lo más reciente ",
              style: Theme.of(context).textTheme.displayLarge,
            ),
            GetBuilder(builder: (ProductController controller) {
              return ProductGridView(
                items: controller.filteredProducts,
                likeButtonPressed: (index) => controller.isFavorite(index),
                isPriceOff: (product) => controller.isPriceOff(product),
              );
            }),
          ],
        ),
      ),
    ),
  );
}

}
