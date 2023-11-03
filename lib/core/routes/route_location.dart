import 'package:flutter/foundation.dart' show immutable;

@immutable
class RouteLocation {
  const RouteLocation._();

  static String get login => '/login';
  static String get home => '/home';
  static String get orders => '/orders';
  static String get createTask => '/createTask';
}
