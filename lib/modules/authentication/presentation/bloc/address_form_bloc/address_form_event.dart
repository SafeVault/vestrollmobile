import 'package:vestrollmobile/shared/models/country_model.dart';

abstract class AddressFormEvent {
  const AddressFormEvent();
}

class CountryChanged extends AddressFormEvent {
  final Country? country;

  const CountryChanged(this.country);
}

class StreetChanged extends AddressFormEvent {
  final String street;

  const StreetChanged(this.street);
}

class CityChanged extends AddressFormEvent {
  final String city;

  const CityChanged(this.city);
}

class PostalCodeChanged extends AddressFormEvent {
  final String postalCode;

  const PostalCodeChanged(this.postalCode);
}

class FormSubmitted extends AddressFormEvent {
  const FormSubmitted();
}

class FormValidationRequested extends AddressFormEvent {
  const FormValidationRequested();
}
