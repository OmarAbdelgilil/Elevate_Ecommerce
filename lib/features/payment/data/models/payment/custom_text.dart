class CustomText {
	dynamic afterSubmit;
	dynamic shippingAddress;
	dynamic submit;
	dynamic termsOfServiceAcceptance;

	CustomText({
		this.afterSubmit, 
		this.shippingAddress, 
		this.submit, 
		this.termsOfServiceAcceptance, 
	});

	factory CustomText.fromJson(Map<String, dynamic> json) => CustomText(
				afterSubmit: json['after_submit'] as dynamic,
				shippingAddress: json['shipping_address'] as dynamic,
				submit: json['submit'] as dynamic,
				termsOfServiceAcceptance: json['terms_of_service_acceptance'] as dynamic,
			);

	Map<String, dynamic> toJson() => {
				'after_submit': afterSubmit,
				'shipping_address': shippingAddress,
				'submit': submit,
				'terms_of_service_acceptance': termsOfServiceAcceptance,
			};
}
