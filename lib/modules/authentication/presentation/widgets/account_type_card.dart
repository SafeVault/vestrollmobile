// lib/modules/authentication/presentation/widgets/account_type_card.dart
import 'package:flutter/material.dart';
import 'package:vestrollmobile/core/utils/app_color_extension.dart';

class AccountTypeCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final bool selected;
  final VoidCallback? onTap;
  final Key? cardKey;

  const AccountTypeCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    this.selected = false,
    this.onTap,
    this.cardKey,
  });

  Color getBrandColor(BuildContext context) {
    final colorExtension = Theme.of(context).extension<ColorSystemExtension>();

    if (colorExtension?.brandDefault != null) {
      return colorExtension!.brandDefault;
    }

    return Theme.of(context).colorScheme.primary;
  }

  @override
  Widget build(BuildContext context) {
    final brandColor = getBrandColor(context);
    final theme = Theme.of(context);

    Color borderColor;
    Color backgroundColor;

    if (selected) {
      borderColor = brandColor;
      backgroundColor = brandColor.withOpacity(0.06);
    } else {
      borderColor = theme.dividerColor;
      backgroundColor = theme.canvasColor;
    }

    return InkWell(
      key: cardKey,
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: borderColor, width: selected ? 2 : 1),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildIconContainer(brandColor),

            const SizedBox(width: 16),

            Expanded(child: _buildContentSection(context)),

            if (selected) _buildSelectedIndicator(brandColor),
          ],
        ),
      ),
    );
  }

  Widget _buildIconContainer(Color brandColor) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: selected ? brandColor : brandColor.withOpacity(0.12),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: 22, color: selected ? Colors.white : brandColor),
    );
  }

  Widget _buildContentSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
        ),

        const SizedBox(height: 6),

        Text(description, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }

  Widget _buildSelectedIndicator(Color brandColor) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Icon(Icons.check_circle, color: brandColor, size: 20),
    );
  }
}
