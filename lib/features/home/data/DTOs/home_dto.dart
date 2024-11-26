import 'package:elevate_ecommerce/features/home/data/models/response/home_response/best_seller.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/home_response/occasion.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/home_response/product.dart';
import 'package:elevate_ecommerce/features/home/domain/models/HomeModels/best_seller.dart';
import 'package:elevate_ecommerce/features/home/domain/models/HomeModels/home.dart';
import 'package:elevate_ecommerce/features/home/domain/models/HomeModels/occasion.dart';
import 'package:elevate_ecommerce/features/home/domain/models/HomeModels/product.dart';
import 'package:elevate_ecommerce/features/home/domain/models/product_model.dart';

class HomeDto {
  List<Product> products;
  List<BestSeller> bestSellers;
  List<Occasion> occassions;
  HomeDto(
      {required this.bestSellers,
      required this.occassions,
      required this.products});
  toHome() {
    return Home(
        bestSeller: bestSellers
            .map((e) => ProductsModel(
                category: e.category,
                description: e.description,
                id: e.id,
                images: e.images!.map((i) => i.toString()).toList(),
                imgCover: e.imgCover,
                occasion: e.occasion,
                price: e.price,
                priceAfterDiscount: e.priceAfterDiscount,
                quantity: e.quantity,
                slug: e.slug,
                title: e.title,
                v: e.v))
            .toList(),
        occasions: occassions
            .map(
              (e) => OccasionModel(
                  id: e.id, image: e.image, name: e.name, slug: e.slug),
            )
            .toList(),
        products: products
            .map(
              (e) => ProductModel(
                  category: e.category,
                  description: e.description,
                  id2: e.id2,
                  id: e.id,
                  images: e.images,
                  imgCover: e.imgCover,
                  occasion: e.occasion,
                  price: e.price,
                  priceAfterDiscount: e.priceAfterDiscount,
                  quantity: e.quantity,
                  slug: e.slug,
                  title: e.title,
                  v: e.v),
            )
            .toList());
  }
}
