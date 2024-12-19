// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_orders_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckoutOrdersResponseDto _$CheckoutOrdersResponseDtoFromJson(
        Map<String, dynamic> json) =>
    CheckoutOrdersResponseDto(
      json['message'] as String?,
      json['session'] == null
          ? null
          : CheckoutSessionDto.fromJson(
              json['session'] as Map<String, dynamic>),
    );


CheckoutSessionDto _$CheckoutSessionDtoFromJson(Map<String, dynamic> json) =>
    CheckoutSessionDto(
      json['id'] as String?,
      json['object'] as String?,
      json['adaptive_pricing'] == null
          ? null
          : AdaptivePricingDto.fromJson(
              json['adaptive_pricing'] as Map<String, dynamic>),
      json['after_expiration'],
      json['allow_promotion_codes'],
      (json['amount_subtotal'] as num?)?.toInt(),
      (json['amount_total'] as num?)?.toInt(),
      json['automatic_tax'] == null
          ? null
          : AutomaticTaxDto.fromJson(
              json['automatic_tax'] as Map<String, dynamic>),
      json['billing_address_collection'],
      json['cancel_url'] as String?,
      json['client_reference_id'] as String?,
      json['client_secret'],
      json['consent'],
      json['consent_collection'],
      (json['created'] as num?)?.toInt(),
      json['currency'] as String?,
      json['currency_conversion'],
      json['custom_fields'] as List<dynamic>?,
      json['custom_text'] == null
          ? null
          : CustomTextDto.fromJson(json['custom_text'] as Map<String, dynamic>),
      json['customer'],
      json['customer_creation'] as String?,
      json['customer_details'] == null
          ? null
          : CustomerDetailsDto.fromJson(
              json['customer_details'] as Map<String, dynamic>),
      json['customer_email'] as String?,
      (json['expires_at'] as num?)?.toInt(),
      json['invoice'],
      json['invoice_creation'] == null
          ? null
          : InvoiceCreationDto.fromJson(
              json['invoice_creation'] as Map<String, dynamic>),
      json['liveMode'] as bool?,
      json['locale'],
      json['metadata'] == null
          ? null
          : SessionMetadataDto.fromJson(
              json['metadata'] as Map<String, dynamic>),
      json['mode'] as String?,
      json['payment_intent'],
      json['payment_link'],
      json['payment_method_collection'] as String?,
      json['payment_method_configuration_details'] == null
          ? null
          : PaymentMethodConfigurationDetailsDto.fromJson(
              json['payment_method_configuration_details']
                  as Map<String, dynamic>),
      json['payment_method_options'] == null
          ? null
          : PaymentMethodOptionsDto.fromJson(
              json['payment_method_options'] as Map<String, dynamic>),
      (json['payment_method_types'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['payment_status'] as String?,
      json['phone_number_collection'] == null
          ? null
          : PhoneNumberCollectionDto.fromJson(
              json['phone_number_collection'] as Map<String, dynamic>),
      json['recovered_from'],
      json['saved_payment_method_options'],
      json['setup_intent'],
      json['shipping_address_collection'],
      json['shipping_cost'],
      json['shipping_details'],
      json['shipping_options'] as List<dynamic>?,
      json['status'] as String?,
      json['submit_type'],
      json['subscription'],
      json['success_url'] as String?,
      json['total_details'] == null
          ? null
          : TotalDetailsDto.fromJson(
              json['total_details'] as Map<String, dynamic>),
      json['ui_mode'] as String?,
      json['url'] as String?,
    );


AdaptivePricingDto _$AdaptivePricingDtoFromJson(Map<String, dynamic> json) =>
    AdaptivePricingDto(
      json['enabled'] as bool?,
    );


AutomaticTaxDto _$AutomaticTaxDtoFromJson(Map<String, dynamic> json) =>
    AutomaticTaxDto(
      json['enabled'] as bool?,
      json['liability'],
      json['status'],
    );


CustomTextDto _$CustomTextDtoFromJson(Map<String, dynamic> json) =>
    CustomTextDto(
      json['after_submit'],
      json['shipping_address'],
      json['submit'],
      json['terms_of_service_acceptance'],
    );


CustomerDetailsDto _$CustomerDetailsDtoFromJson(Map<String, dynamic> json) =>
    CustomerDetailsDto(
      json['address'],
      json['email'] as String?,
      json['name'],
      json['phone'],
      json['tax_exempt'] as String?,
      json['tax_ids'],
    );


InvoiceCreationDto _$InvoiceCreationDtoFromJson(Map<String, dynamic> json) =>
    InvoiceCreationDto(
      json['enabled'] as bool?,
      json['invoice_data'] == null
          ? null
          : InvoiceDataDto.fromJson(
              json['invoice_data'] as Map<String, dynamic>),
    );


InvoiceDataDto _$InvoiceDataDtoFromJson(Map<String, dynamic> json) =>
    InvoiceDataDto(
      json['account_tax_ids'],
      json['custom_fields'],
      json['description'],
      json['footer'],
      json['issuer'],
      json['metadata'] == null
          ? null
          : InvoiceDataMetadataDto.fromJson(
              json['metadata'] as Map<String, dynamic>),
      json['rendering_options'],
    );


InvoiceDataMetadataDto _$InvoiceDataMetadataDtoFromJson(
        Map<String, dynamic> json) =>
    InvoiceDataMetadataDto();


SessionMetadataDto _$SessionMetadataDtoFromJson(Map<String, dynamic> json) =>
    SessionMetadataDto(
      json['city'] as String?,
      json['phone'] as String?,
      json['street'] as String?,
    );


PaymentMethodConfigurationDetailsDto
    _$PaymentMethodConfigurationDetailsDtoFromJson(Map<String, dynamic> json) =>
        PaymentMethodConfigurationDetailsDto(
          json['id'] as String?,
          json['parent'],
        );


PaymentMethodOptionsDto _$PaymentMethodOptionsDtoFromJson(
        Map<String, dynamic> json) =>
    PaymentMethodOptionsDto(
      json['card'] == null
          ? null
          : PaymentMethodOptionsCardDto.fromJson(
              json['card'] as Map<String, dynamic>),
    );


PaymentMethodOptionsCardDto _$PaymentMethodOptionsCardDtoFromJson(
        Map<String, dynamic> json) =>
    PaymentMethodOptionsCardDto(
      json['request_three_d_secure'] as String?,
    );

PhoneNumberCollectionDto _$PhoneNumberCollectionDtoFromJson(
        Map<String, dynamic> json) =>
    PhoneNumberCollectionDto(
      json['enabled'] as bool?,
    );


TotalDetailsDto _$TotalDetailsDtoFromJson(Map<String, dynamic> json) =>
    TotalDetailsDto(
      (json['amount_discount'] as num?)?.toInt(),
      (json['amount_shipping'] as num?)?.toInt(),
      (json['amount_tax'] as num?)?.toInt(),
    );

