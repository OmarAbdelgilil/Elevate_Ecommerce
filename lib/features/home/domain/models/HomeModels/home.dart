import 'best_seller.dart';
import 'occasion.dart';
import 'product.dart';

class Home {
  List<ProductModel>? products;
  List<BestSellerModel>? bestSeller;
  List<OccasionModel>? occasions;

  Home({
    this.products,
    this.bestSeller,
    this.occasions,
  });
}
