class CategoryModel {
  String? sId;
  String? title;
  String? icon;
  String? createdAt;
  String? updatedAt;

  CategoryModel(
      {this.sId,
        this.title,
        this.icon,
        this.createdAt,
        this.updatedAt});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    icon = json['icon'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['icon'] = icon;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}