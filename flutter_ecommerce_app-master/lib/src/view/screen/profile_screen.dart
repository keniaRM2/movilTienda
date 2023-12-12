import 'package:e_commerce_flutter/core/app_color.dart';
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
      body: Stack(
        children: [
          productPageView(height, width),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey, width: 3),
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage:
                        const AssetImage('assets/images/profile_pic.png'),
                    radius: 50,
                    foregroundColor: Colors.transparent,
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/profile_pic.png',
                        fit: BoxFit.cover,
                        width: 100, // Ajusta el tamaño según lo necesites
                        height: 100, // Ajusta el tamaño según lo necesites
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _buildProfileInfo("Nombre", "Juan"),
              _buildProfileInfo("Apellidos", "Pérez Gómez"),
              _buildProfileInfo("Fecha de nacimiento", "10 de Enero, 1990"),
              _buildProfileInfo("Género", "Masculino"),
            ],
          ),
        ],
      ),
    );
  }

  Widget productPageView(double height, double width) {
    return Container(
      height: height * 0.45,
      width: width,
      decoration: const BoxDecoration(
        color: AppColor.lightYellow,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(80),
          bottomLeft: Radius.circular(80),
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
