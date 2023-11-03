import 'package:flutter_base_app/features/features.dart';

class CredentialsModel extends Credentials {
  CredentialsModel({
    super.email,
    super.password,
  });

  factory CredentialsModel.fromJson(Map<String, dynamic> json) =>
      CredentialsModel(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
