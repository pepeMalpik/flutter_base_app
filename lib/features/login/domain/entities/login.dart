abstract class Login {
  String? token;
  String? tokenType;
  int? expiresIn;

  Login({
    this.token,
    this.tokenType,
    this.expiresIn,
  });
}
