import 'package:ecommerz/features/common/data/model/category/category_pagination_model.dart';

class ProductModel {
  String? sId;
  String? title;
  List<CategoryItemModel>? categories;
  String? slug;
  Null? metaDescription;
  String? description;
  List<Null>? photos;
  List<Null>? colors;
  List<Null>? sizes;
  List<Null>? tags;
  int? regularPrice;
  int? currentPrice;
  int? quantity;
  String? createdAt;
  String? updatedAt;
  bool? inCart;
  bool? inWishlist;

  ProductModel(
      {this.sId,
        this.title,
        this.categories,
        this.slug,
        this.metaDescription,
        this.description,
        this.photos,
        this.colors,
        this.sizes,
        this.tags,
        this.regularPrice,
        this.currentPrice,
        this.quantity,
        this.createdAt,
        this.updatedAt,
        this.inCart,
        this.inWishlist});

  ProductModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    if (json['categories'] != null) {
      categories = <CategoryItemModel>[];
      json['categories'].forEach((v) {
        categories!.add(CategoryItemModel.fromJson(v));
      });
    }
    slug = json['slug'];
    metaDescription = json['meta_description'];
    description = json['description'];
    if (json['photos'] != null) {
      photos = <Null>[];
      json['photos'].forEach((v) {
        // todo: have to create a model with photos, colors, sizes, tags for using here if thats values is null
        photos!.add(Null.fromJson(v));
      });
    }
    if (json['colors'] != null) {
      colors = <Null>[];
      json['colors'].forEach((v) {
        colors!.add(Null.fromJson(v));
      });
    }
    if (json['sizes'] != null) {
      sizes = <Null>[];
      json['sizes'].forEach((v) {
        sizes!.add(Null.fromJson(v));
      });
    }
    if (json['tags'] != null) {
      tags = <Null>[];
      json['tags'].forEach((v) {
        tags!.add(Null.fromJson(v));
      });
    }
    regularPrice = json['regular_price'];
    currentPrice = json['current_price'];
    quantity = json['quantity'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    inCart = json['in_cart'];
    inWishlist = json['in_wishlist'];
  }
}