import 'package:flutter_base_app/core/core.dart';
import 'package:flutter_base_app/features/features.dart';

class LoginModel extends Login implements Decodable<LoginModel> {
  LoginModel({
    super.token,
    super.tokenType,
    super.expiresIn,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        token: json["token"],
        tokenType: json["token_type"],
        expiresIn: json["expires_in"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "token_type": tokenType,
        "expires_in": expiresIn,
      };

  @override
  LoginModel decode(data) {
    token = data["token"];
    tokenType = data["token_type"];
    expiresIn = data["expires_in"];
    return this;
  }
}
