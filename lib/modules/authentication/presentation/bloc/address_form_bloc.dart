import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vestrollmobile/modules/authentication/presentation/bloc/address_form_event.dart';
import 'package:vestrollmobile/modules/authentication/presentation/bloc/address_form_state.dart';

class AddressFormBloc extends Bloc<AddressFormEvent, AddressFormState> {
  AddressFormBloc() : super(const AddressFormState()) {
    on<CountryChanged>(_onCountryChanged);
    on<StreetChanged>(_onStreetChanged);
    on<CityChanged>(_onCityChanged);
    on<PostalCodeChanged>(_onPostalCodeChanged);
    on<FormSubmitted>(_onFormSubmitted);
    on<FormValidationRequested>(_onFormValidationRequested);
  }

  void _onCountryChanged(CountryChanged event, Emitter<AddressFormState> emit) {
    print('Country changed to: ${event.country?.name}');
    final newState = state.copyWith(selectedCountry: event.country);
    final isValid = _isFormValid(newState);
    print('Form is valid: $isValid');
    emit(newState.copyWith(isValid: isValid));
  }

  void _onStreetChanged(StreetChanged event, Emitter<AddressFormState> emit) {
    final newState = state.copyWith(street: event.street);
    final isValid = _isFormValid(newState);
    emit(newState.copyWith(isValid: isValid));
  }

  void _onCityChanged(CityChanged event, Emitter<AddressFormState> emit) {
    final newState = state.copyWith(city: event.city);
    final isValid = _isFormValid(newState);
    emit(newState.copyWith(isValid: isValid));
  }

  void _onPostalCodeChanged(
      PostalCodeChanged event, Emitter<AddressFormState> emit) {
    final newState = state.copyWith(postalCode: event.postalCode);
    final isValid = _isFormValid(newState);
    emit(newState.copyWith(isValid: isValid));
  }

  Future<void> _onFormSubmitted(
      FormSubmitted event, Emitter<AddressFormState> emit) async {
    final errors = _validateAllFields();
    
    if (errors.isNotEmpty) {
      emit(state.copyWith(
        fieldErrors: errors,
        status: FormStatus.failure,
        errorMessage: 'Please correct the errors above',
      ));
      return;
    }

    emit(state.copyWith(status: FormStatus.loading));

    try {
      // Simulate API call
      await Future.delayed(const Duration(milliseconds: 500));
      
      emit(state.copyWith(
        status: FormStatus.success,
        errorMessage: null,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: FormStatus.failure,
        errorMessage: 'Failed to save address details. Please try again.',
      ));
    }
  }

  void _onFormValidationRequested(
      FormValidationRequested event, Emitter<AddressFormState> emit) {
    final errors = _validateAllFields();
    emit(state.copyWith(
      fieldErrors: errors,
      isValid: errors.isEmpty,
    ));
  }

  bool _isFormValid(AddressFormState state) {
    final isValid = state.selectedCountry != null &&
        state.street.trim().isNotEmpty &&
        state.city.trim().isNotEmpty &&
        state.postalCode.trim().isNotEmpty;
    print('Form validation: country=${state.selectedCountry?.name}, street=${state.street}, city=${state.city}, postal=${state.postalCode}, valid=$isValid');
    return isValid;
  }

  Map<String, String?> _validateAllFields() {
    final errors = <String, String?>{};

    if (state.selectedCountry == null) {
      errors['country'] = 'Please select a country';
    }

    if (state.street.trim().isEmpty) {
      errors['street'] = 'Please enter your street address';
    }

    if (state.city.trim().isEmpty) {
      errors['city'] = 'Please enter your city';
    }

    if (state.postalCode.trim().isEmpty) {
      errors['postalCode'] = 'Please enter your postal/zip code';
    } else if (state.postalCode.trim().length < 3) {
      errors['postalCode'] = 'Postal code must be at least 3 characters';
    }

    return errors;
  }
}
