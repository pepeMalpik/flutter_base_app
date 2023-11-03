import 'package:flutter_base_app/features/features.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrdersRepositoryImpl implements OrdersRepository {
  OrdersDatasource _datasource;

  OrdersRepositoryImpl({required OrdersDatasource datasource})
      : _datasource = datasource;

  @override
  Future<Order?> create({required Order order}) async {
    try {
      return await _datasource.create(order: order);
    } catch (e) {
      throw '$e';
    }
  }

  @override
  Future<Order?> delete({required Order order}) async {
    try {
      return await _datasource.delete(order: order);
    } catch (e) {
      throw '$e';
    }
  }

  @override
  Future<List<Order?>> get() async {
    try {
      return await _datasource.get();
    } catch (e) {
      throw '$e';
    }
  }

  @override
  Future<Order?> update({required Order order}) async {
    try {
      return await _datasource.update(order: order);
    } catch (e) {
      throw '$e';
    }
  }
}

final ordersRepositoryProvider = Provider<OrdersRepositoryImpl>((ref) {
  final datasource = ref.read(ordersDatasourceImpl);
  return OrdersRepositoryImpl(datasource: datasource);
});
