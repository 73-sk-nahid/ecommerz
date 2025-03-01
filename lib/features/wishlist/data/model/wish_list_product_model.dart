

class WishListProductModel {
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

  WishListProductModel(
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

  WishListProductModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    brand = json['brand'];
    categories = json['categories'].cast<String>();
    slug = json['slug'];
    metaDescription = json['meta_description'];
    description = json['description'];

    photos = (json['photos'] != null && json['photos'] is List) ? List<String>.from(json['photos']) : getDefaultList('photos');
    colors = (json['colors'] != null && json['colors'] is List) ? List<String>.from(json['colors']) : getDefaultList('colors');
    sizes = (json['sizes'] != null && json['sizes'] is List) ? List<String>.from(json['sizes']) : getDefaultList('sizes');
    tags = (json['tags'] != null && json['tags'] is List) ? List<String>.from(json['tags']) : getDefaultList('tags');

    // if (json['photos'] != null) {
    //   photos = <Null>[];
    //   json['photos'].forEach((v) {
    //     photos!.add(new Null.fromJson(v));
    //   });
    // }
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