import 'package:ecommerz/features/product/data/model/product_model.dart';

class ProductsPaginationModel {
  int? code;
  String? status;
  String? msg;
  PaginationData? data;

  ProductsPaginationModel({this.code, this.status, this.msg, this.data});

  ProductsPaginationModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? PaginationData.fromJson(json['data']) : null;
  }
}

class PaginationData {
  List<ProductModel>? results;
  int? total;
  int? firstPage;
  int? previous;
  int? next;
  int? lastPage;

  PaginationData({this.results,
    this.total,
    this.firstPage,
    this.previous,
    this.next,
    this.lastPage});

  PaginationData.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <ProductModel>[];
      json['results'].forEach((v) {
        results!.add(ProductModel.fromJson(v));
      });
    }
    total = json['total'];
    firstPage = json['first_page'];
    previous = json['previous'];
    next = json['next'];
    lastPage = json['last_page'];
  }
}
//
// class Categories {
//   String? sId;
//   String? title;
//   String? slug;
//   String? icon;
//
//   Categories({this.sId, this.title, this.slug, this.icon});
//
//   Categories.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     title = json['title'];
//     slug = json['slug'];
//     icon = json['icon'];
//   }
// }
