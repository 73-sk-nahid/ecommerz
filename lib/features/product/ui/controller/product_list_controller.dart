import 'package:ecommerz/app/urls.dart';
import 'package:ecommerz/features/common/ui/controllers/auth_controller.dart';
import 'package:ecommerz/features/product/data/model/product_model.dart';
import 'package:ecommerz/features/product/data/model/product_pagination_model.dart';
import 'package:ecommerz/serivces/network_caller/network_caller.dart';
import 'package:get/get.dart';

class ProductListController extends GetxController{
  bool _inProgress = false;
  bool get inProgress => _inProgress;
  bool get initialInProgress => _page == 1 && inProgress;
  final List<ProductModel> _productList = [];
  List<ProductModel> get productList => _productList;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;
  final int _count = 30;
  int _page = 0;
  int? _lastPage;

  Future<bool> getProductList() async {
    _page++;
    if(_lastPage != null && _page > _lastPage!) return false;
    bool isSuccess = false;
    _inProgress = true;
    update();
    Map<String, dynamic> queryParams = {
      'count' : _count,
      'page' : _page
    };

    String? accessToken = await Get.find<AuthController>().getUserData();
    print(accessToken);
    final NetworkResponse response =
    await Get.find<NetworkCaller>().getRequest(Urls.productsUrl, queryParams: queryParams, accessToken: accessToken);
    if (response.isSuccess) {
      print(response.responseData);
      ProductsPaginationModel paginationModel = ProductsPaginationModel.fromJson(response.responseData);
      _productList.addAll(paginationModel.data?.results ?? []);
      if(paginationModel.data?.lastPage != null) {
        _lastPage = paginationModel.data!.lastPage!;
      }
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}