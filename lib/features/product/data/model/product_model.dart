import 'package:ecommerz/features/common/data/model/category/category_item_model.dart';

class ProductModel {
  String? sId;
  String? title;
  List<CategoryItemModel>? categories;
  String? slug;
  Null? metaDescription;
  String? description;
  List<String>? photos;
  List<String>? colors;
  List<String>? sizes;
  List<String>? tags;
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
    //sId = json['_id'];
    sId = json['_id'] is Set ? (json['_id'] as Set).first : json['_id'].toString();
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

    // if (json['photos'] != null) {
    //   photos = <Null>[];
    //   json['photos'].forEach((v) {
    //     // todo: have to create a model with photos, colors, sizes, tags for using here if thats values is null
    //     photos!.add(Null.fromJson(v));
    //   });
    // }
    photos = (json['photos'] != null && json['photos'] is List) ? List<String>.from(json['photos']) : getDefaultList('photos');
    colors = (json['colors'] != null && json['colors'] is List) ? List<String>.from(json['colors']) : getDefaultList('colors');
    sizes = (json['sizes'] != null && json['sizes'] is List) ? List<String>.from(json['sizes']) : getDefaultList('sizes');
    tags = (json['tags'] != null && json['tags'] is List) ? List<String>.from(json['tags']) : getDefaultList('tags');


    // if (json['colors'] != null) {
    //   colors = <Null>[];
    //   json['colors'].forEach((v) {
    //     colors!.add(Null.fromJson(v));
    //   });
    // }
    // if (json['sizes'] != null) {
    //   sizes = <Null>[];
    //   json['sizes'].forEach((v) {
    //     sizes!.add(Null.fromJson(v));
    //   });
    // }
    // if (json['tags'] != null) {
    //   tags = <Null>[];
    //   json['tags'].forEach((v) {
    //     tags!.add(Null.fromJson(v));
    //   });
    // }
    regularPrice = json['regular_price'];
    currentPrice = json['current_price'];
    quantity = json['quantity'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    inCart = json['in_cart'];
    inWishlist = json['in_wishlist'];
  }

  static List<String> getDefaultList(String key) {
    Map<String, List<String>> defaults = {
      "tags": ["New", "Trending", "Popular"],
      "sizes": ["S", "M", "L", "XL"],
      "colors": ["Red", "Blue", "Green"],
      "photos": ["assets/images/nike_shoe.png"]
    };
    return defaults[key] ?? [];
  }
}