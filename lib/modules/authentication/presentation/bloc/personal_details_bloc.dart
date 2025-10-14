import 'package:flutter_bloc/flutter_bloc.dart';

class Country {
  final String name;
  final String code;
  final String dialCode;
  final String flag;

  const Country({
    required this.name,
    required this.code,
    required this.dialCode,
    required this.flag,
  });
}

const List<Country> kCountries = [
  Country(name: 'Nigeria', code: 'NG', dialCode: '+234', flag: '🇳🇬'),
  Country(name: 'Ghana', code: 'GH', dialCode: '+233', flag: '🇬🇭'),
  Country(name: 'Kenya', code: 'KE', dialCode: '+254', flag: '🇰🇪'),
  Country(name: 'United Kingdom', code: 'GB', dialCode: '+44', flag: '🇬🇧'),
  Country(name: 'United States', code: 'US', dialCode: '+1', flag: '🇺🇸'),
  Country(name: 'Ethiopia', code: 'ET', dialCode: '+251', flag: '🇪🇹'),
];

abstract class PersonalDetailsEvent {}

class CitizenshipChanged extends PersonalDetailsEvent {
  final Country country;
  CitizenshipChanged(this.country);
}

class DialCodeChanged extends PersonalDetailsEvent {
  final Country country;
  DialCodeChanged(this.country);
}

class GenderChanged extends PersonalDetailsEvent {
  final String gender;
  GenderChanged(this.gender);
}

class DobChanged extends PersonalDetailsEvent {
  final DateTime dob;
  DobChanged(this.dob);
}

class PhoneChanged extends PersonalDetailsEvent {
  final String phone;
  PhoneChanged(this.phone);
}

class PersonalDetailsState {
  final Country? citizenship;
  final Country? dialCountry;
  final String? gender;
  final DateTime? dob;
  final String phone;

  PersonalDetailsState({
    this.citizenship,
    this.dialCountry,
    this.gender,
    this.dob,
    this.phone = '',
  });

  bool get isValid {
    return citizenship != null &&
        gender != null &&
        dob != null &&
        dialCountry != null &&
        phone.trim().length >= 6;
  }

  PersonalDetailsState copyWith({
    Country? citizenship,
    Country? dialCountry,
    String? gender,
    DateTime? dob,
    String? phone,
  }) {
    return PersonalDetailsState(
      citizenship: citizenship ?? this.citizenship,
      dialCountry: dialCountry ?? this.dialCountry,
      gender: gender ?? this.gender,
      dob: dob ?? this.dob,
      phone: phone ?? this.phone,
    );
  }
}

class PersonalDetailsBloc
    extends Bloc<PersonalDetailsEvent, PersonalDetailsState> {
  PersonalDetailsBloc() : super(PersonalDetailsState()) {
    on<CitizenshipChanged>((event, emit) {
      emit(state.copyWith(citizenship: event.country));
    });
    on<DialCodeChanged>((event, emit) {
      emit(state.copyWith(dialCountry: event.country));
    });
    on<GenderChanged>((event, emit) {
      emit(state.copyWith(gender: event.gender));
    });
    on<DobChanged>((event, emit) {
      emit(state.copyWith(dob: event.dob));
    });
    on<PhoneChanged>((event, emit) {
      emit(state.copyWith(phone: event.phone));
    });
  }
}
