import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login_flash_courier/app/core/widgets/auth_exception.dart';
import 'package:login_flash_courier/app/modules/login/login_model.dart';
import 'package:login_flash_courier/app/modules/login/login_repository.dart';

class LoginController extends ChangeNotifier {
  final LoginModel loginModel = LoginModel();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool rememberPassword = false;
  bool pathLogin = true;
  bool pathRegister = false;
  bool isLoading = false;

  final LoginRepository repository;
  LoginController(this.repository);

  Future<int> login(BuildContext context, String email, String password) async {
    isLoading = true;
    notifyListeners();
    try {
      final response = await repository.login(email: email, password: password);
      if (response['statusCode'] == 400) {
        isLoading = false;
        Fluttertoast.showToast(
          msg: "Senha ou email invalido",
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 4,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        notifyListeners();
      }
      return response['statusCode'];
    } on AuthException catch (e) {
      isLoading = false;
      notifyListeners();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
      return 400;
    }
  }

  void logout() {
    Modular.to.navigate('/login/');
  }

  changeRememberPassword() {
    rememberPassword = !rememberPassword;
    notifyListeners();
  }

  getPath() {
    if (pathLogin) {
      pathRegister = false;
    } else {
      pathRegister = true;
    }
    notifyListeners();
  }
}
