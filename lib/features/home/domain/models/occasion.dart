class OccasionModel {
  String? id;
  String? name;
  String? slug;
  String? image;

  OccasionModel({
    this.id,
    this.name,
    this.slug,
    this.image,
  });

  factory OccasionModel.fromJson(Map<String, dynamic> json) => OccasionModel(
        id: json['_id'] as String?,
        name: json['name'] as String?,
        slug: json['slug'] as String?,
        image: json['image'] as String?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'slug': slug,
        'image': image,
      };
}
