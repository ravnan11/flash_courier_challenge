import 'package:flutter/material.dart';
import 'package:login_flash_courier/app/modules/login/login_page.dart';

class AuthCheck extends StatefulWidget {
  const AuthCheck({Key? key}) : super(key: key);

  @override
  State<AuthCheck> createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  @override
  Widget build(BuildContext context) {
    // if (auth.isLoading) {
    // return LoadingComponent();
    //} else if (auth.usuario == null) {
    // return LoginPage();
    //} else {
    // return HomePage();
    //   }

    return LoginPage();
  }
}
