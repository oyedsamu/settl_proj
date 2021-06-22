import 'package:settl_proj/data/api_provider.dart';
import 'package:settl_proj/data/signin_response_model.dart';

class LoginRepository {
  final _apiProvider = ApiProvider();
  Future<SignInResponseModel> loginUserWithPassword(
      String email, String password) async {
    return _apiProvider.loginUserWithPassword(email, password);
  }
}
