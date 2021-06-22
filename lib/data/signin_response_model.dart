class SignInResponseModel {
  late String? message;
  dynamic data;
  late bool? error;
  late String? status;

  SignInResponseModel({this.message, this.data, this.error, this.status});

  SignInResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'];
    error = json['error'];
    status = json['token'];
  }
}
