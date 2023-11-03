abstract class Order {
  int? id;
  int? customerId;
  int? orderStatusId;
  int? total;
  int? createdBy;
  String? folio;
  String? paymentType;
  String? comment;

  Order({
    this.id,
    this.customerId,
    this.orderStatusId,
    this.total,
    this.createdBy,
    this.folio,
    this.paymentType,
    this.comment,
  });
}
