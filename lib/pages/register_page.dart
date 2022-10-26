import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:pdm/model/login_class.dart';
import 'package:pdm/pages/camera_page.dart';
import 'package:pdm/routes.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({
    Key? key,
  }) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  Color color = Color.fromARGB(0xFF, 0x40, 0xBF, 0xFF);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  double sideLenght = 100;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value) {
    if (value?.isEmpty ?? false) {
      return "O campo não pode ser vazio";
    } else {
      return null;
    }
  }

  String? _validatePassword(String? value) {
    if (value != null && value.length < 8) {
      return "Digite pelo menos 8 caracteres!";
    } else {
      return null;
    }
  }

  bool valueValidator(String? value) {
    if (value != null && value.isEmpty) {
      return true;
    }
    return false;
  }

  void _login() {
    // A _key será útil aqui para invocarmos a validação dos formulário.
    if (_formKey.currentState?.validate() ?? false) {
      final email = emailController.text;
      final password = passwordController.text;
      final login = LoginClass(
        user: email,
        password: password,
      );
    } else {
      // Mostra um erro ou algum alerta!
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Container(
                  alignment: Alignment.center,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Create a new account",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Braga Clube ®',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 343,
                  height: 48,
                  child: TextFormField(
                    validator: (String? value) {
                      if (valueValidator(value)) {
                        return "Insira seu nome completo";
                      }
                      return null;
                    },
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                    keyboardType: TextInputType.text,
                    controller: nameController,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 1, color: Colors.grey),
                            borderRadius: BorderRadius.circular(8)),
                        hintText: 'Full Name',
                        prefixIcon: const Padding(
                          padding: EdgeInsets.all(8),
                          child: Icon(Icons.person),
                        ),
                        fillColor: Colors.white,
                        filled: true),
                    // validator: _validateEmail,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 343,
                  height: 48,
                  child: TextFormField(
                    validator: _validateEmail,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                    keyboardType: TextInputType.url,
                    controller: emailController,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 1, color: Colors.grey),
                            borderRadius: BorderRadius.circular(8)),
                        hintText: 'Your Email',
                        prefixIcon: const Padding(
                          padding: EdgeInsets.all(8),
                          child: Icon(Icons.email),
                        ),
                        fillColor: Colors.white,
                        filled: true),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 343,
                  height: 48,
                  child: TextFormField(
                    validator: _validatePassword,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    // controller: passwordController,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 1, color: Colors.grey),
                            borderRadius: BorderRadius.circular(8)),
                        hintText: 'Password',
                        prefixIcon: const Padding(
                          padding: EdgeInsets.all(8),
                          child: Icon(Icons.lock),
                        ),
                        fillColor: Colors.white,
                        filled: true),
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: SizedBox(
              //     width: 343,
              //     height: 48,
              //     child: TextFormField(
              //       validator: (String? value) {
              //         if (valueValidator(value)) {
              //           return "Insira uma imagem";
              //         }
              //         return null;
              //       },
              //       onChanged: (text) {
              //         setState(() {});
              //       },
              //       style: const TextStyle(
              //         fontSize: 12,
              //       ),
              //       controller: imageController,
              //       decoration: InputDecoration(
              //           enabledBorder: OutlineInputBorder(
              //               borderSide:
              //                   const BorderSide(width: 1, color: Colors.grey),
              //               borderRadius: BorderRadius.circular(8)),
              //           hintText: 'Imagem',
              //           prefixIcon: const Padding(
              //             padding: EdgeInsets.all(8),
              //             child: Icon(Icons.image),
              //           ),
              //           fillColor: Colors.white,
              //           filled: true),
              //     ),
              //   ),
              // ),
              // SizedBox(height: 30),
              // Container(
              //   width: 100,
              //   height: 100,
              //   decoration: BoxDecoration(
              //     color: Colors.black,
              //     borderRadius: BorderRadius.circular(100),
              //     border: Border.all(width: 2, color: Colors.black),
              //   ),
              //   child: InkWell(
              //     onTap: () async {
              //       await availableCameras().then((value) => Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //               builder: (_) => CameraPage(cameras: value))));
              //       setState(() {});
              //     },
              //     child: ClipRRect(
              //       borderRadius: BorderRadius.circular(10),
              //       child: Image.network(
              //         imageController.text,
              //         errorBuilder: (BuildContext context, Object exception,
              //             StackTrace? stackTrace) {
              //           return Image.asset('lib/assets/nophoto.png');
              //         },
              //         fit: BoxFit.cover,
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 57,
                  width: 343,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple[700]),
                    child: const Text('Sign Up'),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _login();

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Logando'),
                          ),
                        );
                        Navigator.of(context)
                            .pushReplacementNamed(RouteGenerator.homePage);
                      }
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "have a account?",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    TextButton(
                      child: Text(
                        'Sign in',
                        style: TextStyle(fontSize: 16, color: color),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
