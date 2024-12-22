import 'package:elevate_ecommerce/features/home/data/models/response/get_all_categories_response/metadata.dart';

import 'adaptive_pricing.dart';
import 'automatic_tax.dart';
import 'custom_text.dart';
import 'customer_details.dart';
import 'invoice_creation.dart';
import 'payment_method_configuration_details.dart';
import 'payment_method_options.dart';
import 'phone_number_collection.dart';
import 'total_details.dart';

class Session {
  String? id;
  String? object;
  AdaptivePricing? adaptivePricing;
  dynamic afterExpiration;
  dynamic allowPromotionCodes;
  int? amountSubtotal;
  int? amountTotal;
  AutomaticTax? automaticTax;
  dynamic billingAddressCollection;
  String? cancelUrl;
  String? clientReferenceId;
  dynamic clientSecret;
  dynamic consent;
  dynamic consentCollection;
  int? created;
  String? currency;
  dynamic currencyConversion;
  List<dynamic>? customFields;
  CustomText? customText;
  dynamic customer;
  String? customerCreation;
  CustomerDetails? customerDetails;
  String? customerEmail;
  int? expiresAt;
  dynamic invoice;
  InvoiceCreation? invoiceCreation;
  bool? livemode;
  dynamic locale;
  Metadata? metadata;
  String? mode;
  dynamic paymentIntent;
  dynamic paymentLink;
  String? paymentMethodCollection;
  PaymentMethodConfigurationDetails? paymentMethodConfigurationDetails;
  PaymentMethodOptions? paymentMethodOptions;
  List<String>? paymentMethodTypes;
  String? paymentStatus;
  PhoneNumberCollection? phoneNumberCollection;
  dynamic recoveredFrom;
  dynamic savedPaymentMethodOptions;
  dynamic setupIntent;
  dynamic shippingAddressCollection;
  dynamic shippingCost;
  dynamic shippingDetails;
  List<dynamic>? shippingOptions;
  String? status;
  dynamic submitType;
  dynamic subscription;
  String? successUrl;
  TotalDetails? totalDetails;
  String? uiMode;
  String? url;

  Session({
    this.id,
    this.object,
    this.adaptivePricing,
    this.afterExpiration,
    this.allowPromotionCodes,
    this.amountSubtotal,
    this.amountTotal,
    this.automaticTax,
    this.billingAddressCollection,
    this.cancelUrl,
    this.clientReferenceId,
    this.clientSecret,
    this.consent,
    this.consentCollection,
    this.created,
    this.currency,
    this.currencyConversion,
    this.customFields,
    this.customText,
    this.customer,
    this.customerCreation,
    this.customerDetails,
    this.customerEmail,
    this.expiresAt,
    this.invoice,
    this.invoiceCreation,
    this.livemode,
    this.locale,
    this.metadata,
    this.mode,
    this.paymentIntent,
    this.paymentLink,
    this.paymentMethodCollection,
    this.paymentMethodConfigurationDetails,
    this.paymentMethodOptions,
    this.paymentMethodTypes,
    this.paymentStatus,
    this.phoneNumberCollection,
    this.recoveredFrom,
    this.savedPaymentMethodOptions,
    this.setupIntent,
    this.shippingAddressCollection,
    this.shippingCost,
    this.shippingDetails,
    this.shippingOptions,
    this.status,
    this.submitType,
    this.subscription,
    this.successUrl,
    this.totalDetails,
    this.uiMode,
    this.url,
  });

