import 'package:flutter/services.dart';
import 'package:theexperience/utils/utils.dart';

class CustomTextInput extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool readOnly;
  final bool autofocus;
  final String obscuringCharacter;
  final bool obscureText;
  final bool enableSuggestions;
  final int? maxLines;
  final int? minLines;
  final bool expands;
  final int? maxLength;
  final void Function(String)? onChanged;
  final void Function()? onEditingComplete;
  final void Function(String)? onSubmitted;
  final bool? enabled;
  final void Function()? onTap;
  final Widget? prefix;
  final String? hintText;
  final String? titleText;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final TextCapitalization textCapitalization;
  final AutovalidateMode? autovalidateMode;
  final String? textInfo;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final List<TextInputFormatter>? inputFormatters;
  final EdgeInsetsGeometry? contentPadding;
  final Color? fillColor;
  const CustomTextInput({
    Key? key,
    this.focusNode,
    this.keyboardType,
    this.textInputAction,
    this.contentPadding,
    this.readOnly = false,
    this.autofocus = false,
    this.obscuringCharacter = '•',
    this.obscureText = false,
    this.enableSuggestions = true,
    this.maxLines = 1,
    this.maxLength,
    this.fillColor,
    this.minLines,
    this.expands = false,
    this.enabled,
    this.onChanged,
    this.controller,
    this.onEditingComplete,
    this.hintStyle,
    this.onSubmitted,
    this.onTap,
    this.textInfo,
    this.hintText,
    this.suffixIcon,
    this.textCapitalization = TextCapitalization.none,
    this.prefix,
    this.validator,
    this.titleText,
    this.style,
    this.autovalidateMode,
    this.inputFormatters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          inputFormatters: inputFormatters,
          controller: controller,
          focusNode: focusNode,
          textCapitalization: textCapitalization,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          readOnly: onTap != null ? true : readOnly,
          autofocus: autofocus,
          obscuringCharacter: obscuringCharacter,
          obscureText: obscureText,
          enableSuggestions: enableSuggestions,
          maxLength: maxLength,
          maxLines: maxLines,
          minLines: minLines,
          expands: expands,
          onChanged: onChanged,
          onEditingComplete: onEditingComplete,
          onTap: onTap,
          autovalidateMode: autovalidateMode,
          onFieldSubmitted: onSubmitted,
          enabled: enabled,
          validator: validator,
          style: style ??
              TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
              ),
          decoration: InputDecoration(
            contentPadding: contentPadding ??
                EdgeInsets.symmetric(
                  vertical: 15.h,
                  horizontal: prefix != null ? 15.w : 24.w,
                ),
            hintStyle: hintStyle ??
                const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
            fillColor:fillColor?? ColorConv('#E9E9E9'),
            filled: true,
            prefixIcon: prefix,
            suffixIcon: suffixIcon,
            hintText: hintText,
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.r),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.r),
            ),
          ),
        ),
      ],
    );
  }
}
