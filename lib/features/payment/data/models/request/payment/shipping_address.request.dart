class ShippingAddress {
	String? street;
	String? phone;
	String? city;

	ShippingAddress({this.street, this.phone, this.city});

	factory ShippingAddress.fromJson(Map<String, dynamic> json) {
		return ShippingAddress(
			street: json['street'] as String?,
			phone: json['phone'] as String?,
			city: json['city'] as String?,
		);
	}



	Map<String, dynamic> toJson() => {
				'street': street,
				'phone': phone,
				'city': city,
			};
}
