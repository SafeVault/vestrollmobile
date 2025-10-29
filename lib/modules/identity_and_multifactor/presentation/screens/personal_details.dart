// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:vestrollmobile/core/navigation/routes_constant.dart';
import 'package:vestrollmobile/core/utils/managers/config.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_font_theme_extension.dart';
import 'package:vestrollmobile/modules/identity_and_multifactor/data/models/country_model.dart';
import 'package:vestrollmobile/modules/identity_and_multifactor/presentation/widgets/gender_selection.dart';
import 'package:vestrollmobile/shared/widgets/app_textfiled.dart';
import 'package:vestrollmobile/shared/widgets/bottom_sheet.dart';
import 'package:vestrollmobile/shared/widgets/primary_button.dart';
import 'package:vestrollmobile/shared/widgets/vestroll_app_bar.dart';

class PersonalDetailsScreen extends StatefulWidget {
  const PersonalDetailsScreen({super.key});

  @override
  State<PersonalDetailsScreen> createState() => _PersonalDetailsScreenState();
}

class _PersonalDetailsScreenState extends State<PersonalDetailsScreen> {
  Country? selectedCountry;
  String? selectedGender;
  Country? selectedDialCodeCountry;

  final TextEditingController _countryOfCitizenshipController =
      TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();

  final List<String> genders = ['Male', 'Female', 'Other', 'Prefer not to say'];

  @override
  void initState() {
    super.initState();
    selectedDialCodeCountry = CountryData.findByDialCode('+234');
  }

  @override
  void dispose() {
    _countryOfCitizenshipController.dispose();
    _phoneController.dispose();
    _dobController.dispose();
    _genderController.dispose();
    super.dispose();
  }

  Future<void> _showCountryDialog() async {
    final result = await showSearchableBottomSheet<Country>(
      context: context,
      title: 'Country of citizenship',
      items: CountryData.countries,
      getItemLabel: (country) => country.name,
      getItemLeading: (country) => country.flag,
    );

    if (result != null) {
      setState(() {
        selectedCountry = result;
        _countryOfCitizenshipController.text = result.name;
      });
    }
  }

  Future<void> _showDialCodeDialog() async {
    final result = await showSearchableBottomSheet<Country>(
      context: context,
      title: 'Dial code',
      items: CountryData.countries,
      getItemLabel: (country) => '${country.name} ${country.dialCode}',
      getItemLeading: (country) => country.flag,
      customFilter: (country, query) {
        return country.name.toLowerCase().contains(query.toLowerCase()) ||
            country.dialCode.contains(query);
      },
    );

    if (result != null) {
      setState(() {
        selectedDialCodeCountry = result;
      });
    }
  }

  Future<void> _showGenderDialog() async {
    final result = await showSelectionDialog<String>(
      context: context,
      title: 'Select Gender',
      items: genders,
      getItemLabel: (gender) => gender,
    );

    if (result != null) {
      setState(() {
        selectedGender = result;
        _genderController.text = result;
      });
    }
  }

  Future<void> _selectDateOfBirth() async {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().subtract(const Duration(days: 365 * 18)),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.dark(
              primary: colors.activeButton,
              onPrimary: Colors.white,
              surface: const Color(0xFF1E1E1E),
              onSurface: Colors.white,
            ),
            dialogBackgroundColor: const Color(0xFF121212),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        _dobController.text =
            "${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year}";
      });
    }
  }

  bool _isFormValid() {
    return _countryOfCitizenshipController.text.isNotEmpty &&
        _genderController.text.isNotEmpty &&
        _dobController.text.isNotEmpty &&
        _phoneController.text.isNotEmpty;
  }

  void _handleContinue() {
    if (_isFormValid()) {
      context.pushNamed(RouteConstants.addressDetails);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;
    final fonts = Theme.of(context).extension<AppFontThemeExtension>()!;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(context.screenWidth(), 60),
        child: const VestrollAppBar(isBack: true, title: ''),
      ),
      body: SafeArea(
        child: Column(
          children: [
            _buildProgressBar(colors),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),
                    _buildHeader(fonts, colors),
                    SizedBox(height: 24.h),
                    _buildFormFields(),
                  ],
                ),
              ),
            ),
            _buildContinueButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressBar(ColorSystemExtension colors) {
    return Container(
      height: 4,
      width: double.infinity,
      color: Colors.grey[200],
      alignment: Alignment.centerLeft,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        height: 4,
        decoration: BoxDecoration(
          color: colors.brandDefault,
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }

  Widget _buildHeader(
    AppFontThemeExtension fonts,
    ColorSystemExtension colors,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Personal Details',
          style: fonts.heading2Bold.copyWith(
            fontSize: 24.sp,
            color: colors.textPrimary,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          'Please provide your personal details, this will be used to complete your profile.',
          style: fonts.bodyMedium.copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: colors.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildFormFields() {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;
    final fonts = Theme.of(context).extension<AppFontThemeExtension>()!;

    return Column(
      children: [
        AppTextField(
          borderRadius: 8.sp,
          hintText: 'Country of citizenship',
          controller: _countryOfCitizenshipController,
          readOnly: true,
          onTap: _showCountryDialog,
          suffixIcon: const Icon(Icons.keyboard_arrow_down),
        ),
        SizedBox(height: 20.h),
        AppTextField(
          borderRadius: 8.sp,
          hintText: 'Gender',
          controller: _genderController,
          readOnly: true,
          onTap: _showGenderDialog,
          suffixIcon: const Icon(Icons.keyboard_arrow_down),
        ),
        SizedBox(height: 20.h),
        AppTextField(
          borderRadius: 8.sp,
          hintText: 'Date of birth',
          controller: _dobController,
          readOnly: true,
          onTap: _selectDateOfBirth,
          suffixIcon: const Icon(Icons.calendar_today_outlined),
        ),
        SizedBox(height: 20.h),
        _buildPhoneNumberField(colors, fonts),
      ],
    );
  }

  Widget _buildPhoneNumberField(
    ColorSystemExtension colors,
    AppFontThemeExtension fonts,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: _showDialCodeDialog,
          child: Container(
            width: 80.w,
            height: 46.h,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            decoration: BoxDecoration(
              border: Border.all(color: colors.gray200),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selectedDialCodeCountry?.dialCode ?? '+234',
                  style: fonts.bodyMedium.copyWith(color: colors.textPrimary),
                ),
                Icon(
                  Icons.keyboard_arrow_down,
                  size: 20,
                  color: colors.textSecondary,
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: AppTextField(
            borderRadius: 8.sp,
            hintText: 'Phone number',
            controller: _phoneController,
            keyboardType: TextInputType.phone,
          ),
        ),
      ],
    );
  }

  Widget _buildContinueButton() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: PrimaryButton(text: 'Continue', onPressed: _handleContinue),
    );
  }
}
