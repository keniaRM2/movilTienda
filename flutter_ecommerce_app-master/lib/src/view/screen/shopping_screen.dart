import 'package:e_commerce_flutter/core/app_color.dart';
import 'package:e_commerce_flutter/core/my_toast.dart';
import 'package:e_commerce_flutter/src/controller/compra_controller.dart';
import 'package:e_commerce_flutter/src/model/compra_dto.dart';
import 'package:e_commerce_flutter/src/view/screen/history_shopping_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final CompraController controller = Get.put(CompraController());
final MyToast myToast = MyToast();

class ShoppingScreen extends StatefulWidget {
  // ignore: use_super_parameters
  const ShoppingScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ShoppingScreenState createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> {
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

  void _updateScreen() {
    controller.loading.value = true;

    controller.listarMisCompras().then((value) {
      controller.loading.value = false;
      if (mounted) {
        setState(() {});
      }
    }).catchError((e) {
      controller.loading.value = false;
      myToast.showToastError(context, e.toString());
      if (mounted) {
        setState(() {});
      }
    });
  }

  List<Widget> miCompras(int index) {
    List<Widget> widgets = [];

    // for (var index = 0; index < controller.compras.length; index++) {
      CompraDTO compraDTO = controller.compras[index];
      String fechaCompra =
          compraDTO?.fechaCompra?.split("T")?.isNotEmpty == true
              ? compraDTO.fechaCompra!.split("T")[0]
              : 'Fecha no disponible';
      Widget first = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Fecha: ${fechaCompra}",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Text(
            "Total:  ${compraDTO.total}",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          // const SizedBox(height: 8, width: 10),
          Text(
            "Estatus: ${compraDTO.statusNombre}",
            style: const TextStyle(
                color: AppColor.darkPurple,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
          // const SizedBox(height: 8, width: 10),
          
          
          const SizedBox(height: 8, width: 10),
        ],
      );
      return [first];
      // widgets.add(first);
    // }

    // for (var index = 0; index < controller.compras.length; index++) {
    //   CompraDTO compraDTO = controller.compras[index];

    //   Widget first = Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       Text(
    //         "Fecha: ${compraDTO.fechaCompra}",
    //         style: const TextStyle(
    //           fontWeight: FontWeight.bold,
    //           fontSize: 18
    //         ),
    //       ),
    //       Text(
    //         "Total: ${compraDTO.total}",
    //         style: const TextStyle(
    //           fontWeight: FontWeight.bold,
    //           fontSize: 18
    //         ),
    //       ),
    //       const SizedBox(height: 8),
    //     ],
    //   );

    //   // Widget second = Column(
    //   //   crossAxisAlignment: CrossAxisAlignment.start,
    //   //   children: [
    //   //     Row(
    //   //       children: [
    //   //         Text(
    //   //           "Estatus: ${compraDTO.statusNombre}",
    //   //           style: const TextStyle(
    //   //             color: AppColor.darkPurple,
    //   //             fontWeight: FontWeight.bold,
    //   //             fontSize: 18
    //   //           ),
    //   //         ),
    //   //         const SizedBox(width: 8),
    //   //         GestureDetector(
    //   //           onTap: () {
    //   //             Navigator.push(
    //   //               context,
    //   //               MaterialPageRoute(
    //   //                 builder: (context) => const HistoryShoppingScreen(),
    //   //               ),
    //   //             );
    //   //           },
    //   //           child: const Icon(
    //   //             Icons.arrow_forward_ios,
    //   //             size: 40,
    //   //             color: AppColor.darkPurple,
    //   //           ),
    //   //         ),
    //   //       ],
    //   //     ),
    //   //     const SizedBox(height: 8), // Ajusta la altura según tus necesidades
    //   //   ],
    //   // );

    //   widgets.add(first);
    //   // widgets.add(second);
    // }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 300.0,
              floating: false,
              pinned: true,
              stretch: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                titlePadding: EdgeInsets.zero,
                collapseMode: CollapseMode.parallax,
                title: const Text(
                  "Mis Compras",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                  ),
                ),
                background: Image.asset(
                  'assets/images/portada_shopping.png',
                  height: 30,
                  fit: BoxFit.fill,
                ),
              ),
            )
          ];
        },
        body: controller.loading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: controller.compras.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    child: ListTile(
                      title: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: miCompras(index)
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
