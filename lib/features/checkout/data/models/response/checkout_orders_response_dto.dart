import 'package:json_annotation/json_annotation.dart';

part 'checkout_orders_response_dto.g.dart';

@JsonSerializable()
class CheckoutOrdersResponseDto {
  final String? message;
  final CheckoutSessionDto? session;

  CheckoutOrdersResponseDto(this.message, this.session);

  factory CheckoutOrdersResponseDto.fromJson(Map<String, dynamic> json) =>
      _$CheckoutOrdersResponseDtoFromJson(json);

}

@JsonSerializable()
class CheckoutSessionDto {
  final String? id;
  final String? object;
  @JsonKey(name: 'adaptive_pricing')
  final AdaptivePricingDto? adaptivePricing;
  @JsonKey(name: 'after_expiration')
  final dynamic afterExpiration;
  @JsonKey(name: 'allow_promotion_codes')
  final dynamic allowPromotionCodes;
  @JsonKey(name: 'amount_subtotal')
  final int? amountSubtotal;
  @JsonKey(name: 'amount_total')
  final int? amountTotal;
  @JsonKey(name: 'automatic_tax')
  final AutomaticTaxDto? automaticTax;
  @JsonKey(name: 'billing_address_collection')
  final dynamic billingAddressCollection;
  @JsonKey(name: 'cancel_url')
  final String? cancelUrl;
  @JsonKey(name: 'client_reference_id')
  final String? clientReferenceId;
  @JsonKey(name: 'client_secret')
  final dynamic clientSecret;
  final dynamic consent;
  @JsonKey(name: 'consent_collection')
  final dynamic consentCollection;
  final int? created;
  final String? currency;
  @JsonKey(name: 'currency_conversion')
  final dynamic currencyConversion;
  @JsonKey(name: 'custom_fields')
  final List<dynamic>? customFields;
  @JsonKey(name: 'custom_text')
  final CustomTextDto? customText;
  final dynamic customer;
  @JsonKey(name: 'customer_creation')
  final String? customerCreation;
  @JsonKey(name: 'customer_details')
  final CustomerDetailsDto? customerDetails;
  @JsonKey(name: 'customer_email')
  final String? customerEmail;
  @JsonKey(name: 'expires_at')
  final int? expiresAt;
  final dynamic invoice;
  @JsonKey(name: 'invoice_creation')
  final InvoiceCreationDto? invoiceCreation;
  final bool? liveMode;
  final dynamic locale;
  final SessionMetadataDto? metadata;
  final String? mode;
  @JsonKey(name: 'payment_intent')
  final dynamic paymentIntent;
  @JsonKey(name: 'payment_link')
  final dynamic paymentLink;
  @JsonKey(name: 'payment_method_collection')
  final String? paymentMethodCollection;
  @JsonKey(name: 'payment_method_configuration_details')
  final PaymentMethodConfigurationDetailsDto?
      paymentMethodConfigurationDetails;
  @JsonKey(name: 'payment_method_options')
  final PaymentMethodOptionsDto?
      paymentMethodOptions;
  @JsonKey(name: 'payment_method_types')
  final List<String?>? paymentMethodTypes;
  @JsonKey(name: 'payment_status')
  final String? paymentStatus;
  @JsonKey(name: 'phone_number_collection')
  final PhoneNumberCollectionDto?
      phoneNumberCollection;
  @JsonKey(name: 'recovered_from')
  final dynamic recoveredFrom;
  @JsonKey(name: 'saved_payment_method_options')
  final dynamic savedPaymentMethodOptions;
  @JsonKey(name: 'setup_intent')
  final dynamic setupIntent;
  @JsonKey(name: 'shipping_address_collection')
  final dynamic shippingAddressCollection;
  @JsonKey(name: 'shipping_cost')
  final dynamic shippingCost;
  @JsonKey(name: 'shipping_details')
  final dynamic shippingDetails;
  @JsonKey(name: 'shipping_options')
  final List<dynamic>? shippingOptions;
  final String? status;
  @JsonKey(name: 'submit_type')
  final dynamic submitType;
  final dynamic subscription;
  @JsonKey(name: 'success_url')
  final String? successUrl;
  @JsonKey(name: 'total_details')
  final TotalDetailsDto? totalDetails;
  @JsonKey(name: 'ui_mode')
  final String? uiMode;
  final String? url;

  CheckoutSessionDto(
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
      this.liveMode,
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
      this.url);

  factory CheckoutSessionDto.fromJson(
          Map<String, dynamic> json) =>
      _$CheckoutSessionDtoFromJson(json);

}

@JsonSerializable()
class AdaptivePricingDto {
  final bool? enabled;

  AdaptivePricingDto(this.enabled);

  factory AdaptivePricingDto.fromJson(
          Map<String, dynamic> json) =>
      _$AdaptivePricingDtoFromJson(json);


}

@JsonSerializable()
class AutomaticTaxDto {
  final bool? enabled;
  final dynamic liability;
  final dynamic status;

  AutomaticTaxDto(
      this.enabled, this.liability, this.status);

