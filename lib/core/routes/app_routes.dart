import 'package:flutter_base_app/core/core.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_base_app/features/features.dart';

final appRoutes = [
  GoRoute(
    path: RouteLocation.login,
    parentNavigatorKey: navigationKey,
    builder: LoginScreen.builder,
  ),
  GoRoute(
    path: RouteLocation.home,
    parentNavigatorKey: navigationKey,
    builder: HomeScreen.builder,
  ),
  GoRoute(
    path: RouteLocation.orders,
    parentNavigatorKey: navigationKey,
    builder: OrdersScreen.builder,
  ),
  GoRoute(
    path: RouteLocation.createTask,
    parentNavigatorKey: navigationKey,
    builder: LoginScreen.builder,
  ),
];
