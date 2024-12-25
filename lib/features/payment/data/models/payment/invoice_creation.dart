import 'invoice_data.dart';

class InvoiceCreation {
	bool? enabled;
	InvoiceData? invoiceData;

	InvoiceCreation({this.enabled, this.invoiceData});

	factory InvoiceCreation.fromJson(Map<String, dynamic> json) {
		return InvoiceCreation(
			enabled: json['enabled'] as bool?,
			invoiceData: json['invoice_data'] == null
						? null
						: InvoiceData.fromJson(json['invoice_data'] as Map<String, dynamic>),
		);
	}



	Map<String, dynamic> toJson() => {
				'enabled': enabled,
				'invoice_data': invoiceData?.toJson(),
			};
}
