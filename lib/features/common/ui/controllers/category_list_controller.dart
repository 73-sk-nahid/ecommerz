import 'package:ecommerz/app/urls.dart';
import 'package:ecommerz/features/common/data/model/category_list_model.dart';
import 'package:ecommerz/features/common/data/model/category_model.dart';
import 'package:ecommerz/serivces/network_caller/network_caller.dart';
import 'package:get/get.dart';


class CategoryListController extends GetxController{
  bool _inProgress = false;
  bool get inProgress => _inProgress;
  CategoryListModel? _categoryListModel;
  List<CategoryModel>? get catagoryList => _categoryListModel?.categoryList ?? [];
  String? _errorMessage;
  String? get errorMessage => _errorMessage;


  Future<bool> getCategoryList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response =
    await Get.find<NetworkCaller>().getRequest(Urls.categoryList);
    if (response.isSuccess) {
      _categoryListModel = CategoryListModel.fromJson(response.responseData);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }

}