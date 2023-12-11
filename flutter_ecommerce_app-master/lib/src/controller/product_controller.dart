import 'package:e_commerce_flutter/src/services/stock_service.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:e_commerce_flutter/core/app_data.dart';
import 'package:e_commerce_flutter/src/model/product.dart';
import 'package:e_commerce_flutter/src/model/numerical.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:e_commerce_flutter/src/model/product_category.dart';
import 'package:e_commerce_flutter/src/model/product_size_type.dart';
import 'dart:math';

import 'package:e_commerce_flutter/src/services/carrito_service.dart';
import 'package:e_commerce_flutter/src/services/producto_service.dart';

class ProductController extends GetxController {
  final ProductoService productoService = ProductoService();
  final CarritoService carritoService = CarritoService();
  final StockService stockService = StockService();

  List<Product> allProducts = AppData.products;
  RxList<Product> filteredProducts = AppData.products.obs;
  RxList<Product> cartProducts = <Product>[].obs;
  RxList<ProductCategory> categories = AppData.categories.obs;
  RxInt totalPrice = 0.obs;

  void filterItemsByCategory(int index) {
    for (ProductCategory element in categories) {
      element.isSelected = false;
    }
    categories[index].isSelected = true;

    if (categories[index].type == ProductType.all) {
      filteredProducts.assignAll(allProducts);
    } else {
      filteredProducts.assignAll(allProducts.where((item) {
        return item.type == categories[index].type;
      }).toList());
    }
    update();
  }

  void isFavorite(int index) {
    filteredProducts[index].isFavorite = !filteredProducts[index].isFavorite;
    update();
  }

  void addToCart(Product product) {
    product.quantity++;
    cartProducts.add(product);
    cartProducts.assignAll(cartProducts);
    calculateTotalPrice();
  }

  void increaseItemQuantity(Product product) {
    product.quantity++;
    calculateTotalPrice();
    update();
  }

  void decreaseItemQuantity(Product product) {
    product.quantity--;
    calculateTotalPrice();
    update();
  }

  bool isPriceOff(Product product) => product.off != null;

  bool get isEmptyCart => cartProducts.isEmpty;

  bool isNominal(Product product) => product.sizes?.numerical != null;

  void calculateTotalPrice() {
    totalPrice.value = 0;
    for (var element in cartProducts) {
      if (isPriceOff(element)) {
        totalPrice.value += element.quantity * element.off!;
      } else {
        totalPrice.value += element.quantity * element.price;
      }
    }
  }

  getFavoriteItems() {
    filteredProducts.assignAll(
      allProducts.where((item) => item.isFavorite),
    );
  }

  getCartItems() {
    // cartProducts.assignAll(
    //   allProducts.where((item) => item.quantity > 0),
    // );
    obtenerMiCarrito();
  }

  getAllItems() {
    // filteredProducts.assignAll(allProducts);
    listAllProducts();
  }

  List<Numerical> sizeType(Product product) {
    ProductSizeType? productSize = product.sizes;
    List<Numerical> numericalList = [];

    if (productSize?.numerical != null) {
      for (var element in productSize!.numerical!) {
        numericalList.add(Numerical(element.numerical, element.isSelected));
      }
    }

    if (productSize?.categorical != null) {
      for (var element in productSize!.categorical!) {
        numericalList.add(
          Numerical(
            element.categorical.name,
            element.isSelected,
          ),
        );
      }
    }

    return numericalList;
  }

  void switchBetweenProductSizes(Product product, int index) {
    sizeType(product).forEach((element) {
      element.isSelected = false;
    });

    if (product.sizes?.categorical != null) {
      for (var element in product.sizes!.categorical!) {
        element.isSelected = false;
      }

      product.sizes?.categorical![index].isSelected = true;
    }

    if (product.sizes?.numerical != null) {
      for (var element in product.sizes!.numerical!) {
        element.isSelected = false;
      }

      product.sizes?.numerical![index].isSelected = true;
    }

    update();
  }

  String getCurrentSize(Product product) {
    String currentSize = "";
    if (product.sizes?.categorical != null) {
      for (var element in product.sizes!.categorical!) {
        if (element.isSelected) {
          currentSize = "Size: ${element.categorical.name}";
        }
      }
    }

    if (product.sizes?.numerical != null) {
      for (var element in product.sizes!.numerical!) {
        if (element.isSelected) {
          currentSize = "Size: ${element.numerical}";
        }
      }
    }
    return currentSize;
  }

  Future<void> obtenerMiCarrito() async {
    try {
      dynamic miCarrito = await carritoService.obtenerMiCarrito();
      List<dynamic> productosCarrito = miCarrito['carrito_producto'];
      List<Product> productos = [];

      if (productosCarrito.isNotEmpty) {
        for (dynamic productoCarrito in productosCarrito) {
          dynamic stockData = productoCarrito['stock'] as dynamic;
          dynamic productoData = stockData['producto'] as dynamic;

          List<dynamic> imagenes = productoData['imagenes'] as List<dynamic>;
          List<String> imagenesString =
              imagenes.map((imagen) => imagen.toString()).toList();

          Product product = Product(
              name: productoData['nombre'],
              price: stockData['precio'] as int,
              about: productoData['descripcion'],
              isAvailable: true,
              off: null,
              quantity: 1,
              images: imagenesString,
              isFavorite: true,
              rating: Random().nextInt(3) + 3,
              type: ProductType.all);
          productos.add(product);
        }
      }

      allProducts = productos;

      cartProducts.assignAll(
        allProducts.where((item) => item.quantity > 0),
      );

      calculateTotalPrice();
    } catch (e) {
      // myToast.showToastError(context, e.toString());
      // print('Error: $e');
    }
  }

  Future<void> listAllProducts() async {
    try {
      // dynamic miCarrito = await productoService.listarProductos();
      List<dynamic> stockProductos = await stockService.listar();
      List<Product> productos = [];

      if (stockProductos.isNotEmpty) {
        for (dynamic stockData in stockProductos) {
          dynamic productoData = stockData['producto'] as dynamic;
          dynamic tallaData = stockData['talla'] as dynamic;
          dynamic colorData = stockData['color'] as dynamic;

          List<dynamic> imagenes = productoData['imagenes'] as List<dynamic>;
          List<String> imagenesString =
              imagenes.map((imagen) => imagen.toString()).toList();

          Product product = Product(
              name: productoData['nombre'],
              price: stockData['precio'] as int,
              about: productoData['descripcion'],
              isAvailable: true,
              off: null,
              quantity: stockData['existencia'] as int,
              images: imagenesString,
              isFavorite: true,
              rating: Random().nextInt(3) + 3,
              type: ProductType.all, 
              idStock: stockData['idStock'] as int,
              existence: stockData['existencia'] as int,
              sizeName: tallaData['nombre'] as String,
              color: colorData['color'] as String
          
            );
          productos.add(product);
        }
      }

      allProducts = productos.where((item) => item.quantity > 0).toList();
      filteredProducts.assignAll(allProducts);


    } catch (e) {
      // myToast.showToastError(context, e.toString());
      // print('Error: $e');
    }
  }
}
