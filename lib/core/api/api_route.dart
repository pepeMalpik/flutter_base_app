import 'package:dio/dio.dart';

enum APIType {
  // -- [auth]
  attemptLogin,
  // -- [order]
  orderCreate,
}

class APIRoute implements APIRouteConfigurable {
  final APIType type;
  final String? routeParams;
  final headers = {
    'accept': 'application/json',
    'content-type': 'application/json'
  };

  APIRoute(this.type, {this.routeParams});

  /// Return config of api (method, url, header)
  @override
  RequestOptions? getConfig() {
    // pass extra value to detect public or auth api
    final authorize = {'Authorization': true};

    switch (type) {
      case APIType.attemptLogin:
        return RequestOptions(
          path: 'login',
          method: APIMethod.post,
        );
      case APIType.orderCreate:
        return RequestOptions(
          path: 'order',
          method: APIMethod.post,
          extra: authorize,
        );
      // case APIType.getUser:
      //   return RequestOptions(
      //     path: 'user?\$include=customers,roles,permissions',
      //     method: APIMethod.get,
      //     extra: authorize,
      //   );

      default:
        return null;
    }
  }
}

// ignore: one_member_abstracts
abstract class APIRouteConfigurable {
  RequestOptions? getConfig();
}

class APIMethod {
  static const get = 'GET';
  static const post = 'POST';
  static const put = 'PUT';
  static const patch = 'PATCH';
  static const delete = 'DELETE';
}
