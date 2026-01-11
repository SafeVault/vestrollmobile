// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:vestrollmobile/core/navigation/routes_constant.dart';
import 'package:vestrollmobile/core/utils/managers/config.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_font_theme_extension.dart';
import 'package:vestrollmobile/modules/identity_and_multifactor/data/models/country_model.dart';
import 'package:vestrollmobile/shared/widgets/app_textfiled.dart';
import 'package:vestrollmobile/shared/widgets/bottom_sheet.dart';
import 'package:vestrollmobile/shared/widgets/primary_button.dart';
import 'package:vestrollmobile/shared/widgets/vestroll_app_bar.dart';

class AddressDetailsScreen extends StatefulWidget {
  const AddressDetailsScreen({super.key});

  @override
  State<AddressDetailsScreen> createState() => _AddressDetailsScreenState();
}

class _AddressDetailsScreenState extends State<AddressDetailsScreen> {
  Country? selectedCountry;

  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _postalCodeController = TextEditingController();

  @override
  void dispose() {
    _addressController.dispose();
    _postalCodeController.dispose();
    _cityController.dispose();
    _countryController.dispose();
    super.dispose();
  }

  Future<void> _showCountryDialog() async {
    final result = await showSearchableBottomSheet<Country>(
      context: context,
      title: 'Select Country',
      items: CountryData.countries,
      getItemLabel: (country) => country.name,
      getItemLeading: (country) => country.flag,
    );

    if (result != null) {
      setState(() {
        selectedCountry = result;
        _countryController.text = result.name;
      });
    }
  }

  bool _isFormValid() {
    return _countryController.text.isNotEmpty &&
        _addressController.text.isNotEmpty &&
        _cityController.text.isNotEmpty &&
        _postalCodeController.text.isNotEmpty;
  }

  void _handleFinishSetup() {
    if (_isFormValid()) {
      context.pushNamed(RouteConstants.profileCreated);
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
            _buildFinishButton(),
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
        width: MediaQuery.of(context).size.width * 0.8,
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
          'Address Details',
          style: fonts.heading2Bold.copyWith(
            fontSize: 24.sp,
            color: colors.textPrimary,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          'Please provide your address details, this will be used to complete your profile.',
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
    return Column(
      children: [
        AppTextField(
          borderRadius: 8.sp,
          hintText: 'Country',
          controller: _countryController,
          readOnly: true,
          onTap: _showCountryDialog,
          suffixIcon: const Icon(Icons.keyboard_arrow_down),
        ),
        SizedBox(height: 16.h),
        AppTextField(
          borderRadius: 8.sp,
          hintText: 'Street',
          controller: _addressController,
          keyboardType: TextInputType.streetAddress,
        ),
        SizedBox(height: 16.h),
        AppTextField(
          borderRadius: 8.sp,
          hintText: 'City',
          controller: _cityController,
          keyboardType: TextInputType.text,
        ),
        SizedBox(height: 16.h),
        AppTextField(
          borderRadius: 8.sp,
          hintText: 'Postal / zip code',
          controller: _postalCodeController,
          keyboardType: TextInputType.text,
        ),
      ],
    );
  }

  Widget _buildFinishButton() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: PrimaryButton(text: 'Finish setup', onPressed: _handleFinishSetup),
    );
  }
}
