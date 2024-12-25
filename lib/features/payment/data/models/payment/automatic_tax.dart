class AutomaticTax {
	bool? enabled;
	dynamic liability;
	dynamic status;

	AutomaticTax({this.enabled, this.liability, this.status});

	factory AutomaticTax.fromJson(Map<String, dynamic> json) => AutomaticTax(
				enabled: json['enabled'] as bool?,
				liability: json['liability'] as dynamic,
				status: json['status'] as dynamic,
			);

	Map<String, dynamic> toJson() => {
				'enabled': enabled,
				'liability': liability,
				'status': status,
			};
}
