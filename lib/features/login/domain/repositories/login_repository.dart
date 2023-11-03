import 'package:flutter_base_app/features/features.dart';

abstract class LoginRepository {
  Future<Login> attemptLogin({required Credentials credentials});
}
