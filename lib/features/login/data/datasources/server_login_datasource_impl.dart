import 'dart:convert';

import 'package:flutter_base_app/core/core.dart';
import 'package:flutter_base_app/features/features.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ServerLoginDatasourceImpl implements LoginDatasource {
  static final ServerLoginDatasourceImpl _instance =
      ServerLoginDatasourceImpl._();

  factory ServerLoginDatasourceImpl() => _instance;

  ServerLoginDatasourceImpl._() {
    // _initDb();
  }

  @override
  Future<Login> attemptLogin({required Credentials credentials}) async {
    final result = await httpClient!.request(
      route: APIRoute(
        APIType.attemptLogin,
      ),
      create: () => APIResponse<LoginModel>(
        create: () => LoginModel(),
      ),
      data: {
        "email": credentials.email,
        "password": credentials.password,
      },
    );
    final login = result.response?.data;
    print(result.response?.data);
    if (login != null) {
      StorageItem storageItem = StorageItem(
        AppConstants.loginStorageKey,
        json.encode(login),
      );
      await StorageHelper().writeSecureData(storageItem);
    }

    return result.response?.data ?? LoginModel();
  }
}

final serverLoginDatasourceProvider = Provider<ServerLoginDatasourceImpl>(
  (ref) => ServerLoginDatasourceImpl(),
);
