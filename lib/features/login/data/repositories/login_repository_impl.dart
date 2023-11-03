import 'package:flutter_base_app/features/features.dart';
import 'package:flutter_base_app/features/login/data/datasources/datasources.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDatasource _datasource;

  LoginRepositoryImpl({required LoginDatasource datasource})
      : _datasource = datasource;

  @override
  Future<Login> attemptLogin({required Credentials credentials}) async {
    try {
      return await _datasource.attemptLogin(credentials: credentials);
    } catch (e) {
      throw '$e';
    }
  }
}

final loginRepositoryProvider = Provider<LoginRepositoryImpl>((ref) {
  final datasource = ref.read(serverLoginDatasourceProvider);
  return LoginRepositoryImpl(datasource: datasource);
});
