import 'package:ecommerz/features/home/data/models/slider_list_data_model.dart';

class SliderPaginationResponse {
  int? code;
  String? status;
  String? msg;
  SliderListDataModel? data;

  SliderPaginationResponse({this.code, this.status, this.msg, this.data});

  SliderPaginationResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? SliderListDataModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['status'] = status;
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
