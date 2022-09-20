import 'package:flutter/material.dart';
import 'package:login_flash_courier/app/core/image/app_images.dart';
import 'package:login_flash_courier/app/modules/login/widgets/login_form_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: size.height * .60,
              width: size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF03A9F4),
                    Color(0xFF03A9F4),
                    Color(0xFF81D4FA),
                    Color(0xFF4FC3F7),
                    Color(0xFF29B6F6),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Image.asset(
                        AppImages.logotipo,
                        width: 100,
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Qualidade e segurança  em todos os detalhes!',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Montserrat",
                          fontSize: 12,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: size.height * .40,
              color: Colors.white,
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(top: 70),
                child: LoginForm(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
