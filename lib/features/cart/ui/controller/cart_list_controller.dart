import 'package:ecommerz/app/urls.dart';
import 'package:ecommerz/features/cart/data/model/cart_list_product_model.dart';
import 'package:ecommerz/features/cart/data/model/cart_pagination_model.dart';
import 'package:ecommerz/features/common/ui/controllers/auth_controller.dart';
import 'package:ecommerz/serivces/network_caller/network_caller.dart';
import 'package:get/get.dart';

class CartListController extends GetxController{
  bool _inProgress = false;
  bool get inProgress => _inProgress;
  bool get initialInProgress => _page == 1 && inProgress;
  final List<CartProductModel> _cartList = [];
  List<CartProductModel> get cartList => _cartList;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;
  final int _count = 30;
  int _page = 0;
  int? _lastPage;

  Future<bool> getCartList() async {
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
    await Get.find<NetworkCaller>().getRequest(Urls.cartListUrl, queryParams: queryParams, accessToken: accessToken);
    if (response.isSuccess) {
      CartPaginationModel paginationModel = CartPaginationModel.fromJson(response.responseData);
      if (paginationModel.data?.results != null) {
        _cartList.addAll(paginationModel.data!.results!
            .map((cartListItem) => cartListItem.product)
            .whereType<CartProductModel>() // Filters out null products
            .toList());
      }
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

  Future<bool> refreshCartList() async{
    _page = 0;
    _lastPage = null;
    _cartList.clear();
    return getCartList();
  }
}