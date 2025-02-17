import 'package:ecommerz/features/common/data/model/category_model.dart';
class CategoryListModel {
  String? msg;
  CategoryModel? categoryList;

  CategoryListModel({this.msg, this.categoryList});

  CategoryListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    categoryList = json['data'] != null ? CategoryModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (categoryList != null) {
      data['data'] = categoryList!.toJson();
    }
    return data;
  }
}

