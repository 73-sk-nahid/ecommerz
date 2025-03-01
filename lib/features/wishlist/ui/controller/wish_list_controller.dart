import 'package:ecommerz/app/urls.dart';
import 'package:ecommerz/features/common/ui/controllers/auth_controller.dart';
import 'package:ecommerz/features/wishlist/data/model/wish_list_product_model.dart';
import 'package:ecommerz/features/wishlist/data/model/wishlist_pagination_model.dart';
import 'package:ecommerz/serivces/network_caller/network_caller.dart';
import 'package:get/get.dart';

class WishListController extends GetxController{
  bool _inProgress = false;
  bool get inProgress => _inProgress;
  bool get initialInProgress => _page == 1 && inProgress;
  final List<WishListProductModel> _wishList = [];
  List<WishListProductModel> get wishList => _wishList;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;
  final int _count = 30;
  int _page = 0;
  int? _lastPage;

  Future<bool> getWishList() async {
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
    await Get.find<NetworkCaller>().getRequest(Urls.wishListUrl, queryParams: queryParams, accessToken: accessToken);
    if (response.isSuccess) {
      WishListPaginationModel paginationModel = WishListPaginationModel.fromJson(response.responseData);
      if (paginationModel.data?.results != null) {
        _wishList.addAll(paginationModel.data!.results!
            .map((wishListItem) => wishListItem.product)
            .whereType<WishListProductModel>() // Filters out null products
            .toList());
      }
      //_wishList.addAll(paginationModel.data.results. ?? []);
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