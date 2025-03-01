
class CategoryItemModel {
  String? sId;
  String? title;
  String? slug;
  String? description;
  String? icon;
  Null? parent;
  String? createdAt;
  String? updatedAt;
  int? iV;

  CategoryItemModel(
      {this.sId,
        this.title,
        this.slug,
        this.description,
        this.icon,
        this.parent,
        this.createdAt,
        this.updatedAt,
        this.iV});

  CategoryItemModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    icon = json['icon'];
    parent = json['parent'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }
}