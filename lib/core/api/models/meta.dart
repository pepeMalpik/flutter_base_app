// To parse this JSON data, do
//
//     final meta = metaFromJson(jsonString);

import 'dart:convert';

import 'package:meta/meta.dart';

Meta metaFromJson(String str) => Meta.fromJson(json.decode(str));

String metaToJson(Meta data) => json.encode(data.toJson());

class Meta {
  Meta({
    @required this.totalPages,
    @required this.totalItems,
    @required this.lastPage,
    @required this.total,
  });

  final int? totalPages;
  final int? totalItems;
  final int? lastPage;
  final int? total;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
      totalPages: json["totalPages"],
      totalItems: json["totalItems"],
      total: json["total"],
      lastPage: json["last_page"]);

  Map<String, dynamic> toJson() => {
        "totalPages": totalPages,
        "totalItems": totalItems,
        "last_page": lastPage,
        "total": total,
      };
}
