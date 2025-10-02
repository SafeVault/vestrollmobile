import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vestrollmobile/core/utils/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/app_font_theme_extension.dart';
import 'package:vestrollmobile/shared/models/country_model.dart';

class CountrySelectionModal extends StatefulWidget {
  final Country? selectedCountry;
  final Function(Country) onCountrySelected;

  const CountrySelectionModal({
    super.key,
    this.selectedCountry,
    required this.onCountrySelected,
  });

  @override
  State<CountrySelectionModal> createState() => _CountrySelectionModalState();
}

class _CountrySelectionModalState extends State<CountrySelectionModal> {
  final TextEditingController _searchController = TextEditingController();
  List<Country> _filteredCountries = CountryData.countries;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterCountries);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterCountries() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        _filteredCountries = CountryData.countries;
      } else {
        _filteredCountries = CountryData.countries
            .where((country) => country.name.toLowerCase().contains(query))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;
    final fonts = Theme.of(context).extension<AppFontThemeExtension>()!;

    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      decoration: BoxDecoration(
        color: colors.bgB0,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      child: Column(
        children: [
          // Modal handle
          Container(
            width: 40.w,
            height: 4.h,
            margin: EdgeInsets.only(top: 12.h, bottom: 20.h),
            decoration: BoxDecoration(
              color: colors.strokeSecondary,
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),

          // Title
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Country of citizenship',
                style: fonts.heading2Bold.copyWith(
                  color: colors.textPrimary,
                  fontSize: 24.sp,
                ),
              ),
            ),
          ),

          SizedBox(height: 24.h),

          // Search bar
          Padding(
            padding: EdgeInsets.only(left: 24.w, right: 24.w),
            child: Container(
              height: 40.h,
              decoration: BoxDecoration(
                color: colors.bgB0,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(
                  color: colors.gray200.withOpacity(0.4),
                  width: 1,
                ),
              ),
              child: TextField(
                controller: _searchController,
                textAlignVertical: TextAlignVertical.center,
                style: fonts.textBaseRegular.copyWith(
                  color: colors.textPrimary,
                ),
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: fonts.textBaseRegular.copyWith(
                    color: colors.textTertiary,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: colors.textTertiary,
                    size: 20.sp,
                  ),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 0.h,
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: 20.h),

          // Countries list
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              itemCount: _filteredCountries.length,
              itemBuilder: (context, index) {
                final country = _filteredCountries[index];
                final isSelected = widget.selectedCountry?.code == country.code;

                return GestureDetector(
                  onTap: () => widget.onCountrySelected(country),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 12.h,
                    ),
                    margin: EdgeInsets.only(bottom: 4.h),
                    decoration: BoxDecoration(
                      color: isSelected ? colors.brandFill : Colors.transparent,
                      borderRadius: BorderRadius.circular(12.r),
                      border: isSelected 
                          ? Border.all(color: colors.brandDefault, width: 1.5)
                          : null,
                    ),
                    child: Row(
                      children: [
                        // Country flag
                        Container(
                          width: 32.w,
                          height: 32.w,
                          decoration: BoxDecoration(
                            color: colors.gray100,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              country.flag,
                              style: TextStyle(fontSize: 20.sp),
                            ),
                          ),
                        ),

                        SizedBox(width: 16.w),

                        // Country name
                        Expanded(
                          child: Text(
                            country.name,
                            style: fonts.textBaseRegular.copyWith(
                              color: colors.textPrimary,
                              fontSize: 16.sp,
                              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                            ),
                          ),
                        ),

                        // Selected indicator
                        if (isSelected)
                          Icon(
                            Icons.check_circle,
                            color: colors.brandDefault,
                            size: 20.sp,
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
