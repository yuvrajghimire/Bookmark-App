class UrlModel {
  String? url;
  String? title;
  String? description;
  String? category;
  String? date;
  String? color;
  bool? favorite;

  UrlModel(
      {this.url,
      this.title,
      this.description,
      this.category,
      this.date,
      this.color,
      this.favorite});

  UrlModel.fromJson(Map<String, dynamic> json) {
    url = json["url"];
    title = json["title"];
    description = json["description"];
    category = json["category"];
    date = json["date"];
    color = json["color"];
    favorite = json["favorite"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["url"] = url;
    data["title"] = title;
    data["description"] = description;
    data["category"] = category;
    data["date"] = date;
    data["color"] = color;
    data["favorite"] = favorite;
    return data;
  }
}
