// lib/modules/authentication/presentation/screens/user_type_selection_screen.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vestrollmobile/core/navigation/routes_constant.dart';
import 'package:vestrollmobile/modules/authentication/presentation/widgets/account_type_card.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_color_extension.dart';

enum AccountType { freelancer, contractor }

class UserTypeSelectionScreen extends StatefulWidget {
  final VoidCallback? onContinue;

  const UserTypeSelectionScreen({super.key, this.onContinue});

  @override
  State<UserTypeSelectionScreen> createState() =>
      _UserTypeSelectionScreenState();
}

class _UserTypeSelectionScreenState extends State<UserTypeSelectionScreen> {
  AccountType? selectedAccountType;

  static const int currentProgressStep = 1;
  static const int totalProgressSteps = 3;

  Color getBrandColor(BuildContext context) {
    final colorExtension = Theme.of(context).extension<ColorSystemExtension>();
    if (colorExtension?.brandDefault != null) {
      return colorExtension!.brandDefault!;
    }
    return Theme.of(context).colorScheme.primary;
  }

  void handleContinuePressed() {
    if (widget.onContinue != null) {
      widget.onContinue!();
      return;
    }

    context.goNamed(RouteConstants.addressDetails);
  }

  Widget buildProgressIndicator(Color brandColor) {
    return Row(
      children: List.generate(totalProgressSteps, (index) {
        final isActive = index < currentProgressStep;
        return Expanded(
          child: Container(
            height: 6,
            margin: EdgeInsets.only(
              right: index < (totalProgressSteps - 1) ? 4 : 0,
            ),
            decoration: BoxDecoration(
              color: isActive ? brandColor : brandColor.withOpacity(0.12),
              borderRadius: BorderRadius.circular(3),
            ),
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final brandColor = getBrandColor(context);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              buildProgressIndicator(brandColor),

              const SizedBox(height: 24),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Account Type',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),

              const SizedBox(height: 8),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Choose whether you're registering as a freelancer or a contractor.",
                  style: theme.textTheme.bodyMedium,
                ),
              ),

              const SizedBox(height: 20),

              AccountTypeCard(
                cardKey: const Key('freelancer_card'),
                icon: Icons.person,
                title: 'Freelancer account',
                description:
                    'You work independently; manage your own contracts and payments directly with clients.',
                selected: selectedAccountType == AccountType.freelancer,
                onTap: () {
                  setState(() {
                    selectedAccountType = AccountType.freelancer;
                  });
                },
              ),

              const SizedBox(height: 12),

              AccountTypeCard(
                cardKey: const Key('contractor_card'),
                icon: Icons.work,
                title: 'Contractor account',
                description:
                    'You\'re contracted to work for a company or organization on specific projects or terms.',
                selected: selectedAccountType == AccountType.contractor,
                onTap: () {
                  setState(() {
                    selectedAccountType = AccountType.contractor;
                  });
                },
              ),

              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  key: const Key('continue_button'),
                  onPressed:
                      selectedAccountType == null
                          ? null
                          : handleContinuePressed,
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor:
                        selectedAccountType == null ? null : brandColor,
                    foregroundColor:
                        selectedAccountType == null ? null : Colors.white,
                  ),
                  child: const Text('Continue'),
                ),
              ),

              const SizedBox(height: 12), // Bottom padding
            ],
          ),
        ),
      ),
    );
  }
}
