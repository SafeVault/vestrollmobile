class Country {
  final String name;
  final String flag;
  final String dialCode;

  const Country({
    required this.name,
    required this.flag,
    required this.dialCode,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Country &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          dialCode == other.dialCode;

  @override
  int get hashCode => name.hashCode ^ dialCode.hashCode;
}

/// Sample country data
class CountryData {
  static const List<Country> countries = [
    Country(name: 'Afghanistan', flag: '🇦🇫', dialCode: '+93'),
    Country(name: 'Albania', flag: '🇦🇱', dialCode: '+355'),
    Country(name: 'Algeria', flag: '🇩🇿', dialCode: '+213'),
    Country(name: 'American Samoa', flag: '🇦🇸', dialCode: '+1-684'),
    Country(name: 'Andorra', flag: '🇦🇩', dialCode: '+376'),
    Country(name: 'Angola', flag: '🇦🇴', dialCode: '+244'),
    Country(name: 'Anguilla', flag: '🇦🇮', dialCode: '+1-264'),
    Country(name: 'Antigua and Barbuda', flag: '🇦🇬', dialCode: '+1-268'),
    Country(name: 'Argentina', flag: '🇦🇷', dialCode: '+54'),
    Country(name: 'Nigeria', flag: '🇳🇬', dialCode: '+234'),
    // Add more countries as needed
  ];

  static Country? findByDialCode(String dialCode) {
    try {
      return countries.firstWhere((c) => c.dialCode == dialCode);
    } catch (e) {
      return null;
    }
  }

  static Country? findByName(String name) {
    try {
      return countries.firstWhere((c) => c.name == name);
    } catch (e) {
      return null;
    }
  }
}
