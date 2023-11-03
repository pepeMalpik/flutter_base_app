import 'package:flutter_base_app/core/core.dart';
import 'package:flutter_base_app/features/features.dart';

class OrderModel extends Order implements Decodable<OrderModel> {
  OrderModel({
    super.id,
    super.customerId,
    super.orderStatusId,
    super.total,
    super.createdBy,
    super.folio,
    super.paymentType,
    super.comment,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        id: json["id"],
        customerId: json["customerId"],
        orderStatusId: json["orderStatusId"],
        total: json["total"],
        createdBy: json["createdBy"],
        folio: json["folio"],
        paymentType: json["paymentType"],
        comment: json["comment"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "customerId": customerId,
        "orderStatusId": orderStatusId,
        "total": total,
        "createdBy": createdBy,
        "folio": folio,
        "paymentType": paymentType,
        "comment": comment,
      };

  @override
  OrderModel decode(data) {
    id = data["id"];
    customerId = data["customerId"];
    orderStatusId = data["orderStatusId"];
    total = data["total"];
    createdBy = data["createdBy"];
    folio = data["folio"];
    paymentType = data["paymentType"];
    comment = data["comment"];
    return this;
  }
}
