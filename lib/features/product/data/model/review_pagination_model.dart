class ProductReviewPaginationModel {
  int? code;
  String? status;
  String? msg;
  PaginationData? data;

  ProductReviewPaginationModel({this.code, this.status, this.msg, this.data});

  ProductReviewPaginationModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? PaginationData.fromJson(json['data']) : null;
  }
}

class PaginationData {
  List<ReviewDataModel>? results;
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
      results = <ReviewDataModel>[];
      json['results'].forEach((v) {
        results!.add(ReviewDataModel.fromJson(v));
      });
    }
    total = json['total'];
    firstPage = json['first_page'];
    previous = json['previous'];
    next = json['next'];
    lastPage = json['last_page'];
  }
}

class ReviewDataModel {
  String? sId;
  Product? product;
  User? user;
  double? rating;
  String? comment;
  String? createdAt;
  String? updatedAt;
  int? iV;

  ReviewDataModel(
      {this.sId,
        this.product,
        this.user,
        this.rating,
        this.comment,
        this.createdAt,
        this.updatedAt,
        this.iV});

  ReviewDataModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    product =
    json['product'] != null ? Product.fromJson(json['product']) : null;
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    rating = json['rating'];
    comment = json['comment'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }
}

class Product {
  String? sId;
  String? title;
  String? slug;
  List<String>? photos;

  Product({this.sId, this.title, this.slug, this.photos});

  Product.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    slug = json['slug'];
    photos = json['photos'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['slug'] = slug;
    data['photos'] = photos;
    return data;
  }
}

class User {
  String? sId;
  String? firstName;
  String? lastName;
  String? avatarUrl;

  User({this.sId, this.firstName, this.lastName, this.avatarUrl});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatarUrl = json['avatar_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['avatar_url'] = avatarUrl;
    return data;
  }
}
