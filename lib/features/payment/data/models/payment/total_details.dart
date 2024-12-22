class TotalDetails {
	int? amountDiscount;
	int? amountShipping;
	int? amountTax;

	TotalDetails({this.amountDiscount, this.amountShipping, this.amountTax});

	factory TotalDetails.fromJson(Map<String, dynamic> json) => TotalDetails(
				amountDiscount: json['amount_discount'] as int?,
				amountShipping: json['amount_shipping'] as int?,
				amountTax: json['amount_tax'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'amount_discount': amountDiscount,
				'amount_shipping': amountShipping,
				'amount_tax': amountTax,
			};
}
