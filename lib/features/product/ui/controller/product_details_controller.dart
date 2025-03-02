import 'package:ecommerz/app/urls.dart';
import 'package:ecommerz/features/product/data/model/product_details_model.dart';
import 'package:ecommerz/serivces/network_caller/network_caller.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;
  ProductDetailsModel? _productDetailsModel;
  ProductDetails? get productDetails => _productDetailsModel?.data;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> getProductDetails(String productId) async{
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(Urls.productDetailsUrl(productId));
    if(response.isSuccess) {
      _productDetailsModel = ProductDetailsModel.fromJson(response.responseData);
      isSuccess = true;
    }
    else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}