import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OrdersScreen extends StatelessWidget {
  static OrdersScreen builder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const OrdersScreen();

  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('order'),
      ),
    );
  }
}
