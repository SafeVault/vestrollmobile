import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_color_extension.dart';
import 'package:vestrollmobile/theme_bloc.dart';

class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;

    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        return IconButton(
          onPressed: () => context.read<ThemeBloc>().add(ThemeToggled()),
          icon: Icon(
            themeState.isDarkMode ? Icons.light_mode : Icons.dark_mode,
            color: colors.textPrimary,
          ),
          tooltip:
              themeState.isDarkMode
                  ? 'Switch to Light Mode'
                  : 'Switch to Dark Mode',
        );
      },
    );
  }
}
