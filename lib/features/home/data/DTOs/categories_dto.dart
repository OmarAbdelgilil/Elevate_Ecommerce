import 'package:elevate_ecommerce/features/home/data/models/response/get_all_categories_response/category.dart';
import 'package:elevate_ecommerce/features/home/domain/models/categories.dart';
import 'package:elevate_ecommerce/features/home/domain/models/category.dart';

class CategoriesDto {
  List<Category> categories;
  CategoriesDto({required this.categories});
  toCategories() {
    return Categories(
        categories: categories
            .map(
              (e) => CategoryModel(
                  id: e.id, image: e.image, name: e.name, slug: e.slug),
            )
            .toList());
  }
}
