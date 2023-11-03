import 'package:flutter_base_app/core/core.dart';
import 'package:flutter_base_app/features/orders/orders.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrdersDatasourceImpl implements OrdersDatasource {
  @override
  Future<Order?> create({required Order order}) async {
    final result = await httpClient!.request(
      route: APIRoute(
        APIType.orderCreate,
      ),
      create: () => APIResponse<OrderModel>(
        create: () => OrderModel(),
      ),
      data: {
        "customer_id": 1,
        "order_status_id": 1,
        "payment_type": 2,
        "products": [
          {"id": 1, "quantity": 10}
        ]
      },
    );
  }

  @override
  Future<Order?> delete({required Order order}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<Order?>> get() {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<Order?> update({required Order order}) {
    // TODO: implement update
    throw UnimplementedError();
  }
}

final ordersDatasourceImpl = Provider<OrdersDatasource>((ref) {
  return OrdersDatasourceImpl();
});
