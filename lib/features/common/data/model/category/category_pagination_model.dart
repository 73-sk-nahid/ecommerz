import 'package:ecommerz/features/common/data/model/category/category_item_model.dart';

class CategoryPaginationModel {
  int? code;
  String? status;
  String? msg;
  PaginationData? data;

  CategoryPaginationModel({this.code, this.status, this.msg, this.data});

  CategoryPaginationModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? PaginationData.fromJson(json['data']) : null;
  }
}

class PaginationData {
  List<CategoryItemModel>? results;
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
      results = <CategoryItemModel>[];
      json['results'].forEach((v) {
        results!.add(CategoryItemModel.fromJson(v));
      });
    }
    total = json['total'];
    firstPage = json['first_page'];
    previous = json['previous'];
    next = json['next'];
    lastPage = json['last_page'];
  }
}
