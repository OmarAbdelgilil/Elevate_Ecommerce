import 'best_seller.dart';
import 'occasion.dart';
import 'product.dart';

class HomeResponse {
  List<Product>? products;
  List<BestSeller>? bestSeller;
  List<Occasion>? occasions;

  HomeResponse({
    this.products,
    this.bestSeller,
    this.occasions,
  });

  factory HomeResponse.fromJson(Map<String, dynamic> json) => HomeResponse(
        products: (json['products'] as List<dynamic>?)
            ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
            .toList(),
        bestSeller: (json['bestSeller'] as List<dynamic>?)
            ?.map((e) => BestSeller.fromJson(e as Map<String, dynamic>))
            .toList(),
        occasions: (json['occasions'] as List<dynamic>?)
            ?.map((e) => Occasion.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'products': products?.map((e) => e.toJson()).toList(),
        'bestSeller': bestSeller?.map((e) => e.toJson()).toList(),
        'occasions': occasions?.map((e) => e.toJson()).toList(),
      };
}
