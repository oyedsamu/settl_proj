import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:settl_proj/data/signin_response_model.dart';
import 'package:settl_proj/presentation/utils.dart';

class ApiProvider {
  Map<String, String> headersForLogin = {
    "Content-Type": "application/json",
  };

  Future<SignInResponseModel> loginUserWithPassword(
      String email, String password) async {
    //params
    var body = jsonEncode({"email": email, "password": password});
    final response = await http.post(
        Uri.parse(
            "https://my-cscore-development.herokuapp.com/api/v1/enterprise/login"),
        body: body,
        headers: headersForLogin);

    final data = json.decode(response.body);
    SignInResponseModel loginuserModel = SignInResponseModel.fromJson(data);

    Utils.showLog("LoginData", data.toString());

    return loginuserModel;
  }
}
