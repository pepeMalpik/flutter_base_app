import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'api_response.dart';
import 'api_route.dart';
import 'decodable.dart';

// ignore: one_member_abstracts
abstract class BaseAPIClient {
  Future<ResponseWrapper<T>> request<T extends Decodable>({
    required APIRouteConfigurable route,
    required Create<T> create,
    dynamic data,
  });
}

class APIClient implements BaseAPIClient {
  final BaseOptions options;
  late Dio instance;

  APIClient(this.options) {
    instance = Dio(options);
  }

  @override
  Future<ResponseWrapper<T>> request<T extends Decodable>({
    required APIRouteConfigurable route,
    required Create<T> create,
    dynamic data,
  }) async {
    final config = route.getConfig();
    if (config == null) {
      throw ErrorResponse(message: 'Failed to load request options.');
    }
    config.baseUrl = options.baseUrl;
    if (data != null) {
      if (config.method == APIMethod.get) {
        config.queryParameters = data;
      } else {
        config.data = data;
      }
    }
    try {
      // const token =
      //     'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMzQuMjIyLjIxNi40OTo4MDYwL2FwaS9sb2dpbiIsImlhdCI6MTY5MDk5ODYxMywiZXhwIjoxNjk0MTc4NjEzLCJuYmYiOjE2OTA5OTg2MTMsImp0aSI6IjBveGtlTXpUYzE4ZENCcFciLCJzdWIiOiIxIiwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.DINSnG9c7moVcpqr8ot0bYGVDTmIboAQ_o44Iy3FDy0';
      // config.headers["Authorization"] = "Bearer $token";
      // config.headers["X-CSRF-TOKEN"] = "";
      // accept: application/json
      config.headers["Accept"] = "application/json";
      config.headers["Content-Type"] = "application/json";
      final response = await instance.fetch(config);
      return ResponseWrapper.init(create: create, data: response.data);
    } on DioException catch (err) {
      String msg = err.response?.data['message'] ?? '';
      if (msg.isEmpty) {
        msg = err.message ?? '';
      }
      throw ErrorResponse(message: msg);
    }
  }
}

//http://34.222.216.49:8060/api/product_category
//http://34.222.216.49:8060/api/product_category

APIClient? httpClient = APIClient(
  BaseOptions(
    baseUrl: dotenv.env['SERVER'] ?? '',
    followRedirects: false,
    validateStatus: (status) {
      return status! < 500;
    },
  ),
);
