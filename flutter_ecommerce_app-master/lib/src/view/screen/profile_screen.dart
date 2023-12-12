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
      body:SingleChildScrollView(
        child: Column(children: [
          Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 28.0),
                      child: CircleAvatar(
                        child:Image.asset("assets/images/avatar.png"),
                        backgroundColor: Colors.grey,
                        radius: 60.0,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 5.0, top: 10),
                      child: Text(
                        'araceli@gmail.com',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0,),
          Container(
                height: 330.0,
                width: 450,
                decoration:  BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(30),),
                child:  const Column(children: [
                   Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: 
                          Text(
                            'Nombre',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                      
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: 
                          Text(
                            'Araceli',
                             style: TextStyle(fontSize: 16),
                          ),
                      
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: 
                          Text(
                            'Apellidos',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                      
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: 
                          Text(
                            'Garcia Diaz',
                             style: TextStyle(fontSize: 16),
                          ),
                      
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: 
                          Text(
                            'Fecha de Nacimiento',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                      
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: 
                          Text(
                            '01-10-2002',
                           style: TextStyle(fontSize: 16),
                          ),
                      
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: 
                          Text(
                            'Género',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                      
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: 
                          Text(
                            'Femenino',
                            style: TextStyle(fontSize: 16),
                          ),
                      
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(children: [
                          Icon(
                            Icons.location_on,
                            size: 30,
                            color: Colors.purple,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Direcciones',
                             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          SizedBox(
                            width: 240,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 20,
                            color: Colors.black,
                          ),
                        ]),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(children: [
                          Icon(
                            Icons.phone_android,
                            size: 30,
                            color: Colors.purple,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Contacto',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          SizedBox(
                            width: 260,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 20,
                            color: Colors.black,
                          ),
                        ]),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(children: [
                          Icon(
                            Icons.shopping_bag,
                            size: 30,
                            color: Colors.purple,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Mis compras',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          SizedBox(
                            width: 230,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 20,
                            color: Colors.black,
                          ),
                        ]),
                      ),
                    ],
                  ),
                  
                ]),
              )
        ],),
      )
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
