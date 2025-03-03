import 'package:ecommerz/app/urls.dart';
import 'package:ecommerz/features/common/ui/controllers/auth_controller.dart';
import 'package:ecommerz/features/product/data/model/review_pagination_model.dart';
import 'package:ecommerz/serivces/network_caller/network_caller.dart';
import 'package:get/get.dart';

class ReviewListController extends GetxController{
  bool _inProgress = false;
  bool get inProgress => _inProgress;
  bool get initialInProgress => _page == 1 && inProgress;
  final List<ReviewDataModel> _reviewList = [];
  List<ReviewDataModel> get reviewList => _reviewList;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;
  final int _count = 10;
  int _page = 0;
  int? _lastPage;

  Future<bool> getReviewList(String productId) async {
    _page++;
    if(_lastPage != null && _page > _lastPage!) return false;
    bool isSuccess = false;
    _inProgress = true;
    update();
    Map<String, dynamic> queryParams = {
      'count' : _count,
      'page' : _page,
      'product' : productId
    };

    String? accessToken = await Get.find<AuthController>().getUserData();
    print(accessToken);
    final NetworkResponse response =
    await Get.find<NetworkCaller>().getRequest(Urls.reviewUrl, queryParams: queryParams, accessToken: accessToken);
    if (response.isSuccess) {
      print(response.responseData);
      ProductReviewPaginationModel paginationModel = ProductReviewPaginationModel.fromJson(response.responseData);
      _reviewList.addAll(paginationModel.data?.results ?? []);
      // final List<Product> productList = paginationModel.data?.results
      //     ?.map((reviewListItem) => reviewListItem.product!)
      //     .whereType<Product>()
      //     .toList() ?? [];

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

  Future<bool> refreshReviewList(String productId) async{
    _page = 0;
    _lastPage = null;
    _reviewList.clear();
    return getReviewList(productId);
  }
}