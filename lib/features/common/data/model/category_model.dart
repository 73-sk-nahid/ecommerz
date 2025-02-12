
class CategoryModel {
  String? sId;
  String? title;
  String? slug;
  String? description;
  String? icon;
  String? createdAt;
  String? updatedAt;

  CategoryModel(
      {this.sId,
        this.title,
        this.slug,
        this.description,
        this.icon,
        this.createdAt,
        this.updatedAt});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    icon = json['icon'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['description'] = this.description;
    data['icon'] = this.icon;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
