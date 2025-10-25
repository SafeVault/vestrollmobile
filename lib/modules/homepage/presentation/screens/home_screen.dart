import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_font_theme_extension.dart';
import 'package:vestrollmobile/modules/homepage/presentation/screens/theme_demo_screen.dart';
import 'package:vestrollmobile/shared/widgets/theme_toggle_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;
    final fonts = Theme.of(context).extension<AppFontThemeExtension>()!;

    return Scaffold(
      backgroundColor: colors.bgB1,
      appBar: AppBar(
        backgroundColor: colors.bgB0,
        elevation: 0,
        title: Text('VestRoll', style: fonts.heading2Bold),
        actions: const [ThemeToggleButton(), SizedBox(width: 16)],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: colors.bgB0,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: colors.strokePrimary),
              ),
              child: Column(
                children: [
                  Text(
                    'Modern Payroll Management',
                    style: fonts.heading1Bold,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Streamline your payroll operations with AI-powered features, comprehensive contract management, and seamless team collaboration.',
                    style: fonts.textLgRegular.copyWith(
                      color: colors.textSecondary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          context.push('/address-details');
                        },
                        child: Text('Get Started', style: fonts.textMdBold),
                      ),
                      const SizedBox(width: 12),
                      OutlinedButton(
                        onPressed: () {},
                        child: Text('Learn More', style: fonts.textMdBold),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Feature Cards
            Text('Key Features', style: fonts.heading2Bold),
            const SizedBox(height: 16),

            _buildFeatureCard(
              context,
              'Smart Payroll Processing',
              'Automated calculations with AI-powered error detection and compliance monitoring.',
              colors.blue500,
              [
                'Automated tax calculations',
                'Real-time compliance checks',
                'Multi-currency support',
              ],
            ),

            const SizedBox(height: 16),

            _buildFeatureCard(
              context,
              'Contract Management',
              'Flexible contract types with milestone tracking and automated payments.',
              colors.green500,
              [
                'Fixed rate contracts',
                'Pay-as-you-go billing',
                'Milestone-based payments',
              ],
            ),

            const SizedBox(height: 16),

            _buildFeatureCard(
              context,
              'AI-Powered Insights',
              'Advanced analytics and predictive features for better workforce management.',
              colors.orange500,
              [
                'Fraud detection',
                'Predictive analytics',
                'Smart recommendations',
              ],
            ),

            const SizedBox(height: 24),

            // Theme Demo Section
            _buildThemeDemo(context),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureCard(
    BuildContext context,
    String title,
    String description,
    Color accentColor,
    List<String> features,
  ) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;
    final fonts = Theme.of(context).extension<AppFontThemeExtension>()!;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colors.bgB0,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colors.strokePrimary),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: fonts.heading3Bold.copyWith(color: accentColor)),
          const SizedBox(height: 8),
          Text(
            description,
            style: fonts.textBaseRegular.copyWith(color: colors.textSecondary),
          ),
          const SizedBox(height: 16),
          ...features.map(
            (feature) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: accentColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(child: Text(feature, style: fonts.textMdRegular)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildThemeDemo(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;
    final fonts = Theme.of(context).extension<AppFontThemeExtension>()!;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colors.bgB0,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colors.strokePrimary),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Theme System Demo', style: fonts.heading3Bold),
          const SizedBox(height: 8),
          Text(
            'Experience the comprehensive color system and typography with light/dark mode support.',
            style: fonts.textBaseRegular.copyWith(color: colors.textSecondary),
          ),
          const SizedBox(height: 20),

          // Color Palette
          Text('Color Palette', style: fonts.textLgBold),
          const SizedBox(height: 12),
          Row(
            children: [
              _buildColorSwatch('Primary Blue', colors.blue500),
              const SizedBox(width: 12),
              _buildColorSwatch('Success Green', colors.green500),
              const SizedBox(width: 12),
              _buildColorSwatch('Warning Yellow', colors.yellow500),
              const SizedBox(width: 12),
              _buildColorSwatch('Error Red', colors.red500),
            ],
          ),

          const SizedBox(height: 24),

          // Typography Scale
          Text('Typography Scale - Hanken Grotesk', style: fonts.textLgBold),
          const SizedBox(height: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Heading 1 Bold', style: fonts.heading1Bold),
              const SizedBox(height: 8),
              Text('Heading 2 Bold', style: fonts.heading2Bold),
              const SizedBox(height: 8),
              Text('Heading 3 Bold', style: fonts.heading3Bold),
              const SizedBox(height: 8),
              Text('Text Large Bold', style: fonts.textLgBold),
              const SizedBox(height: 8),
              Text('Text Base Bold', style: fonts.textBaseBold),
              const SizedBox(height: 8),
              Text('Text Medium Bold', style: fonts.textMdBold),
              const SizedBox(height: 8),
              Text('Text Small Bold', style: fonts.textSmBold),
              const SizedBox(height: 8),
              Text('Text Extra Small Bold', style: fonts.textXsBold),
            ],
          ),

          const SizedBox(height: 24),

          Center(
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ThemeDemoScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.palette),
              label: Text('View Complete Theme Demo', style: fonts.textMdBold),
              style: ElevatedButton.styleFrom(
                backgroundColor: colors.brandDefault,
                foregroundColor: colors.constantContrast,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildColorSwatch(String label, Color color) {
    return Expanded(
      child: Column(
        children: [
          Container(
            height: 48,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
