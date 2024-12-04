import 'package:elevate_ecommerce/features/home/data/models/response/get_all_categories_response/metadata.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/get_all_occasions_response/occasion.dart';

class GetAllOccasionsResponse {
  String? message;
  Metadata? metadata;
  List<Occasion>? occasions;

  GetAllOccasionsResponse({this.message, this.metadata, this.occasions});

  factory GetAllOccasionsResponse.fromJson(Map<String, dynamic> json) {
    return GetAllOccasionsResponse(
      message: json['message'] as String?,
      metadata: json['metadata'] == null
          ? null
          : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
      occasions: (json['occasions'] as List<dynamic>?)
          ?.map((e) => Occasion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'metadata': metadata?.toJson(),
        'occasions': occasions?.map((e) => e.toJson()).toList(),
      };
}
