import 'package:elevate_ecommerce/features/home/domain/models/product_model.dart';

import 'occasion.dart';
import 'product.dart';

class Home {
  List<ProductModel>? products;
  List<ProductsModel>? bestSeller;
  List<OccasionModel>? occasions;

  Home({
    this.products,
    this.bestSeller,
    this.occasions,
  });
}
