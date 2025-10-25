import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:vestrollmobile/core/utils/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/app_font_theme_extension.dart';

enum PrefixType { none, phone, name, customIcon, customWidget }

enum SuffixType { none, defaultt, customIcon, customWidget }

enum InputFormatterType { none, phone, amount, custom }

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    required TextEditingController controller,
    this.initialValue,
    this.bgColour,
    this.keyboardType,
    this.labelText,
    this.textColor,
    this.hintText,
    this.prefixType = PrefixType.none,
    this.prefixIcon,
    this.prefixWidget,
    this.suffixType = SuffixType.none,
    this.suffixIcon,
    this.suffixWidget,
    this.inputFormatterType = InputFormatterType.none,
    this.inputFormatters,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.readOnly = false,
    this.onTap,
    this.errorTextOnValidation = 'Field required',
    this.customValidator,
    this.onChanged,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.validate = true,
    this.borderRadius = 16,
    this.focusNode,
    this.suffixIconConstraints,
    this.prefixIconConstraints,
    this.constraints,
    this.enabled = true,
    this.hintColor,
    this.hideText = false,
    this.textInputAction = TextInputAction.next,
    this.textCapitalization = TextCapitalization.sentences,
  }) : _controller = controller;

  final TextEditingController _controller;
  final Color? bgColour;
  final TextInputType? keyboardType;
  final String? labelText;
  final String? hintText;
  final Color? textColor;
  final String? initialValue;
  final PrefixType prefixType;
  final Widget? prefixIcon;
  final Widget? prefixWidget;
  final SuffixType suffixType;
  final Widget? suffixIcon;
  final Widget? suffixWidget;
  final InputFormatterType inputFormatterType;
  final List<TextInputFormatter>? inputFormatters;
  final AutovalidateMode? autovalidateMode;
  final bool readOnly;
  final void Function()? onTap;
  final String errorTextOnValidation;
  final FormFieldValidator<String>? customValidator;
  final void Function(String)? onChanged;
  final VoidCallback? onEditingComplete;
  final void Function(String)? onFieldSubmitted;
  final bool validate;
  final double borderRadius;
  final FocusNode? focusNode;
  final BoxConstraints? suffixIconConstraints;
  final BoxConstraints? prefixIconConstraints;
  final BoxConstraints? constraints;
  final bool enabled;
  final Color? hintColor;
  final bool hideText;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late final FocusNode? _focusNode;
  late final StreamController<String?> _errorTextStreamController;
  late final StreamController<bool> _alignInputToBottomController;
  late final StreamController<bool> _hasErrorController;

  @override
  void initState() {
    super.initState();
    _errorTextStreamController = StreamController<String?>.broadcast();
    _alignInputToBottomController = StreamController<bool>.broadcast();
    _hasErrorController = StreamController<bool>.broadcast();
    if (widget.focusNode != null) {
      widget.focusNode!.addListener(() => _alignInput(widget.focusNode!));
      _focusNode = null;
    } else {
      _focusNode = FocusNode();
      _focusNode!.addListener(() => _alignInput(_focusNode!));
    }
  }

  void _alignInput(FocusNode focusNode) {
    if (focusNode.hasFocus || widget._controller.text.isNotEmpty) {
      _alignInputToBottomController.add(true);
    } else {
      _alignInputToBottomController.add(false);
    }
  }

  @override
  dispose() {
    _errorTextStreamController.close();
    _alignInputToBottomController.close();
    _hasErrorController.close();
    _focusNode?.dispose();
    super.dispose();
  }

  List<TextInputFormatter>? _buildInputFormatters() {
    switch (widget.inputFormatterType) {
      case InputFormatterType.phone:
        return <TextInputFormatter>[
          MaskTextInputFormatter(
            mask: '#### ### ####',
            filter: {'#': RegExp(r'[0-9]')},
          ),
          LengthLimitingTextInputFormatter(11),
        ];
      case InputFormatterType.amount:
        return <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly];
      case InputFormatterType.custom:
        if (widget.inputFormatters != null) {
          return widget.inputFormatters;
        } else {
          throw Exception(
            'inputFormatters must not be null when inputFormatterType is set to custom',
          );
        }
      default:
        return null;
    }
  }

  Widget? _buildPrefixIcon() {
    switch (widget.prefixType) {
      case PrefixType.phone:
        return const Padding(
          padding: EdgeInsets.all(14),
          child: Icon(Icons.phone),
        );
      case PrefixType.name:
        return const Padding(
          padding: EdgeInsets.all(14),
          child: Icon(Icons.person),
        );
      case PrefixType.customIcon:
        if (widget.prefixIcon != null) {
          return Padding(
            padding: const EdgeInsets.all(14),
            child: widget.prefixIcon!,
          );
        } else {
          throw Exception(
            'prefixIcon must not be null when prefixType is set to customIcon',
          );
        }
      case PrefixType.customWidget:
        _buildPrefixWidget();
        return null;
      default:
        return null;
    }
  }

  Widget? _buildPrefixWidget() {
    if (widget.prefixType == PrefixType.customWidget) {
      if (widget.prefixWidget != null) {
        return widget.prefixWidget!;
      } else {
        throw Exception(
          'prefixWidget must not be null when prefixType is set to customWidget',
        );
      }
    } else {
      return null;
    }
  }

  Widget? _buildSuffixIcon() {
    switch (widget.suffixType) {
      case SuffixType.defaultt:
        return Container(
          margin: const EdgeInsets.only(right: 8),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.arrow_drop_down, size: 14),
          ),
        );
      case SuffixType.customIcon:
        if (widget.suffixIcon != null) {
          return widget.suffixIcon;
        } else {
          throw Exception(
            'sufixIcon must not be null when suffixType is set to customIcon',
          );
        }
      case SuffixType.customWidget:
        _buildSuffixWidget();
        return null;
      default:
        return null;
    }
  }

  Widget? _buildSuffixWidget() {
    if (widget.suffixType == SuffixType.customWidget) {
      if (widget.suffixWidget != null) {
        return widget.suffixWidget!;
      } else {
        throw Exception(
          'suffixWidget must not be null when suffixType is set to customWidget',
        );
      }
    } else {
      return null;
    }
  }

  String? _val(String? value) {
    bool hasError = false;
    String? errorMessage;

    if (widget.customValidator != null) {
      errorMessage = widget.customValidator!(value);
      hasError = errorMessage != null;
    } else if (widget.validate && (value == null || value.isEmpty)) {
      errorMessage = widget.errorTextOnValidation;
      hasError = true;
    }

    _errorTextStreamController.add(errorMessage);
    _hasErrorController.add(hasError);
    return hasError ? errorMessage : null;
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;
    final fonts = Theme.of(context).extension<AppFontThemeExtension>()!;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        StreamBuilder<bool>(
          stream: _hasErrorController.stream,
          initialData: false,
          builder: (context, errorSnapshot) {
            final hasError = errorSnapshot.data ?? false;

            return Focus(
              focusNode: _focusNode,
              child: TextFormField(
                initialValue: widget.initialValue,
                textCapitalization: widget.textCapitalization,
                controller: widget._controller,
                obscureText: widget.hideText,
                obscuringCharacter: '●',
                focusNode: widget.focusNode,
                onTap: widget.onTap,
                keyboardType: widget.keyboardType,
                readOnly: widget.readOnly,
                style: fonts.textMdRegular.copyWith(
                  color: widget.textColor ?? colors.textPrimary,
                  fontSize: widget.hideText ? 14.sp : 16.sp,
                  height: 1.3,
                ),
                textInputAction: widget.textInputAction,
                textAlignVertical: TextAlignVertical.bottom,
                enabled: widget.enabled,
                decoration: InputDecoration(
                  constraints: widget.constraints ?? const BoxConstraints(),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 16,
                  ),
                  floatingLabelStyle: fonts.textMdRegular.copyWith(
                    color: hasError ? colors.red500 : colors.gray500,
                    fontSize: 14.sp,
                  ),
                  errorStyle: const TextStyle(
                    color: Colors.transparent,
                    height: 0,
                    fontSize: 0,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(widget.borderRadius),
                    ),
                    borderSide: BorderSide(
                      color: colors.brandDefault,
                      width: 1.0,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(widget.borderRadius),
                    ),
                    borderSide: BorderSide(color: colors.red500, width: 2.0),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(widget.borderRadius),
                    ),
                    borderSide: BorderSide(
                      color: colors.brandDefault,
                      width: 1.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(widget.borderRadius),
                    ),
                    borderSide: BorderSide(
                      color: hasError ? colors.red500 : colors.gray300,
                      width: hasError ? 1.0 : 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(widget.borderRadius),
                    ),
                    borderSide: BorderSide(
                      color: hasError ? colors.red500 : colors.brandDefault,
                      width: 2.0,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(widget.borderRadius),
                    ),
                    borderSide: BorderSide(color: colors.red500, width: 2.0),
                  ),
                  fillColor: _getFillColor(colors, isDark),
                  filled: true,
                  labelText: widget.labelText,
                  hintText: widget.hintText,
                  labelStyle: fonts.textSmRegular.copyWith(
                    fontSize: 12.sp,
                    color: hasError ? colors.red500 : colors.gray500,
                  ),
                  hintStyle: fonts.textSmRegular.copyWith(
                    fontSize: 14.sp,
                    color: widget.hintColor ?? colors.gray500,
                  ),
                  isDense: true,
                  prefix: _buildPrefixWidget(),
                  prefixIconConstraints:
                      widget.prefixIconConstraints ??
                      const BoxConstraints(minWidth: 20),
                  prefixIcon: StreamBuilder<bool>(
                    stream: _alignInputToBottomController.stream,
                    initialData: false,
                    builder: (context, snapshot) {
                      return Padding(
                        padding: EdgeInsets.only(top: snapshot.data! ? 17 : 0),
                        child: _buildPrefixIcon(),
                      );
                    },
                  ),
                  suffix: _buildSuffixWidget(),
                  suffixIcon: StreamBuilder<bool>(
                    stream: _alignInputToBottomController.stream,
                    initialData: false,
                    builder: (context, snapshot) {
                      return Padding(
                        padding: EdgeInsets.only(top: snapshot.data! ? 18 : 0),
                        child: _buildSuffixIcon(),
                      );
                    },
                  ),
                  suffixIconConstraints:
                      widget.suffixIconConstraints ?? const BoxConstraints(),
                ),
                onChanged: widget.onChanged,
                onFieldSubmitted: widget.onFieldSubmitted,
                onEditingComplete: widget.onEditingComplete,
                validator:
                    widget.customValidator ?? (widget.validate ? _val : null),
                autovalidateMode: widget.autovalidateMode,
                inputFormatters: _buildInputFormatters(),
              ),
            );
          },
        ),
        StreamBuilder<String?>(
          stream: _errorTextStreamController.stream,
          builder: (context, snapshot) {
            if (snapshot.data != null && widget.validate) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FractionalTranslation(
                    translation:
                        widget.customValidator != null
                            ? const Offset(0, 0.2)
                            : const Offset(0, 0.1),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        snapshot.data!,
                        style: fonts.textXsRegular.copyWith(
                          color: colors.red500,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              );
            }
            return const SizedBox();
          },
        ),
      ],
    );
  }

  Color _getFillColor(ColorSystemExtension colors, bool isDark) {
    if (widget.bgColour != null) {
      return widget.bgColour!;
    }
    return isDark ? colors.bgB1 : colors.bgB0;
  }
}
