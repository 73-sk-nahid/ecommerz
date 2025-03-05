class ProductDetailsModel {
  int? code;
  String? status;
  String? msg;
  ProductDetails? data;

  ProductDetailsModel({this.code, this.status, this.msg, this.data});

  ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? new ProductDetails.fromJson(json['data']) : null;
  }
}

class ProductDetails {
  String? sId;
  String? title;
  Brand? brand;
  // List<Categories>? categories;
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

  ProductDetails(
      {this.sId,
        this.title,
        this.brand,
        // this.categories,
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

  ProductDetails.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    brand = json['brand'] != null ? new Brand.fromJson(json['brand']) : null;
    // if (json['categories'] != null) {
    //   categories = <Categories>[];
    //   json['categories'].forEach((v) {
    //     categories!.add(new Categories.fromJson(v));
    //   });
    // }
    slug = json['slug'];
    metaDescription = json['meta_description'];
    description = json['description'];
    photos = json['photos'].cast<String>();
    // if (json['colors'] != null) {
    //   colors = <Null>[];
    //   json['colors'].forEach((v) {
    //     colors!.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['sizes'] != null) {
    //   sizes = <Null>[];
    //   json['sizes'].forEach((v) {
    //     sizes!.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['tags'] != null) {
    //   tags = <Null>[];
    //   json['tags'].forEach((v) {
    //     tags!.add(new Null.fromJson(v));
    //   });
    // }
    // photos = (json['photos'] != null && json['photos'] is List) ? List<String>.from(json['photos']) : getDefaultList('photos');
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
      "photos": ["assets/images/nike_shoe.png"]
    };
    return defaults[key] ?? [];
  }
}

class Brand {
  String? sId;
  String? title;
  String? slug;
  String? icon;

  Brand({this.sId, this.title, this.slug, this.icon});

  Brand.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    slug = json['slug'];
    icon = json['icon'];
  }
}
