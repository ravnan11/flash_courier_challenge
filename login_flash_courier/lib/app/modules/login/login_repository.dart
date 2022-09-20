import '../../core/data/http/http.dart';

abstract class LoginRepository {
  Future<dynamic> login({required String email, required String password});
}

class LoginRepositoryImp implements LoginRepository {
  final HttpClient httpClient;
  LoginRepositoryImp(this.httpClient);

  @override
  Future<dynamic> login(
      {required String email, required String password}) async {
    try {
      Map<String, dynamic> body = {
        "email": email,
        "password": password,
      };

      final httpResponse = await httpClient.request(
        'https://reqres.in/api/login',
        method: 'post',
        body: body,
      );

      return httpResponse;
    } catch (e) {
      return e;
    }
  }
}
