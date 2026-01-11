import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_font_theme_extension.dart';

class TermsAgreementText extends StatelessWidget {
  const TermsAgreementText({super.key});

  // Function to launch URLs
  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;
    final fonts = Theme.of(context).extension<AppFontThemeExtension>()!;

    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: fonts.textSmRegular.copyWith(
          fontSize: 12.sp,
          color: colors.textSecondary,
        ),
        children: [
          const TextSpan(text: 'By creating an account, you agree to our '),
          TextSpan(
            text: 'Terms of Service',
            style: fonts.textSmRegular.copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeight.w800,
              color: colors.brandDefault,
            ),
            recognizer:
                TapGestureRecognizer()
                  ..onTap = () => _launchUrl('https://yourapp.com/terms'),
          ),
          const TextSpan(text: ', '),
          TextSpan(
            text: 'Product T&Cs',
            style: fonts.textSmRegular.copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeight.w800,
              color: colors.brandDefault,
            ),
            recognizer:
                TapGestureRecognizer()
                  ..onTap =
                      () => _launchUrl('https://yourapp.com/product-terms'),
          ),
          const TextSpan(text: ', & '),
          TextSpan(
            text: 'Privacy Policy',
            style: fonts.textSmRegular.copyWith(
              fontSize: 12.sp,
              color: colors.brandDefault,
              fontWeight: FontWeight.w800,
            ),
            recognizer:
                TapGestureRecognizer()
                  ..onTap = () => _launchUrl('https://yourapp.com/privacy'),
          ),
          const TextSpan(text: '.'),
        ],
      ),
    );
  }
}
