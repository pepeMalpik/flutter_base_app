import 'package:flutter_base_app/features/features.dart';

abstract class LoginDatasource {
  Future<Login> attemptLogin({required Credentials credentials});
}
