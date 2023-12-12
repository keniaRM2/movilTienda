import 'package:e_commerce_flutter/core/app_color.dart';
import 'package:e_commerce_flutter/src/view/screen/home_screen.dart';
import 'package:e_commerce_flutter/src/view/screen/product_list_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  // ignore: use_super_parameters
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: _appBar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            productPageView(height, width),
            const SizedBox(height: 20.0),
            profileDetails(context),
          ],
        ),
      ),
    );
  }

  Widget productPageView(double height, double width) {
    return Container(
      height: height * 0.25,
      width: width,
      decoration: const BoxDecoration(
        color: AppColor.lightGrey,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 28.0),
            child: CircleAvatar(
              radius: 60.0,
              child: Image.asset("assets/images/avatar.png"),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 5.0, top: 10),
            child: Text(
              'araceli@gmail.com',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }

  Widget profileDetails(BuildContext context) {
    return Container(
      height: 500.0,
      width: 600.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Column(
        children: [
          FutureBuilder<String>(
            future: authController.getFullNameUser(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else {
                String fullNameUser = snapshot.data ?? '';
                return _buildProfileInfo('Nombre:   ', fullNameUser);
              }
            },
          ),
           FutureBuilder<String>(
            future: authController.getfechaNacimiento(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else {
                String fechaNacimiento = snapshot.data ?? '';
                return _buildProfileInfo('Fecha de Nacimiento:   ', fechaNacimiento);
              }
            },
          ),
          buildActionRow(context,Icons.location_on, 'Direcciones'),
          buildActionRow(context,Icons.phone_android, 'Contacto'),
          buildActionRow(context,Icons.shopping_bag, 'Mis compras'),
          buildActionRow(context,Icons.login, 'Salir de sesión'),
        ],
      ),
    );
  }

  Widget buildActionRow(BuildContext context,IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () {
          switch (text) {
            case 'Direcciones':
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()), 
              );
              break;
            case 'Contacto':
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),  
              );
              break;
                case 'Mis compras':
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),  
              );
              break;
                    default:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),  
              );
              break;
          }
        },
        child: Row(
          children: [
            Icon(
              icon,
              size: 30,
              color: AppColor.darkPurple,
            ),
            const SizedBox(width: 10),
            Text(
              text,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              size: 40,
              color: AppColor.darkPurple,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileInfo(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      title: Text(
        "Mi Perfil",
        style: Theme.of(context).textTheme.displayLarge,
      ),
    );
  }
}
