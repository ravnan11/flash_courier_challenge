import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_flash_courier/app/core/widgets/custom_input_widget.dart';
import 'package:login_flash_courier/app/core/widgets/loading_widget.dart';

import '../login_controller.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final LoginController controller = Modular.get();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: Colors.blueGrey[900],
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            color: Colors.white,
          ),
          width: 300,
          height: 330,
          child: Form(
            key: controller.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 5),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        controller.pathLogin = true;
                        controller.getPath();
                      },
                      child: Text(
                        'Login',
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          height: 1.5,
                          shadows: [
                            Shadow(
                              color: controller.pathLogin
                                  ? Color(0xFFE6B733)
                                  : Colors.black,
                              offset: Offset(0, -5),
                            )
                          ],
                          color: Colors.transparent,
                          decoration: TextDecoration.underline,
                          decorationColor:
                              controller.pathLogin ? Color(0xFFE6B733) : null,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        controller.pathLogin = false;
                        controller.getPath();
                      },
                      child: Text(
                        'Cadastrar',
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          height: 1.5,
                          shadows: [
                            Shadow(
                              color: controller.pathRegister
                                  ? Color(0xFFE6B733)
                                  : Colors.black,
                              offset: Offset(0, -5),
                            )
                          ],
                          color: Colors.transparent,
                          decoration: TextDecoration.underline,
                          decorationColor: controller.pathRegister
                              ? Color(0xFFE6B733)
                              : null,
                        ),
                      ),
                    ),
                  ],
                ),
                CustomInputWidget(
                  hint: 'Email',
                  controller: controller.emailController,
                  onChanged: (value) {
                    controller.loginModel.email = value;
                  },
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    return value == null || value.isEmpty
                        ? "Preencha o campo email."
                        : null;
                  },
                ),
                CustomInputWidget(
                  hint: 'Senha',
                  keyboardType: TextInputType.text,
                  controller: controller.passwordController,
                  onChanged: (value) {
                    controller.loginModel.password = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Informe sua senha';
                    }
                    return null;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      fillColor: MaterialStateProperty.all<Color>(
                        Color(0xFFE6B733),
                      ),
                      checkColor: Colors.white,
                      value: controller.rememberPassword,
                      onChanged: (value) {
                        controller.changeRememberPassword();
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    Text(
                      'Lembrar sempre',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 11,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    SizedBox(width: 50),
                    Text(
                      'Esqueceu a senha ?',
                      style: TextStyle(
                        color: Color(0xFFE6B733),
                        fontSize: 11,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ],
                ),
                controller.isLoading
                    ? LoadingComponent()
                    : GestureDetector(
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 10,
                                  offset: Offset(-3, 3),
                                )
                              ],
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Color(0xFF29B6F6),
                                    Color(0xFF81D4FA),
                                  ])),
                          child: const Icon(
                            color: Colors.white,
                            size: 40,
                            Icons.arrow_forward,
                          ),
                        ),
                        onTap: () async {
                          FocusManager.instance.primaryFocus?.unfocus();
                          if (controller.formKey.currentState!.validate()) {
                            final response = await controller.login(
                              context,
                              controller.loginModel.email!,
                              controller.loginModel.password!,
                            );

                            if (response == 200) {
                              Modular.to.navigate('/home/');
                              controller.isLoading = false;
                            }
                          }
                        },
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
