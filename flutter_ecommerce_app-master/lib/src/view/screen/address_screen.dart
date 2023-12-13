import 'package:e_commerce_flutter/core/app_color.dart';
import 'package:e_commerce_flutter/src/view/screen/login_screen.dart';
import 'package:flutter/material.dart';

class AddressScreen extends StatefulWidget{
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _municipality = TextEditingController(text: '');
  final TextEditingController _postalCode= TextEditingController(text: '');
  final TextEditingController _outdoorNumber =TextEditingController(text: '');
  final TextEditingController _interiorNumber= TextEditingController( text: '');
  final TextEditingController _suburb =TextEditingController( text: '');
  final TextEditingController _street= TextEditingController( text: '');
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
            title: const Text('Dirección de Envio',style: TextStyle( fontSize: 16)),
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
                              labelText: 'Estado:'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Campo obligario';
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.emailAddress,
                          controller: _municipality,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              labelText: 'Municipio/Delegación:'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Campo obligario';
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.emailAddress,
                          controller: _municipality,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          decoration:
                              const InputDecoration(labelText: 'Colonia:'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Campo obligario';
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.text,
                          controller: _suburb,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              labelText: 'Código Postal:'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Campo obligario';
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.number,
                          controller: _postalCode,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Número Exterior',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Campo obligatorio';
                                  } else {
                                    return null;
                                  }
                                },
                                keyboardType: TextInputType.number,
                                controller: _outdoorNumber,
                              ),
                            ),
                          ),
                          const SizedBox(
                              width:
                                  16.0), 
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Número Interior',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Campo obligatorio';
                                  } else {
                                    return null;
                                  }
                                },
                                keyboardType: TextInputType.number,
                                controller:_interiorNumber
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              labelText: 'Calle:'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Campo obligario';
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.text,
                          controller: _street,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(300, 50),
                                backgroundColor: AppColor.lightPurple),
                            onPressed: () {
                                  //  Navigator.push(  context,MaterialPageRoute(  builder: (context) =>LoginScreen());                                           ),
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