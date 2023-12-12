import 'package:e_commerce_flutter/core/app_color.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  // ignore: use_super_parameters
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Perfil",
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                color: AppColor.darkYellow,
              ),
              child: const Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Colors.white70,
                          minRadius: 60.0,
                          child: CircleAvatar(
                            radius: 50.0,
                            backgroundImage: AssetImage(
                              'assets/images/profile_pic.png',
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Kenia Reyes Molina", // Texto añadido
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              constraints:
                  const BoxConstraints(maxWidth: 250.0, minHeight: 70),
              margin: const EdgeInsets.all(10),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(35),
                  bottomRight: Radius.circular(35),
                ),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.lightPurple,
                    padding: EdgeInsets.zero,
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    constraints: const BoxConstraints(minHeight: 50.0),
                    alignment: Alignment.center,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Datos de Contacto',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 40,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 80,
              width: 380,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(35),
                  bottomRight: Radius.circular(35),
                ),
                color: AppColor.lightPurple,
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        'Datos de Contacto',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 60,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 80,
              width: 380,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(35),
                  bottomRight: Radius.circular(35),
                ),
                color: AppColor
                    .lightPurple, // Usé Colors.yellow en lugar de AppColor.darkYellow para el ejemplo
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Espacio para el texto o contenido si es necesario
                  Expanded(
                    child: Center(
                      child: Text(
                        'Estatus de compras', // Puedes colocar aquí tu propio texto o contenido
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 60,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
