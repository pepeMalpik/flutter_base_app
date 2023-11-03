import 'package:flutter_base_app/features/features.dart';

abstract class OrdersRepository {
  Future<Order?> create({required Order order});
  Future<List<Order?>> get();
  Future<Order?> update({required Order order});
  Future<Order?> delete({required Order order});
}
