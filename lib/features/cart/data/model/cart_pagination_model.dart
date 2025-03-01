class CartPaginationModel {
  int? code;
  String? status;
  String? msg;
  PaginationData? data;

  CartPaginationModel({this.code, this.status, this.msg, this.data});

  CartPaginationModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? PaginationData.fromJson(json['data']) : null;
  }
}

class PaginationData {
  List<CartListModel>? results;
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
      results = <CartListModel>[];
      json['results'].forEach((v) {
        results!.add(CartListModel.fromJson(v));
      });
    }
    total = json['total'];
    firstPage = json['first_page'];
    previous = json['previous'];
    next = json['next'];
    lastPage = json['last_page'];
  }
}

class CartListModel {
  String? sId;
  Product? product;
  String? user;
  int? quantity;
  Null? color;
  Null? size;
  String? createdAt;
  String? updatedAt;
  int? iV;

  CartListModel(
      {this.sId,
        this.product,
        this.user,
        this.quantity,
        this.color,
        this.size,
        this.createdAt,
        this.updatedAt,
        this.iV});

  CartListModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    product =
    json['product'] != null ? Product.fromJson(json['product']) : null;
    user = json['user'];
    quantity = json['quantity'];
    color = json['color'];
    size = json['size'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }
}

class Product {
  String? sId;
  String? title;
  String? brand;
  List<String>? categories;
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
  int? iV;

  Product(
      {this.sId,
        this.title,
        this.brand,
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
        this.iV});

  Product.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    brand = json['brand'];
    categories = json['categories'].cast<String>();
    slug = json['slug'];
    metaDescription = json['meta_description'];
    description = json['description'];

    // if (json['photos'] != null) {
    //   photos = <Null>[];
    //   json['photos'].forEach((v) {
    //     photos!.add(Null.fromJson(v));
    //   });
    // }
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
    photos = (json['photos'] != null && json['photos'] is List) ? List<String>.from(json['photos']) : getDefaultList('photos');
    colors = (json['colors'] != null && json['colors'] is List) ? List<String>.from(json['colors']) : getDefaultList('colors');
    sizes = (json['sizes'] != null && json['sizes'] is List) ? List<String>.from(json['sizes']) : getDefaultList('sizes');
    tags = (json['tags'] != null && json['tags'] is List) ? List<String>.from(json['tags']) : getDefaultList('tags');

    regularPrice = json['regular_price'];
    currentPrice = json['current_price'];
    quantity = json['quantity'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  static List<String> getDefaultList(String key) {
    Map<String, List<String>> defaults = {
      "tags": ["New", "Trending", "Popular"],
      "sizes": ["S", "M", "L", "XL"],
      "colors": ["Red", "Blue", "Green"],
      "photos": ["https://pngimg.com/d/free_PNG90740.png"]
    };
    return defaults[key] ?? [];
  }

}
