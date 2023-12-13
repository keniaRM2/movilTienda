import 'package:e_commerce_flutter/core/app_color.dart';
import 'package:flutter/material.dart';
class ShoppingHistory {
  final String date;
  final String title;
  final String description;
  final String image;

  ShoppingHistory(
      {required this.date,
      required this.title,
      required this.description,
      required this.image});
}
class MyShoppingScreen extends StatelessWidget{
  const MyShoppingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<ShoppingHistory> shoppingHistory = [
      ShoppingHistory(
        title: 'Sueter Crochet color negro',
        description: 'Entregado',
        date: '2023-10-12',
        image: "assets/images/women.png"
      ),
    ];

    return Scaffold(
        appBar: AppBar(
            title: const Text('Mis compras', style: TextStyle( fontSize: 16)),
            backgroundColor: AppColor.lightPurple),
        body:
            ListView.builder(
              itemCount: shoppingHistory.length,
              itemBuilder: (context, index) {
                return
                  Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: ConstrainedBox(
                    constraints: const BoxConstraints(
                      minWidth: 44,
                      minHeight: 44,
                      maxWidth: 64,
                      maxHeight: 64,
                    ),
                    child: Image.asset(shoppingHistory[index].image, fit: BoxFit.cover),
                  ),
                    title: Text(shoppingHistory[index].title),
                    subtitle: Text(shoppingHistory[index].description +" "+ shoppingHistory[index].date),
                  ),
                  );
              },
            )
          
        );
  }

}