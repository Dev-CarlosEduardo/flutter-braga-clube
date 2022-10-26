import 'package:flutter/material.dart';
import 'package:pdm/routes.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[700],
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Bem",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Vindo",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Image.asset('lib/assets/logo.png'),
              Text(
                'Tecnologia a serviço do cliente',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () =>
                    Navigator.of(context).pushNamed(RouteGenerator.loginPage),
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 85),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Text(
                    "Fazer Login",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              // SizedBox(height: 70),
              InkWell(
                onTap: () => Navigator.of(context)
                    .pushNamed(RouteGenerator.registerPage),
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 85),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Text(
                    "Criar Conta",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
