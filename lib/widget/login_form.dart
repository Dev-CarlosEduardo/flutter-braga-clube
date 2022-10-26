import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pdm/model/login_class.dart';

import '../routes.dart';

class LoginForm extends StatefulWidget {
  const LoginForm();

  @override
  State<StatefulWidget> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  @override
  // invocado quando o form for removido da árvore de widgets
  // isso permite liberar qualquer recurso que o widget esteja usando
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // Identificador do Formulário na árvore de Widgets
  // Usaremos para realizar validação dos inputs
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _key,
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: <Widget>[
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.mail),
                      hintText: "Email",
                    ),
                    // Passamos um callback para validar a string inserida no campo
                    validator: _validateEmail,
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.vpn_key),
                      hintText: "Senha",
                    ),
                    obscureText: true,
                    // Passamos um callback para validar a string inserida no campo
                    validator: _validatePassword,
                    maxLength: 20,
                  ),
                  TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      icon: Icon(CupertinoIcons.profile_circled),
                      hintText: "Nome",
                    ),
                  ),
                ],
              ),
              Text(
                "Ao continuar, o cliente concorda com os nossos Termos de Serviço e Política de Privacidade.",
                style: TextStyle(fontSize: 10),
              ),
              InkWell(
                onTap: () =>
                    Navigator.of(context).pushNamed(RouteGenerator.homePage),
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  child: Text(
                    'Selecione',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ));
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

  void _login() {
    // A _key será útil aqui para invocarmos a validação dos formulário.
    if (_key.currentState?.validate() ?? false) {
      final email = emailController.text;
      final password = passwordController.text;
      final name = nameController.text;

      final login = LoginClass(
        user: email,
        password: password,
        // name: name,
      );
    } else {
      // Mostra um erro ou algum alerta!
    }
  }
}
