import 'package:e_commerce_flutter/core/app_color.dart';
import 'package:e_commerce_flutter/src/view/screen/login_screen.dart';
import 'package:flutter/material.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _secondEmail = TextEditingController(text: '');
  final TextEditingController _telephone = TextEditingController(text: '');
  final TextEditingController _secondTelephone =TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Datos de Contacto',style: TextStyle( fontSize: 16)),
            backgroundColor: AppColor.lightPurple),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                margin: const EdgeInsets.all(16),
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 8,
                child: Form(
                  key: _formKey,
                  onChanged: () {
                    setState(() {
                    });
                  },
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              labelText: 'Segundo Correo:'),
                          validator: (value) {
                          
                          if (value == null || value.isEmpty) {
                            return 'Campo obligario';
                          } else {
                            return null;
                          }
                          },
                          keyboardType: TextInputType.emailAddress,
                          controller: _secondEmail,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          decoration:
                              const InputDecoration(labelText: 'Celular:'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Campo obligario';
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.number,
                          controller: _telephone,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              labelText: 'Segundo Celular:'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Campo obligario';
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.number,
                          controller: _secondTelephone,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(300, 50),
                                backgroundColor: AppColor.lightPurple),
                            onPressed:() {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                            LoginScreen()),
                                    );
                                  },
                            child: const Text('Guardar')),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
