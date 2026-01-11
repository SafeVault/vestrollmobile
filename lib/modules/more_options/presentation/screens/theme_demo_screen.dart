import 'package:flutter/material.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_font_theme_extension.dart';
import 'package:vestrollmobile/shared/widgets/theme_toggle_button.dart';

class ThemeDemoScreen extends StatelessWidget {
  const ThemeDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorSystem = Theme.of(context).extension<ColorSystemExtension>()!;
    final fontSystem = Theme.of(context).extension<AppFontThemeExtension>()!;

    return Scaffold(
      backgroundColor: colorSystem.bgB0,
      appBar: AppBar(
        title: Text(
          'Theme System Demo',
          style: fontSystem.heading3Bold.copyWith(
            color: colorSystem.textPrimary,
          ),
        ),
        backgroundColor: colorSystem.bgB1,
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: ThemeToggleButton(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Theme Toggle Section
            _buildSection(
              title: 'Theme Toggle',
              colorSystem: colorSystem,
              fontSystem: fontSystem,
              child: Card(
                color: colorSystem.bgB1,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Switch between light and dark themes:',
                        style: fontSystem.textBaseMedium.copyWith(
                          color: colorSystem.textSecondary,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const ThemeToggleButton(),
                      const SizedBox(height: 12),
                      Text(
                        'Usage: BlocBuilder<ThemeBloc, ThemeState> to listen to theme changes',
                        style: fontSystem.textSmRegular.copyWith(
                          color: colorSystem.textTertiary,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Typography Section
            _buildSection(
              title: 'Typography System',
              colorSystem: colorSystem,
              fontSystem: fontSystem,
              child: Card(
                color: colorSystem.bgB1,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Headings
                      _buildTypographyGroup(
                        'Headings',
                        [
                          _buildTypographyExample(
                            'Heading 1 Bold',
                            'Theme.of(context).extension<AppFontThemeExtension>()!.heading1Bold',
                            fontSystem.heading1Bold,
                            colorSystem.textPrimary,
                          ),
                          _buildTypographyExample(
                            'Heading 2 SemiBold',
                            'fontSystem.heading2SemiBold',
                            fontSystem.heading2SemiBold,
                            colorSystem.textPrimary,
                          ),
                          _buildTypographyExample(
                            'Heading 3 Medium',
                            'fontSystem.heading3Medium',
                            fontSystem.heading3Medium,
                            colorSystem.textPrimary,
                          ),
                        ],
                        colorSystem,
                        fontSystem,
                      ),

                      const SizedBox(height: 16),

                      // Text Styles
                      _buildTypographyGroup(
                        'Text Styles',
                        [
                          _buildTypographyExample(
                            'Text Large Bold',
                            'fontSystem.textLgBold',
                            fontSystem.textLgBold,
                            colorSystem.textPrimary,
                          ),
                          _buildTypographyExample(
                            'Text Base Regular',
                            'fontSystem.textBaseRegular',
                            fontSystem.textBaseRegular,
                            colorSystem.textSecondary,
                          ),
                          _buildTypographyExample(
                            'Text Small Medium',
                            'fontSystem.textSmMedium',
                            fontSystem.textSmMedium,
                            colorSystem.textTertiary,
                          ),
                        ],
                        colorSystem,
                        fontSystem,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Color System Section
            _buildSection(
              title: 'Color System',
              colorSystem: colorSystem,
              fontSystem: fontSystem,
              child: Column(
                children: [
                  // Brand Colors
                  _buildColorGroup(
                    'Brand Colors',
                    [
                      _buildColorSwatch(
                        'Brand Default',
                        colorSystem.brandDefault,
                        'colorSystem.brandDefault',
                      ),
                      _buildColorSwatch(
                        'Brand Hover',
                        colorSystem.brandHover,
                        'colorSystem.brandHover',
                      ),
                      _buildColorSwatch(
                        'Brand Active',
                        colorSystem.brandActive,
                        'colorSystem.brandActive',
                      ),
                    ],
                    colorSystem,
                    fontSystem,
                  ),

                  const SizedBox(height: 16),

                  // Text Colors
                  _buildColorGroup(
                    'Text Colors',
                    [
                      _buildColorSwatch(
                        'Text Primary',
                        colorSystem.textPrimary,
                        'colorSystem.textPrimary',
                      ),
                      _buildColorSwatch(
                        'Text Secondary',
                        colorSystem.textSecondary,
                        'colorSystem.textSecondary',
                      ),
                      _buildColorSwatch(
                        'Text Tertiary',
                        colorSystem.textTertiary,
                        'colorSystem.textTertiary',
                      ),
                    ],
                    colorSystem,
                    fontSystem,
                  ),

                  const SizedBox(height: 16),

                  // Semantic Colors
                  _buildColorGroup(
                    'Semantic Colors',
                    [
                      _buildColorSwatch(
                        'Success',
                        colorSystem.success,
                        'colorSystem.success',
                      ),
                      _buildColorSwatch(
                        'Warning',
                        colorSystem.warning,
                        'colorSystem.warning',
                      ),
                      _buildColorSwatch(
                        'Danger',
                        colorSystem.danger,
                        'colorSystem.danger',
                      ),
                      _buildColorSwatch(
                        'Info',
                        colorSystem.info,
                        'colorSystem.info',
                      ),
                    ],
                    colorSystem,
                    fontSystem,
                  ),

                  const SizedBox(height: 16),

                  // Blue Palette
                  _buildColorPalette(
                    'Blue Palette',
                    [
                      colorSystem.blue50,
                      colorSystem.blue100,
                      colorSystem.blue200,
                      colorSystem.blue300,
                      colorSystem.blue400,
                      colorSystem.blue500,
                      colorSystem.blue600,
                      colorSystem.blue700,
                      colorSystem.blue800,
                      colorSystem.blue900,
                      colorSystem.blue950,
                    ],
                    'colorSystem.blue[50-950]',
                    colorSystem,
                    fontSystem,
                  ),

                  const SizedBox(height: 16),

                  // Green Palette
                  _buildColorPalette(
                    'Green Palette',
                    [
                      colorSystem.green50,
                      colorSystem.green100,
                      colorSystem.green200,
                      colorSystem.green300,
                      colorSystem.green400,
                      colorSystem.green500,
                      colorSystem.green600,
                      colorSystem.green700,
                      colorSystem.green800,
                      colorSystem.green900,
                      colorSystem.green950,
                    ],
                    'colorSystem.green[50-950]',
                    colorSystem,
                    fontSystem,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Usage Examples Section
            _buildSection(
              title: 'Usage Examples',
              colorSystem: colorSystem,
              fontSystem: fontSystem,
              child: Card(
                color: colorSystem.bgB1,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'How to use in your widgets:',
                        style: fontSystem.textBaseBold.copyWith(
                          color: colorSystem.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Code example container
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: colorSystem.bgB2,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: colorSystem.strokePrimary),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '// Get theme extensions',
                              style: fontSystem.textSmRegular.copyWith(
                                color: colorSystem.textTertiary,
                                fontFamily: 'monospace',
                              ),
                            ),
                            Text(
                              'final colorSystem = Theme.of(context).extension<ColorSystemExtension>()!;',
                              style: fontSystem.textSmRegular.copyWith(
                                color: colorSystem.textPrimary,
                                fontFamily: 'monospace',
                              ),
                            ),
                            Text(
                              'final fontSystem = Theme.of(context).extension<AppFontThemeExtension>()!;',
                              style: fontSystem.textSmRegular.copyWith(
                                color: colorSystem.textPrimary,
                                fontFamily: 'monospace',
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '// Use in widgets',
                              style: fontSystem.textSmRegular.copyWith(
                                color: colorSystem.textTertiary,
                                fontFamily: 'monospace',
                              ),
                            ),
                            Text(
                              'Text("Hello", style: fontSystem.heading2Bold.copyWith(color: colorSystem.brandDefault))',
                              style: fontSystem.textSmRegular.copyWith(
                                color: colorSystem.textPrimary,
                                fontFamily: 'monospace',
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Example buttons
                      Text(
                        'Example Buttons:',
                        style: fontSystem.textBaseBold.copyWith(
                          color: colorSystem.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: colorSystem.brandDefault,
                              foregroundColor: colorSystem.constantContrast,
                            ),
                            child: Text(
                              'Primary Button',
                              style: fontSystem.textSmMedium,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: colorSystem.success,
                              foregroundColor: colorSystem.constantContrast,
                            ),
                            child: Text(
                              'Success Button',
                              style: fontSystem.textSmMedium,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: colorSystem.danger,
                              foregroundColor: colorSystem.constantContrast,
                            ),
                            child: Text(
                              'Danger Button',
                              style: fontSystem.textSmMedium,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required ColorSystemExtension colorSystem,
    required AppFontThemeExtension fontSystem,
    required Widget child,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: fontSystem.heading2Bold.copyWith(
            color: colorSystem.textPrimary,
          ),
        ),
        const SizedBox(height: 12),
        child,
      ],
    );
  }

  Widget _buildTypographyGroup(
    String title,
    List<Widget> examples,
    ColorSystemExtension colorSystem,
    AppFontThemeExtension fontSystem,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: fontSystem.textLgBold.copyWith(color: colorSystem.textPrimary),
        ),
        const SizedBox(height: 8),
        ...examples,
      ],
    );
  }

  Widget _buildTypographyExample(
    String text,
    String usage,
    TextStyle style,
    Color color,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text, style: style.copyWith(color: color)),
          Text(
            usage,
            style: TextStyle(
              fontSize: 12,
              color: color.withValues(alpha: 0.6),
              fontFamily: 'monospace',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildColorGroup(
    String title,
    List<Widget> swatches,
    ColorSystemExtension colorSystem,
    AppFontThemeExtension fontSystem,
  ) {
    return Card(
      color: colorSystem.bgB1,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: fontSystem.textLgBold.copyWith(
                color: colorSystem.textPrimary,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(spacing: 8, runSpacing: 8, children: swatches),
          ],
        ),
      ),
    );
  }

  Widget _buildColorSwatch(String name, Color color, String usage) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.withValues(alpha: 0.3)),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          name,
          style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
        Text(
          usage,
          style: TextStyle(
            fontSize: 8,
            color: Colors.grey[600],
            fontFamily: 'monospace',
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildColorPalette(
    String title,
    List<Color> colors,
    String usage,
    ColorSystemExtension colorSystem,
    AppFontThemeExtension fontSystem,
  ) {
    return Card(
      color: colorSystem.bgB1,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: fontSystem.textLgBold.copyWith(
                color: colorSystem.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              usage,
              style: fontSystem.textSmRegular.copyWith(
                color: colorSystem.textTertiary,
                fontFamily: 'monospace',
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children:
                  colors.map((color) {
                    return Expanded(
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: color,
                          border: Border.all(
                            color: Colors.grey.withValues(alpha: 0.2),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
