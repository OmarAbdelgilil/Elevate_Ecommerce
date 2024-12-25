class CustomerDetails {
	dynamic address;
	String? email;
	dynamic name;
	dynamic phone;
	String? taxExempt;
	dynamic taxIds;

	CustomerDetails({
		this.address, 
		this.email, 
		this.name, 
		this.phone, 
		this.taxExempt, 
		this.taxIds, 
	});

	factory CustomerDetails.fromJson(Map<String, dynamic> json) {
		return CustomerDetails(
			address: json['address'] as dynamic,
			email: json['email'] as String?,
			name: json['name'] as dynamic,
			phone: json['phone'] as dynamic,
			taxExempt: json['tax_exempt'] as String?,
			taxIds: json['tax_ids'] as dynamic,
		);
	}



	Map<String, dynamic> toJson() => {
				'address': address,
				'email': email,
				'name': name,
				'phone': phone,
				'tax_exempt': taxExempt,
				'tax_ids': taxIds,
			};
}