  factory AutomaticTaxDto.fromJson(
          Map<String, dynamic> json) =>
      _$AutomaticTaxDtoFromJson(json);


}

@JsonSerializable()
class CustomTextDto {
  @JsonKey(name: 'after_submit')
  final dynamic afterSubmit;
  @JsonKey(name: 'shipping_address')
  final dynamic shippingAddress;
  final dynamic submit;
  @JsonKey(name: 'terms_of_service_acceptance')
  final dynamic termsOfServiceAcceptance;

  CustomTextDto(this.afterSubmit,
      this.shippingAddress, this.submit, this.termsOfServiceAcceptance);

  factory CustomTextDto.fromJson(
          Map<String, dynamic> json) =>
      _$CustomTextDtoFromJson(json);


}

@JsonSerializable()
class CustomerDetailsDto {
  final dynamic address;
  final String? email;
  final dynamic name;
  final dynamic phone;
  @JsonKey(name: 'tax_exempt')
  final String? taxExempt;
  @JsonKey(name: 'tax_ids')
  final dynamic taxIds;

  CustomerDetailsDto(this.address, this.email,
      this.name, this.phone, this.taxExempt, this.taxIds);

  factory CustomerDetailsDto.fromJson(
          Map<String, dynamic> json) =>
      _$CustomerDetailsDtoFromJson(json);

}

@JsonSerializable()
class InvoiceCreationDto {
  final bool? enabled;
  @JsonKey(name: 'invoice_data')
  final InvoiceDataDto? invoiceData;

  InvoiceCreationDto(
      this.enabled, this.invoiceData);

  factory InvoiceCreationDto.fromJson(
          Map<String, dynamic> json) =>
      _$InvoiceCreationDtoFromJson(json);

}

@JsonSerializable()
class InvoiceDataDto {
  @JsonKey(name: 'account_tax_ids')
  final dynamic accountTaxIds;
  @JsonKey(name: 'custom_fields')
  final dynamic customFields;
  final dynamic description;
  final dynamic footer;
  final dynamic issuer;
  final InvoiceDataMetadataDto?
      metadata;
  @JsonKey(name: 'rendering_options')
  final dynamic renderingOptions;

  InvoiceDataDto(
      this.accountTaxIds,
      this.customFields,
      this.description,
      this.footer,
      this.issuer,
      this.metadata,
      this.renderingOptions);

  factory InvoiceDataDto.fromJson(
          Map<String, dynamic> json) =>
      _$InvoiceDataDtoFromJson(
          json);

}

@JsonSerializable()
class InvoiceDataMetadataDto {
  InvoiceDataMetadataDto();

  factory InvoiceDataMetadataDto.fromJson(
          Map<String, dynamic> json) =>
      _$InvoiceDataMetadataDtoFromJson(
          json);

}

@JsonSerializable()
class SessionMetadataDto {
  final String? city;
  final String? phone;
  final String? street;

  SessionMetadataDto(this.city, this.phone, this.street);

  factory SessionMetadataDto.fromJson(
          Map<String, dynamic> json) =>
      _$SessionMetadataDtoFromJson(json);
}

@JsonSerializable()
class PaymentMethodConfigurationDetailsDto {
  final String? id;
  final dynamic parent;

  PaymentMethodConfigurationDetailsDto(
      this.id, this.parent);

  factory PaymentMethodConfigurationDetailsDto.fromJson(
          Map<String, dynamic> json) =>
      _$PaymentMethodConfigurationDetailsDtoFromJson(
          json);

}

@JsonSerializable()
class PaymentMethodOptionsDto {
  final PaymentMethodOptionsCardDto? card;

  PaymentMethodOptionsDto(this.card);

  factory PaymentMethodOptionsDto.fromJson(
          Map<String, dynamic> json) =>
      _$PaymentMethodOptionsDtoFromJson(json);

}

@JsonSerializable()
class PaymentMethodOptionsCardDto {
  @JsonKey(name: 'request_three_d_secure')
  final String? requestThreeDSecure;

  PaymentMethodOptionsCardDto(
      this.requestThreeDSecure);

  factory PaymentMethodOptionsCardDto.fromJson(
          Map<String, dynamic> json) =>
      _$PaymentMethodOptionsCardDtoFromJson(json);
}

@JsonSerializable()
class PhoneNumberCollectionDto {
  final bool? enabled;

  PhoneNumberCollectionDto(this.enabled);

  factory PhoneNumberCollectionDto.fromJson(
          Map<String, dynamic> json) =>
      _$PhoneNumberCollectionDtoFromJson(json);

}

@JsonSerializable()
class TotalDetailsDto {
  @JsonKey(name: 'amount_discount')
  final int? amountDiscount;
  @JsonKey(name: 'amount_shipping')
  final int? amountShipping;
  @JsonKey(name: 'amount_tax')
  final int? amountTax;

  TotalDetailsDto(
      this.amountDiscount, this.amountShipping, this.amountTax);

  factory TotalDetailsDto.fromJson(
          Map<String, dynamic> json) =>
      _$TotalDetailsDtoFromJson(json);

}
