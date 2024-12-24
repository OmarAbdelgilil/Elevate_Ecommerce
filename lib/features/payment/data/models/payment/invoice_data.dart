import 'package:elevate_ecommerce/features/home/data/models/response/get_all_categories_response/metadata.dart';

class InvoiceData {
  dynamic accountTaxIds;
  dynamic customFields;
  dynamic description;
  dynamic footer;
  dynamic issuer;
  Metadata? metadata;
  dynamic renderingOptions;

  InvoiceData({
    this.accountTaxIds,
    this.customFields,
    this.description,
    this.footer,
    this.issuer,
    this.metadata,
    this.renderingOptions,
  });

  factory InvoiceData.fromJson(Map<String, dynamic> json) => InvoiceData(
        accountTaxIds: json['account_tax_ids'] as dynamic,
        customFields: json['custom_fields'] as dynamic,
        description: json['description'] as dynamic,
        footer: json['footer'] as dynamic,
        issuer: json['issuer'] as dynamic,
        metadata: json['metadata'] == null
            ? null
            : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
        renderingOptions: json['rendering_options'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'account_tax_ids': accountTaxIds,
        'custom_fields': customFields,
        'description': description,
        'footer': footer,
        'issuer': issuer,
        'metadata': metadata?.toJson(),
        'rendering_options': renderingOptions,
      };
}