  factory Session.fromJson(Map<String, dynamic> json) => Session(
        id: json['id'] as String?,
        object: json['object'] as String?,
        adaptivePricing: json['adaptive_pricing'] == null
            ? null
            : AdaptivePricing.fromJson(
                json['adaptive_pricing'] as Map<String, dynamic>),
        afterExpiration: json['after_expiration'] as dynamic,
        allowPromotionCodes: json['allow_promotion_codes'] as dynamic,
        amountSubtotal: json['amount_subtotal'] as int?,
        amountTotal: json['amount_total'] as int?,
        automaticTax: json['automatic_tax'] == null
            ? null
            : AutomaticTax.fromJson(
                json['automatic_tax'] as Map<String, dynamic>),
        billingAddressCollection: json['billing_address_collection'] as dynamic,
        cancelUrl: json['cancel_url'] as String?,
        clientReferenceId: json['client_reference_id'] as String?,
        clientSecret: json['client_secret'] as dynamic,
        consent: json['consent'] as dynamic,
        consentCollection: json['consent_collection'] as dynamic,
        created: json['created'] as int?,
        currency: json['currency'] as String?,
        currencyConversion: json['currency_conversion'] as dynamic,
        customFields: json['custom_fields'] as List<dynamic>?,
        customText: json['custom_text'] == null
            ? null
            : CustomText.fromJson(json['custom_text'] as Map<String, dynamic>),
        customer: json['customer'] as dynamic,
        customerCreation: json['customer_creation'] as String?,
        customerDetails: json['customer_details'] == null
            ? null
            : CustomerDetails.fromJson(
                json['customer_details'] as Map<String, dynamic>),
        customerEmail: json['customer_email'] as String?,
        expiresAt: json['expires_at'] as int?,
        invoice: json['invoice'] as dynamic,
        invoiceCreation: json['invoice_creation'] == null
            ? null
            : InvoiceCreation.fromJson(
                json['invoice_creation'] as Map<String, dynamic>),
        livemode: json['livemode'] as bool?,
        locale: json['locale'] as dynamic,
        metadata: json['metadata'] == null
            ? null
            : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
        mode: json['mode'] as String?,
        paymentIntent: json['payment_intent'] as dynamic,
        paymentLink: json['payment_link'] as dynamic,
        paymentMethodCollection: json['payment_method_collection'] as String?,
        paymentMethodConfigurationDetails:
            json['payment_method_configuration_details'] == null
                ? null
                : PaymentMethodConfigurationDetails.fromJson(
                    json['payment_method_configuration_details']
                        as Map<String, dynamic>),
        paymentMethodOptions: json['payment_method_options'] == null
            ? null
            : PaymentMethodOptions.fromJson(
                json['payment_method_options'] as Map<String, dynamic>),
        paymentMethodTypes: json['payment_method_types'] as List<String>?,
        paymentStatus: json['payment_status'] as String?,
        phoneNumberCollection: json['phone_number_collection'] == null
            ? null
            : PhoneNumberCollection.fromJson(
                json['phone_number_collection'] as Map<String, dynamic>),
        recoveredFrom: json['recovered_from'] as dynamic,
        savedPaymentMethodOptions:
            json['saved_payment_method_options'] as dynamic,
        setupIntent: json['setup_intent'] as dynamic,
        shippingAddressCollection:
            json['shipping_address_collection'] as dynamic,
        shippingCost: json['shipping_cost'] as dynamic,
        shippingDetails: json['shipping_details'] as dynamic,
        shippingOptions: json['shipping_options'] as List<dynamic>?,
        status: json['status'] as String?,
        submitType: json['submit_type'] as dynamic,
        subscription: json['subscription'] as dynamic,
        successUrl: json['success_url'] as String?,
        totalDetails: json['total_details'] == null
            ? null
            : TotalDetails.fromJson(
                json['total_details'] as Map<String, dynamic>),
        uiMode: json['ui_mode'] as String?,
        url: json['url'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'object': object,
        'adaptive_pricing': adaptivePricing?.toJson(),
        'after_expiration': afterExpiration,
        'allow_promotion_codes': allowPromotionCodes,
        'amount_subtotal': amountSubtotal,
        'amount_total': amountTotal,
        'automatic_tax': automaticTax?.toJson(),
        'billing_address_collection': billingAddressCollection,
        'cancel_url': cancelUrl,
        'client_reference_id': clientReferenceId,
        'client_secret': clientSecret,
        'consent': consent,
        'consent_collection': consentCollection,
        'created': created,
        'currency': currency,
        'currency_conversion': currencyConversion,
        'custom_fields': customFields,
        'custom_text': customText?.toJson(),
        'customer': customer,
        'customer_creation': customerCreation,
        'customer_details': customerDetails?.toJson(),
        'customer_email': customerEmail,
        'expires_at': expiresAt,
        'invoice': invoice,
        'invoice_creation': invoiceCreation?.toJson(),
        'livemode': livemode,
        'locale': locale,
        'metadata': metadata?.toJson(),
        'mode': mode,
        'payment_intent': paymentIntent,
        'payment_link': paymentLink,
        'payment_method_collection': paymentMethodCollection,
        'payment_method_configuration_details':
            paymentMethodConfigurationDetails?.toJson(),
        'payment_method_options': paymentMethodOptions?.toJson(),
        'payment_method_types': paymentMethodTypes,
        'payment_status': paymentStatus,
        'phone_number_collection': phoneNumberCollection?.toJson(),
        'recovered_from': recoveredFrom,
        'saved_payment_method_options': savedPaymentMethodOptions,
        'setup_intent': setupIntent,
        'shipping_address_collection': shippingAddressCollection,
        'shipping_cost': shippingCost,
        'shipping_details': shippingDetails,
        'shipping_options': shippingOptions,
        'status': status,
        'submit_type': submitType,
        'subscription': subscription,
        'success_url': successUrl,
        'total_details': totalDetails?.toJson(),
        'ui_mode': uiMode,
        'url': url,
      };
}
