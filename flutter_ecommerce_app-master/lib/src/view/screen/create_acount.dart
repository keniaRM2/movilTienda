import 'package:e_commerce_flutter/core/app_color.dart';
import 'package:e_commerce_flutter/src/view/screen/login_screen.dart';
import 'package:flutter/material.dart';

class CreateAccount extends StatelessWidget {
   MaterialColor mycolor = MaterialColor(AppColor.lightPurple.value, <int, Color>{
     50: AppColor.lightPurple.withOpacity(0.1),
     100: AppColor.lightPurple.withOpacity(0.2),
     200: AppColor.lightPurple.withOpacity(0.3),
     300: AppColor.lightPurple.withOpacity(0.4),
     400: AppColor.lightPurple.withOpacity(0.5), 
     500: AppColor.lightPurple.withOpacity(0.6),
     600: AppColor.lightPurple.withOpacity(0.7),
     700: AppColor.lightPurple.withOpacity(0.8),
     800: AppColor.lightPurple.withOpacity(0.9),
     900: AppColor.lightPurple.withOpacity(1),
   },
 ); 

  //const CreateAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registro de Usuario',
      theme: ThemeData(
        primarySwatch: mycolor,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
    
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  List<Widget> _forms = [
    FirstForm(),
    SecondForm(),
    ThirdForm(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _forms.length,
              onPageChanged: (idx) {
                setState(() {
                  _currentPage = idx;
                });
              },
              itemBuilder: (context, idx) {
                return _forms[idx];
              },
            ),
          ),
          SizedBox(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    visualDensity: VisualDensity.comfortable,
                    foregroundColor: AppColor.darkPurple,
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    if (_currentPage > 0) {
                      _pageController.animateToPage(_currentPage - 1,
                          curve: Curves.easeInOutCubic,
                          duration: const Duration(milliseconds: 250));
                    }
                  },
                  child: const Text("Back"),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    visualDensity: VisualDensity.comfortable,
                    foregroundColor: AppColor.darkPurple,
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    if (_currentPage == _forms.length - 1) {
                      // Last page, perform finish action
                      // You can call a function or navigate to a new screen
                      print("Finish");
                    } else {
                      _pageController.animateToPage(_currentPage + 1,
                          curve: Curves.easeInOutCubic,
                          duration: const Duration(milliseconds: 250));
                    }
                  },
                  child: Row(
                    children: [
                      Text(
                        _currentPage == _forms.length - 1 ? "Finish" : "Next",
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        _currentPage == _forms.length - 1
                            ? Icons.done
                            : Icons.arrow_forward,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FirstForm extends StatefulWidget {
  const FirstForm({super.key});

  @override
  State<FirstForm> createState() => _FirstFormState();
}

class _FirstFormState extends State<FirstForm> {
  final _formKey = GlobalKey<FormState>();
  var _isButtonDisabled = true;
  var _obscurePassword = true;
  final TextEditingController _email = TextEditingController(text: '');
  final TextEditingController _password = TextEditingController(text: '');
  final TextEditingController _confirmPassword= TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            title: const Text('Usuario',style: TextStyle( fontSize: 18)),
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
                    _isButtonDisabled = !_formKey.currentState!.validate();
                  });
                },
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Correo Electronico:'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Campo obligario';
                          } else{
                            return 'Email no valido';
                          } 
                        },
                        keyboardType: TextInputType.emailAddress,
                        controller: _email,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextFormField(
                        decoration:
                            InputDecoration(labelText: 'Contraseña:', 
                            suffixIcon: IconButton(
                              icon: Icon(_obscurePassword ? Icons.visibility_off:Icons.visibility ),
                              onPressed: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },)),
                            obscureText: _obscurePassword,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Campo obligario';
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.text,
                        controller: _password,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextFormField(
                        decoration:
                            InputDecoration(labelText: 'Confirmar Contraseña:', 
                            suffixIcon: IconButton(
                              icon: Icon(_obscurePassword ? Icons.visibility_off: Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },)),
                            obscureText: _obscurePassword,
                          validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Campo obligatorio';
                          } else if (value != _password.text) {
                            return 'Las contraseñas no coinciden';
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.text,
                        controller: _confirmPassword,
                      ),
                    ),
                    
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondForm extends StatefulWidget {
  @override
  State<SecondForm> createState() => _SecondFormState();
}

class _SecondFormState extends State<SecondForm> {
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
            title: const Text('Dirección',style: TextStyle( fontSize: 18)),
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
                      
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
        );
  }
}

class ThirdForm extends StatefulWidget {
  @override
  State<ThirdForm> createState() => _ThirdFormState();
}

class _ThirdFormState extends State<ThirdForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _secondEmail = TextEditingController(text: '');
  final TextEditingController _telephone = TextEditingController(text: '');
  final TextEditingController _secondTelephone =TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
            title: const Text('Contacto',style: TextStyle( fontSize: 18)),
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
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
        );
  }
}

