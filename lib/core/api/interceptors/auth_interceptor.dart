import 'dart:convert';

import 'package:flutter_base_app/core/core.dart';
import 'package:flutter_base_app/features/login/login.dart';
import 'package:dio/dio.dart';

import '../api_client.dart';
import '../decodable.dart';

class AuthToken implements Decodable<AuthToken> {
  String? accessToken;
  String? refreshToken;
  int? expiredTime;

  AuthToken({required this.accessToken, this.refreshToken, this.expiredTime});

  @override
  AuthToken decode(dynamic data) {
    expiredTime = data['expired_time'];
    return this;
  }

  Future startRefreshToken() async {
    await Future.delayed(const Duration(seconds: 5));
    // assign new access token
    accessToken =
        'aeyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMzQuMjIyLjIxNi40OTo4MDYwL2FwaS9sb2dpbiIsImlhdCI6MTY5MDk5ODYxMywiZXhwIjoxNjk0MTc4NjEzLCJuYmYiOjE2OTA5OTg2MTMsImp0aSI6IjBveGtlTXpUYzE4ZENCcFciLCJzdWIiOiIxIiwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.DINSnG9c7moVcpqr8ot0bYGVDTmIboAQ_o44Iy3FDy0';
  }

  bool isExpired() {
    return true;
  }
}

class AuthInterceptor extends InterceptorsWrapper {
  final APIClient client;
  String? token;
  // final _db = DatabaseService();

  AuthInterceptor({required this.client, this.token});

  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // find token here!!!
    final data =
        await StorageHelper().readSecureData(AppConstants.loginStorageKey);
    if (data == null) {
      return;
    }
    Login login = LoginModel.fromJson(json.decode(data));
    token = login.token;

    final authorize = options.extra['Authorization'] ?? false;
    if (!authorize || token == '') {
      return super.onRequest(options, handler);
    }

    // if (token!.isExpired()) {
    //   client.instance.lock();
    //   debugPrint('Lock request for refreshing token...');
    //   await token!.startRefreshToken();
    //   client.instance.unlock();
    //   debugPrint('Refresh token completed!');
    // }

    options.headers['Authorization'] = 'Bearer $token';
    return super.onRequest(options, handler);
  }
}
