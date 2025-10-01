import 'package:vestrollmobile/shared/models/country_model.dart';

enum FormStatus { initial, loading, success, failure }

class AddressFormState {
  final Country? selectedCountry;
  final String street;
  final String city;
  final String postalCode;
  final FormStatus status;
  final String? errorMessage;
  final bool isValid;
  final Map<String, String?> fieldErrors;

  const AddressFormState({
    this.selectedCountry,
    this.street = '',
    this.city = '',
    this.postalCode = '',
    this.status = FormStatus.initial,
    this.errorMessage,
    this.isValid = false,
    this.fieldErrors = const {},
  });

  AddressFormState copyWith({
    Country? selectedCountry,
    String? street,
    String? city,
    String? postalCode,
    FormStatus? status,
    String? errorMessage,
    bool? isValid,
    Map<String, String?>? fieldErrors,
  }) {
    return AddressFormState(
      selectedCountry: selectedCountry,
      street: street ?? this.street,
      city: city ?? this.city,
      postalCode: postalCode ?? this.postalCode,
      status: status ?? this.status,
      errorMessage: errorMessage,
      isValid: isValid ?? this.isValid,
      fieldErrors: fieldErrors ?? this.fieldErrors,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AddressFormState &&
        other.selectedCountry == selectedCountry &&
        other.street == street &&
        other.city == city &&
        other.postalCode == postalCode &&
        other.status == status &&
        other.errorMessage == errorMessage &&
        other.isValid == isValid;
  }

  @override
  int get hashCode {
    return selectedCountry.hashCode ^
        street.hashCode ^
        city.hashCode ^
        postalCode.hashCode ^
        status.hashCode ^
        errorMessage.hashCode ^
        isValid.hashCode;
  }
}
