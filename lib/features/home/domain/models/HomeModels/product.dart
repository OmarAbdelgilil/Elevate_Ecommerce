class ProductModel {
  String? id;
  String? title;
  String? slug;
  String? description;
  String? imgCover;
  List<dynamic>? images;
  int? price;
  int? priceAfterDiscount;
  int? quantity;
  String? category;
  String? occasion;

  int? v;
  String? id2;

  ProductModel({
    this.id,
    this.title,
    this.slug,
    this.description,
    this.imgCover,
    this.images,
    this.price,
    this.priceAfterDiscount,
    this.quantity,
    this.category,
    this.occasion,
    this.v,
    this.id2,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['_id'] as String?,
        title: json['title'] as String?,
        slug: json['slug'] as String?,
        description: json['description'] as String?,
        imgCover: json['imgCover'] as String?,
        images: json['images'],
        price: json['price'] as int?,
        priceAfterDiscount: json['priceAfterDiscount'] as int?,
        quantity: json['quantity'] as int?,
        category: json['category'] as String?,
        occasion: json['occasion'] as String?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'title': title,
        'slug': slug,
        'description': description,
        'imgCover': imgCover,
        'images': images,
        'price': price,
        'priceAfterDiscount': priceAfterDiscount,
        'quantity': quantity,
        'category': category,
        'occasion': occasion,
        '__v': v,
        'id': id,
      };
}
