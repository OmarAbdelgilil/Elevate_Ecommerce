import 'package:elevate_ecommerce/features/home/data/models/response/get_all_occasions_response/occasion.dart';
import 'package:elevate_ecommerce/features/home/domain/models/occasion.dart';
import 'package:elevate_ecommerce/features/home/domain/models/occasions.dart';

class OccasionsDto {
  List<Occasion> occations;
  OccasionsDto({required this.occations});
  toOccasions() {
    return Occasions(
        occasions: occations
            .map(
              (e) => OccasionModel(
                  id: e.id, image: e.image, name: e.name, slug: e.slug),
            )
            .toList());
  }
}
