import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce_flutter/core/extensions.dart';
import 'package:e_commerce_flutter/src/controller/product_controller.dart';
import 'package:e_commerce_flutter/src/view/animation/animated_switcher_wrapper.dart';
import 'package:e_commerce_flutter/core/app_color.dart';
import 'package:e_commerce_flutter/core/main_constants.dart';
import 'package:e_commerce_flutter/core/my_toast.dart';
import 'package:e_commerce_flutter/src/model/product.dart';
import 'package:e_commerce_flutter/src/view/widget/empty_cart.dart';

final ProductController controller = Get.put(ProductController());
final MyToast myToast = MyToast();

class CartScreen extends StatefulWidget {
  // ignore: use_super_parameters
  const CartScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    _updateScreen();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateScreen();
  }

  void _updateScreen() async {
    controller.loading.value = true;

    await controller.getCartItems();
    
    controller.loading.value = false;
    setState(() {});
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      title: Text(
        "Mi Carrito",
        style: Theme.of(context).textTheme.displayLarge,
      ),
    );
  }

  Widget cartList() {
    return SingleChildScrollView(
      child: Column(
        children: controller.cartProducts.mapWithIndex((index, _) {
          Product product = controller.cartProducts[index];

          Widget imageWidget;
          try {
            String base64String = product.images[0];
            base64String = base64String.split("base64,")[1];
            Uint8List bytes = base64Decode(base64String);

            imageWidget = Image.memory(
              bytes,
              width: 100,
              height: 90,
              fit: BoxFit.cover,
            );
          } catch (e) {
            imageWidget = Image.asset(
              MainConstants.imageDefault,
              width: 100,
              height: 90,
              fit: BoxFit.cover,
            );
          }

          return Container(
            width: double.infinity,
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: AppColor.lightYellow,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorExtension.randomColor,
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: imageWidget,
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      // product.name.nextLine,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      controller.getCurrentSize(product),
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      controller.isPriceOff(product)
                          ? "\$${product.off}"
                          : "\$${product.price}",
                      style: const TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        splashRadius: 10.0,
                        onPressed: () {
                          // if (!controller.loading.value) {
                          //   controller.loading.value = true;

                          controller.decreaseItemQuantity(product);
                          //     .then((value) {
                          //   controller.loading.value = false;
                          //   controller.calculateTotalPrice();
                          //   controller.update();
                          // }).catchError((e) {
                          //   controller.loading.value = false;
                          //   myToast.showToastError(context,e.toString();
                          // });
                          // }
                        },
                        icon: const Icon(
                          Icons.remove,
                          color: AppColor.darkPurple,
                        ),
                      ),
                      GetBuilder<ProductController>(
                        builder: (ProductController controller) {
                          return AnimatedSwitcherWrapper(
                            child: Text(
                              '${controller.cartProducts[index].quantity}',
                              key: ValueKey<int>(
                                controller.cartProducts[index].quantity,
                              ),
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          );
                        },
                      ),
                      IconButton(
                        splashRadius: 10.0,
                        onPressed: () {
                          // if (!controller.loading.value) {
                          //   controller.loading.value = true;

                          controller.increaseItemQuantity(product);
                          //       .then((value) {
                          //     controller.loading.value = false;
                          //     controller.calculateTotalPrice();
                          //     controller.update();
                          //   }).catchError((e) {
                          //     controller.loading.value = false;
                          //     myToast.showToastError(context,e.toString();
                          //   });
                          // }
                        },
                        icon: const Icon(
                          Icons.add,
                          color: AppColor.lightPurple,
                        ),
                      ),
                      IconButton(
                        splashRadius: 10.0,
                        onPressed: () {
                          confirmDeleteProduct(context, product);
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: AppColor.redCockie,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget bottomBarTitle() {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Total",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
          ),
          Obx(
            () {
              return AnimatedSwitcherWrapper(
                child: Text(
                  "\$${controller.totalPrice.value}",
                  key: ValueKey<int>(controller.totalPrice.value),
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                    color: AppColor.darkPurple,
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }

  Future<void> confirmShop(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmación'),
          content: const Text('¿Estás seguro de realizar la compra?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                controller.loading.value = true;

                controller.shop().then((value) {
                  controller.loading.value = false;
                  myToast.showToastSuccess(context, "¡Compra realizada!");
                  Navigator.pop(context);
                  _updateScreen();
                }).catchError((e) {
                  controller.loading.value = false;
                  myToast.showToastError(context,e.toString());
                });
              },
              child: const Text('Sí, continuar'),
            ),
          ],
        );
      },
    );
  }

  Future<void> confirmDeleteProduct(
      BuildContext context, Product product) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmación'),
          content: const Text('¿Estás seguro de eliminar del carrito?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                if (!controller.loading.value) {
                  controller.loading.value = true;

                  controller.deleteFromCar(product).then((value) {
                    Navigator.of(context).pop();
                    controller.loading.value = false;
                    _updateScreen();
                  }).catchError((e) {
                    controller.loading.value = false;
                    Navigator.of(context).pop();
                    myToast.showToastError(context,e.toString());
                  });
                }
              },
              child: const Text('Sí, continuar'),
            ),
          ],
        );
      },
    );
  }

  Widget bottomBarButton() {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(20)),
          onPressed: controller.cartProducts.isEmpty
              ? null
              : () {
                  confirmShop(context);
                },
          child: const Text("Comprar Ahora"),
        ),
      ),
    );
  }

  Widget _validateShop() {
    if (controller.loading.value) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      if (controller.cartProducts.isEmpty) {
        return const EmptyCart();
      } else {
        return cartList();
      }
    }

    // cartProducts
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: _validateShop(),
          ),
          bottomBarTitle(),
          bottomBarButton()
        ],
      ),
    );
  }
}
