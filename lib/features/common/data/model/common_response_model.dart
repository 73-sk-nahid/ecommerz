// import 'package:ecommerz/features/home/data/models/slider_list_data_model.dart';
//
// class PaginationCommonResponseModel{
//   int? code;
//   String? status;
//   String? msg;
//   PaginationModel? data;
//
//   PaginationCommonResponseModel({this.code, this.status, this.msg, this.data});
//
//   PaginationCommonResponseModel.fromJson(Map<String, dynamic> json) {
//     code = json['code'];
//     status = json['status'];
//     msg = json['msg'];
//     data = json['data'] != null ? PaginationModel.fromJson(json['data']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['code'] = code;
//     data['status'] = status;
//     data['msg'] = msg;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     return data;
//   }
// }