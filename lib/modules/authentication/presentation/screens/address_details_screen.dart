import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_font_theme_extension.dart';
import 'package:vestrollmobile/modules/authentication/presentation/bloc/address_form_bloc/address_form_bloc.dart';
import 'package:vestrollmobile/modules/authentication/presentation/bloc/address_form_bloc/address_form_event.dart';
import 'package:vestrollmobile/modules/authentication/presentation/bloc/address_form_bloc/address_form_state.dart';
import 'package:vestrollmobile/modules/authentication/presentation/widgets/country_selection_modal.dart';

class AddressDetailsScreen extends StatefulWidget {
  const AddressDetailsScreen({super.key});

  @override
  State<AddressDetailsScreen> createState() => _AddressDetailsScreenState();
}

class _AddressDetailsScreenState extends State<AddressDetailsScreen> {
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _postalCodeController = TextEditingController();

  @override
  void dispose() {
    _streetController.dispose();
    _cityController.dispose();
    _postalCodeController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  void _showCountryModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => CountrySelectionModal(
        selectedCountry: context.read<AddressFormBloc>().state.selectedCountry,
        onCountrySelected: (country) {
          print('Country selected: ${country.name}');
          context.read<AddressFormBloc>().add(CountryChanged(country));
          Navigator.pop(context);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;
    final fonts = Theme.of(context).extension<AppFontThemeExtension>()!;

    return BlocProvider(
      create: (context) => AddressFormBloc(),
      child: Scaffold(
        backgroundColor: colors.bgB0,
        body: SafeArea(
          child: BlocListener<AddressFormBloc, AddressFormState>(
            listener: (context, state) {
              if (state.status == FormStatus.success) {
                context.push('/profile-creation-success');
              } else if (state.status == FormStatus.failure && 
                         state.errorMessage != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.errorMessage!),
                    backgroundColor: colors.red500,
                  ),
                );
              }
            },
            child: Column(
              children: [
                // Header with back button and help
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () => context.pop(),
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: colors.textPrimary,
                          size: 20.sp,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 8.h,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: colors.strokeSecondary),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.help_outline,
                              size: 16.sp,
                              color: colors.textSecondary,
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              'Need Help?',
                              style: fonts.textSmRegular.copyWith(
                                color: colors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Progress indicator
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 4.h,
                          decoration: BoxDecoration(
                            color: colors.brandActive, // First step - active
                            borderRadius: BorderRadius.circular(2.r),
                          ),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: Container(
                          height: 4.h,
                          decoration: BoxDecoration(
                            color: colors.gray200, // Second step - inactive
                            borderRadius: BorderRadius.circular(2.r),
                          ),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: Container(
                          height: 4.h,
                          decoration: BoxDecoration(
                            color: colors.gray200, // Third step - inactive
                            borderRadius: BorderRadius.circular(2.r),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 32.h),

                // Content
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title
                        Text(
                          'Address Details',
                          style: fonts.heading1Bold.copyWith(
                            color: colors.textPrimary,
                            fontSize: 28.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),

                        SizedBox(height: 12.h),

                        // Subtitle
                        Text(
                          'Please provide your address details, this will be used to complete your profile.',
                          style: fonts.textLgRegular.copyWith(
                            color: colors.textSecondary,
                            fontSize: 14.sp,
                            height: 1.4,
                          ),
                        ),

                        SizedBox(height: 40.h),

                        // Form fields
                        Expanded(
                          child: BlocBuilder<AddressFormBloc, AddressFormState>(
                            builder: (context, state) {
                              return Column(
                                children: [
                                  // Country field
                                  _buildCountryField(context, state, colors, fonts),

                                  SizedBox(height: 20.h),

                                  // Street field
                                  _buildTextField(
                                    controller: _streetController,
                                    label: 'Street',
                                    error: state.fieldErrors['street'],
                                    colors: colors,
                                    fonts: fonts,
                                    onChanged: (value) {
                                      context.read<AddressFormBloc>().add(StreetChanged(value));
                                    },
                                  ),

                                  SizedBox(height: 20.h),

                                  // City field
                                  _buildTextField(
                                    controller: _cityController,
                                    label: 'City',
                                    error: state.fieldErrors['city'],
                                    colors: colors,
                                    fonts: fonts,
                                    onChanged: (value) {
                                      context.read<AddressFormBloc>().add(CityChanged(value));
                                    },
                                  ),

                                  SizedBox(height: 20.h),

                                  // Postal code field
                                  _buildTextField(
                                    controller: _postalCodeController,
                                    label: 'Postal / zip code',
                                    error: state.fieldErrors['postalCode'],
                                    colors: colors,
                                    fonts: fonts,
                                    onChanged: (value) {
                                      context.read<AddressFormBloc>().add(PostalCodeChanged(value));
                                    },
                                  ),

                                  const Spacer(),

                                  // Submit button
                                  SizedBox(
                                    width: double.infinity,
                                    height: 56.h,
                                    child: ElevatedButton(
                                      onPressed: state.isValid && state.status != FormStatus.loading
                                          ? () {
                                              context.read<AddressFormBloc>().add(const FormSubmitted());
                                            }
                                          : null,
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: state.isValid
                                            ? colors.brandActive
                                            : colors.gray200,
                                        foregroundColor: state.isValid
                                            ? colors.constantContrast
                                            : colors.gray400,
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(12.r),
                                        ),
                                        disabledBackgroundColor: colors.gray200,
                                        disabledForegroundColor: colors.gray400,
                                      ),
                                      child: state.status == FormStatus.loading
                                          ? SizedBox(
                                              width: 20.w,
                                              height: 20.w,
                                              child: const CircularProgressIndicator(
                                                strokeWidth: 2,
                                                valueColor: AlwaysStoppedAnimation<Color>(
                                                  Colors.white,
                                                ),
                                              ),
                                            )
                                          : Text(
                                              'Finish setup',
                                              style: fonts.textMdBold.copyWith(
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                    ),
                                  ),

                                  SizedBox(height: 40.h),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCountryField(
    BuildContext context,
    AddressFormState state,
    ColorSystemExtension colors,
    AppFontThemeExtension fonts,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: _showCountryModal,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
            decoration: BoxDecoration(
              color: colors.bgB0,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color: state.fieldErrors['country'] != null
                    ? colors.red500
                    : colors.gray200.withOpacity(0.4),
                width: 1,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    state.selectedCountry?.name ?? 'Country',
                    style: fonts.textBaseRegular.copyWith(
                      color: state.selectedCountry != null
                          ? colors.textPrimary
                          : colors.textSecondary,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: colors.textSecondary,
                  size: 20.sp,
                ),
              ],
            ),
          ),
        ),
        if (state.fieldErrors['country'] != null)
          Padding(
            padding: EdgeInsets.only(top: 4.h, left: 4.w),
            child: Text(
              state.fieldErrors['country']!,
              style: fonts.textSmRegular.copyWith(
                color: colors.red500,
                fontSize: 12.sp,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    String? error,
    required ColorSystemExtension colors,
    required AppFontThemeExtension fonts,
    required Function(String) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: colors.bgB0,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: error != null 
                  ? colors.red500 
                  : colors.gray200.withOpacity(0.4),
              width: 1,
            ),
          ),
          child: TextField(
            controller: controller,
            onChanged: onChanged,
            style: fonts.textBaseRegular.copyWith(
              color: colors.textPrimary,
              fontSize: 16.sp,
            ),
            decoration: InputDecoration(
              hintText: label,
              hintStyle: fonts.textBaseRegular.copyWith(
                color: colors.textSecondary,
                fontSize: 16.sp,
              ),
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 18.h,
              ),
            ),
          ),
        ),
        if (error != null)
          Padding(
            padding: EdgeInsets.only(top: 6.h, left: 4.w),
            child: Text(
              error,
              style: fonts.textSmRegular.copyWith(
                color: colors.red500,
                fontSize: 12.sp,
              ),
            ),
          ),
      ],
    );
  }
}
