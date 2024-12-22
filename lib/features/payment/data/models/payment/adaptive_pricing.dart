class AdaptivePricing {
	bool? enabled;

	AdaptivePricing({this.enabled});

	factory AdaptivePricing.fromJson(Map<String, dynamic> json) {
		return AdaptivePricing(
			enabled: json['enabled'] as bool?,
		);
	}



	Map<String, dynamic> toJson() => {
				'enabled': enabled,
			};
}
