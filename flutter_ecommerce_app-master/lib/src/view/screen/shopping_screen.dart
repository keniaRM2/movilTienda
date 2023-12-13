import 'package:e_commerce_flutter/core/app_color.dart';
import 'package:e_commerce_flutter/src/view/screen/home_screen.dart';
import 'package:flutter/material.dart';

class ShoppingScreen extends StatelessWidget {
  const ShoppingScreen({super.key});

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
        body: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
              
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                        const HomeScreen()),
                );
              },
              child: ListTile(
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Fecha: $index",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "Total: $index",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(height: 8),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        const Text(
                          "Status: ",
                          style: TextStyle(
                            color: AppColor.darkPurple,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                            width: 8), // Espacio entre el texto y el icono
                        GestureDetector(
                          onTap: () {
                            // Lógica para la navegación al otro screen cuando se toca el icono
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const HomeScreen()), // Reemplaza 'OtraPantalla()' con el nombre de tu pantalla de destino
                            );
                          },
                          child: const Icon(
                            Icons.arrow_forward_ios,
                            size: 40,
                            color: AppColor.darkPurple,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
