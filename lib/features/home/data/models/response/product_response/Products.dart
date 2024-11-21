

class Products {
  Products({ this.id,
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

      });

  Products.fromJson(dynamic json) {
    id = json['_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    imgCover = json['imgCover'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    price = json['price'];
    priceAfterDiscount = json['priceAfterDiscount'];
    quantity = json['quantity'];
    category = json['category'];
    occasion = json['occasion'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    id = json['id'];
  }
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
  String? createdAt;
  String? updatedAt;
  int? v;

Products copyWith({  String? id,
  String? title,
  String? slug,
  String? description,
  String? imgCover,
  List<String>? images,
  int? price,
  int? priceAfterDiscount,
  int? quantity,
  String? category,
  String? occasion,
  String? createdAt,
  String? updatedAt,
  int? v,

}) => Products(  id: id ?? this.id,
  title: title ?? this.title,
  slug: slug ?? this.slug,
  description: description ?? this.description,
  imgCover: imgCover ?? this.imgCover,
  images: images ?? this.images,
  price: price ?? this.price,
  priceAfterDiscount: priceAfterDiscount ?? this.priceAfterDiscount,
  quantity: quantity ?? this.quantity,
  category: category ?? this.category,
  occasion: occasion ?? this.occasion,
  createdAt: createdAt ?? this.createdAt,
  updatedAt: updatedAt ?? this.updatedAt,
  v: v ?? this.v,

);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['title'] = title;
    map['slug'] = slug;
    map['description'] = description;
    map['imgCover'] = imgCover;
    map['images'] = images;
    map['price'] = price;
    map['priceAfterDiscount'] = priceAfterDiscount;
    map['quantity'] = quantity;
    map['category'] = category;
    map['occasion'] = occasion;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    map['id'] = id;
    return map;
  }

}