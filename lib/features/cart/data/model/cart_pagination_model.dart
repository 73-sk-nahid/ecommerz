import 'package:ecommerz/features/cart/data/model/cart_list_product_model.dart';

class CartPaginationModel {
  int? code;
  String? status;
  String? msg;
  PaginationData? data;

  CartPaginationModel({this.code, this.status, this.msg, this.data});

  CartPaginationModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? PaginationData.fromJson(json['data']) : null;
  }
}

class PaginationData {
  List<CartListModel>? results;
  int? total;
  int? firstPage;
  int? previous;
  int? next;
  int? lastPage;

  PaginationData(
      {this.results,
        this.total,
        this.firstPage,
        this.previous,
        this.next,
        this.lastPage});

  PaginationData.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <CartListModel>[];
      json['results'].forEach((v) {
        results!.add(CartListModel.fromJson(v));
      });
    }
    total = json['total'];
    firstPage = json['first_page'];
    previous = json['previous'];
    next = json['next'];
    lastPage = json['last_page'];
  }
}

class CartListModel {
  String? sId;
  CartProductModel? product;
  String? user;
  int? quantity;
  Null? color;
  Null? size;
  String? createdAt;
  String? updatedAt;
  int? iV;

  CartListModel(
      {this.sId,
        this.product,
        this.user,
        this.quantity,
        this.color,
        this.size,
        this.createdAt,
        this.updatedAt,
        this.iV});

  CartListModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    product =
    json['product'] != null ? CartProductModel.fromJson(json['product']) : null;
    user = json['user'];
    quantity = json['quantity'];
    color = json['color'];
    size = json['size'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }
}
