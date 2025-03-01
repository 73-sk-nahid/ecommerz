import 'package:ecommerz/features/wishlist/data/model/wish_list_product_model.dart';

class WishListPaginationModel {
  int? code;
  String? status;
  String? msg;
  PaginationData? data;

  WishListPaginationModel({this.code, this.status, this.msg, this.data});

  WishListPaginationModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? PaginationData.fromJson(json['data']) : null;
  }
}

class PaginationData {
  List<WishListModel>? results;
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
      results = <WishListModel>[];
      json['results'].forEach((v) {
        results!.add(WishListModel.fromJson(v));
      });
    }
    total = json['total'];
    firstPage = json['first_page'];
    previous = json['previous'];
    next = json['next'];
    lastPage = json['last_page'];
  }
}

class WishListModel {
  String? sId;
  WishListProductModel? product;
  String? user;
  String? createdAt;
  String? updatedAt;
  int? iV;

  WishListModel(
      {this.sId,
        this.product,
        this.user,
        this.createdAt,
        this.updatedAt,
        this.iV});

  WishListModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    product =
    json['product'] != null ? WishListProductModel.fromJson(json['product']) : null;
    user = json['user'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }
}
