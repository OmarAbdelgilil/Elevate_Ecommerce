import 'category.dart';
import 'metadata.dart';

class GetAllCategoriesResponse {
	String? message;
	Metadata? metadata;
	List<Category>? categories;

	GetAllCategoriesResponse({this.message, this.metadata, this.categories});

	factory GetAllCategoriesResponse.fromJson(Map<String, dynamic> json) {
		return GetAllCategoriesResponse(
			message: json['message'] as String?,
			metadata: json['metadata'] == null
						? null
						: Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
			categories: (json['categories'] as List<dynamic>?)
						?.map((e) => Category.fromJson(e as Map<String, dynamic>))
						.toList(),
		);
	}



	Map<String, dynamic> toJson() => {
				'message': message,
				'metadata': metadata?.toJson(),
				'categories': categories?.map((e) => e.toJson()).toList(),
			};
}
