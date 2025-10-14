// lib/modules/authentication/presentation/screens/personal_details_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vestrollmobile/core/navigation/routes_constant.dart';
import 'package:vestrollmobile/core/utils/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/app_font_theme_extension.dart';
import 'package:vestrollmobile/modules/authentication/presentation/bloc/personal_details_bloc.dart';
import 'package:vestrollmobile/modules/authentication/presentation/widgets/dial_code_modal.dart';

class PersonalDetailsScreen extends StatelessWidget {
  const PersonalDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PersonalDetailsBloc(),
      child: const _PersonalDetailsView(),
    );
  }
}

class _PersonalDetailsView extends StatefulWidget {
  const _PersonalDetailsView();

  @override
  State<_PersonalDetailsView> createState() => _PersonalDetailsViewState();
}

class _PersonalDetailsViewState extends State<_PersonalDetailsView> {
  final _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  void _openDialModal(BuildContext ctx, {required bool showDialCode}) {
    showModalBottomSheet(
      context: ctx,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder:
          (_) => DialCodeModal(
            countries: kCountries,
            showDialCode: showDialCode,
            onSelected: (country) {
              if (showDialCode) {
                ctx.read<PersonalDetailsBloc>().add(DialCodeChanged(country));
              } else {
                ctx.read<PersonalDetailsBloc>().add(
                  CitizenshipChanged(country),
                );
              }
            },
          ),
    );
  }

  Future<void> _pickDate(BuildContext context) async {
    final initial = DateTime(1995, 1, 1);
    final first = DateTime(1900);
    final last = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: first,
      lastDate: last,
    );
    if (picked != null) {
      context.read<PersonalDetailsBloc>().add(DobChanged(picked));
    }
  }

  @override
  Widget build(BuildContext context) {
    final effectiveColors =
        Theme.of(context).extension<ColorSystemExtension>() ??
        ColorSystemExtension.light();
    final fonts = Theme.of(context).extension<AppFontThemeExtension>();
    final effectiveFonts =
        fonts ??
        AppFontThemeExtension.fromTextTheme(
          Theme.of(context).textTheme,
          Colors.black,
        );

    return Scaffold(
      backgroundColor: effectiveColors.bgB0,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                border: Border.all(color: effectiveColors.strokeSecondary),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  const Icon(Icons.help_outline, size: 16),
                  const SizedBox(width: 6),
                  Text('Need Help?', style: effectiveFonts.textSmRegular),
                ],
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
          child: Column(
            children: [
              // 3-segment progress bar
              Row(
                children: List.generate(3, (index) {
                  return Expanded(
                    child: Container(
                      height: 6,
                      margin: EdgeInsets.only(
                        right: index < 2 ? 4 : 0,
                      ), // gap between segments
                      decoration: BoxDecoration(
                        color:
                            index <= 1
                                ? effectiveColors
                                    .brandActive // completed segments
                                : effectiveColors.brandActive.withOpacity(
                                  0.12,
                                ), // pending
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 18),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Personal Details',
                  style: effectiveFonts.heading1Bold.copyWith(fontSize: 22),
                ),
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Please provide your personal details, this will be used to complete your profile.',
                  style: effectiveFonts.textBaseRegular.copyWith(
                    fontSize: 14, // smaller font
                    fontWeight: FontWeight.normal, // unbold
                    color: effectiveColors.textPrimary.withOpacity(
                      0.5,
                    ), // faded
                  ),
                ),
              ),
              const SizedBox(height: 20),

              Expanded(
                child: BlocBuilder<PersonalDetailsBloc, PersonalDetailsState>(
                  builder: (context, state) {
                    return Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            key: const Key('citizenship_field'),
                            onTap:
                                () => _openDialModal(
                                  context,
                                  showDialCode: false,
                                ),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 16,
                              ),
                              decoration: BoxDecoration(
                                color: effectiveColors.bgB0,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: effectiveColors.gray200,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      state.citizenship?.name ??
                                          'Country of citizenship',
                                      style: effectiveFonts.textBaseRegular
                                          .copyWith(
                                            color:
                                                state.citizenship != null
                                                    ? effectiveColors
                                                        .textPrimary
                                                    : effectiveColors
                                                        .textSecondary,
                                          ),
                                    ),
                                  ),
                                  const Icon(Icons.keyboard_arrow_down),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),

                          DropdownButtonFormField<String>(
                            key: const Key('gender_field'),
                            value: state.gender,
                            decoration: InputDecoration(
                              hintText: 'Gender',
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 14,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            items: const [
                              DropdownMenuItem(
                                value: 'Male',
                                child: Text('Male'),
                              ),
                              DropdownMenuItem(
                                value: 'Female',
                                child: Text('Female'),
                              ),
                              DropdownMenuItem(
                                value: 'Other',
                                child: Text('Other'),
                              ),
                            ],
                            onChanged: (v) {
                              if (v != null) {
                                context.read<PersonalDetailsBloc>().add(
                                  GenderChanged(v),
                                );
                              }
                            },
                          ),
                          const SizedBox(height: 12),

                          InkWell(
                            key: const Key('dob_field'),
                            onTap: () => _pickDate(context),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 16,
                              ),
                              decoration: BoxDecoration(
                                color: effectiveColors.bgB0,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: effectiveColors.gray200,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      state.dob == null
                                          ? 'Date of birth'
                                          : _formatDate(state.dob!),
                                      style: effectiveFonts.textBaseRegular
                                          .copyWith(
                                            color:
                                                state.dob != null
                                                    ? effectiveColors
                                                        .textPrimary
                                                    : effectiveColors
                                                        .textSecondary,
                                          ),
                                    ),
                                  ),
                                  const Icon(Icons.calendar_today),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),

                          Row(
                            children: [
                              InkWell(
                                key: const Key('dial_code_button'),
                                onTap:
                                    () => _openDialModal(
                                      context,
                                      showDialCode: true,
                                    ),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 12,
                                  ),
                                  decoration: BoxDecoration(
                                    color: effectiveColors.bgB0,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: effectiveColors.gray200,
                                    ),
                                  ),
                                  child: Text(
                                    state.dialCountry != null
                                        ? '${state.dialCountry!.flag} ${state.dialCountry!.dialCode}'
                                        : '🇳🇬 +234',
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: TextFormField(
                                  key: const Key('phone_input'),
                                  controller: _phoneController,
                                  keyboardType: TextInputType.phone,
                                  decoration: const InputDecoration(
                                    hintText: 'Phone number',
                                    border: OutlineInputBorder(),
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 12,
                                    ),
                                  ),
                                  onChanged:
                                      (v) => context
                                          .read<PersonalDetailsBloc>()
                                          .add(PhoneChanged(v)),
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),

                          SizedBox(
                            width: double.infinity,
                            height: 52,
                            child: ElevatedButton(
                              key: const Key('continue_button'),
                              onPressed:
                                  state.isValid
                                      ? () => context.goNamed(
                                        RouteConstants.addressDetails,
                                      )
                                      : null,
                              child: const Text('Continue'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    state.isValid
                                        ? effectiveColors
                                            .brandActive // purple when valid
                                        : effectiveColors
                                            .gray400, // grey when disabled
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime d) =>
      '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
}
