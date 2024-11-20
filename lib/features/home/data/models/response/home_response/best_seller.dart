class BestSeller {
  String? id;
  String? title;
  String? slug;
  String? description;
  String? imgCover;
  List<String>? images;
  int? price;
  int? priceAfterDiscount;
  int? quantity;
  String? category;
  String? occasion;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? id2;

  BestSeller({
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
    this.createdAt,
    this.updatedAt,
    this.v,
    this.id2,
  });

  factory BestSeller.fromJson(Map<String, dynamic> json) => BestSeller(
        id: json['_id'] as String?,
        title: json['title'] as String?,
        slug: json['slug'] as String?,
        description: json['description'] as String?,
        imgCover: json['imgCover'] as String?,
        images: json['images'] as List<String>?,
        price: json['price'] as int?,
        priceAfterDiscount: json['priceAfterDiscount'] as int?,
        quantity: json['quantity'] as int?,
        category: json['category'] as String?,
        occasion: json['occasion'] as String?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        v: json['__v'] as int?,
        id2: json['id'] as String?,
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
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
        'id': id,
      };
}
