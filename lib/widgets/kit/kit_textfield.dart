import 'package:flutter/material.dart';
import 'package:numeroid/core/locator.dart';

import '../kit/app_typography.dart';

InputDecoration _getDecorator({
  required bool isError,
  String? hintText,
  String? suffix,
}) {
  return InputDecoration(
    // contentPadding: const EdgeInsets.symmetric(
    //   vertical: 0,
    //   horizontal: 12,
    // ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: isError ? appTheme.colors.brand.red : appTheme.colors.elements.blue,
        width: 1,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: appTheme.colors.border.grey,
        width: 1,
      ),
    ),
    fillColor: Colors.white,
    hintText: hintText,
    // suffixIcon: (suffix != null)
    //     ? Padding(
    //         padding: const EdgeInsets.only(
    //           bottom: 2,
    //           right: 10,
    //         ),
    //         child: Text(
    //           suffix,
    //           style: KitTextStyles.semiBold14.copyWith(
    //             color: appTheme.colors.text.secondary,
    //           ),
    //         ),
    //       )
    //     : null,
    // suffixIconConstraints: (suffix != null) ? const BoxConstraints(minWidth: 0, minHeight: 0) : null,
  );
}

class _KitBaseTextField extends StatelessWidget {
  const _KitBaseTextField({
    this.title,
    required this.onChange,
    required this.child,
    required this.errMessage,
  });

  final String? title;
  final ValueChanged<String> onChange;
  final Widget child;
  final String? errMessage;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Text(
            title!,
            style: KitTextStyles.semiBold14,
          ),
        if (title != null) const SizedBox(height: 6),
        SizedBox(
          height: 36,
          child: child,
        ),
        if (errMessage != null)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              errMessage!,
              style: KitTextStyles.regular13.copyWith(
                color: appTheme.colors.brand.red,
              ),
            ),
          ),
      ],
    );
  }
}

class KitTextField extends StatefulWidget {
  const KitTextField({
    super.key,
    this.title,
    required this.onChange,
    this.errMessage,
    this.value,
    this.hintText,
    this.suffix,
  });

  final String? title;
  final ValueChanged<String> onChange;
  final String? errMessage;
  final String? value;
  final String? hintText;
  final String? suffix;

  @override
  State<KitTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<KitTextField> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.value);
  }

  @override
  Widget build(BuildContext context) {
    return _KitBaseTextField(
      title: widget.title,
      onChange: widget.onChange,
      errMessage: widget.errMessage,
      child: TextField(
        style: KitTextStyles.medium14.copyWith(
          color: appTheme.colors.text.primary,
        ),
        textAlignVertical: TextAlignVertical.top,
        controller: controller,
        // cursorHeight: 16,
        cursorColor: appTheme.colors.elements.blue,
        decoration: _getDecorator(
          isError: widget.errMessage != null,
          hintText: widget.hintText,
          suffix: widget.suffix,
        ),
        onChanged: widget.onChange,
      ),
    );
  }
}

class KitSecureTextField extends StatefulWidget {
  const KitSecureTextField({
    super.key,
    required this.title,
    required this.onChange,
    this.errMessage,
    this.hintText,
  });

  final String title;
  final ValueChanged<String> onChange;
  final String? errMessage;
  final String? hintText;

  @override
  State<KitSecureTextField> createState() => _AppSecureTextFieldState();
}

class _AppSecureTextFieldState extends State<KitSecureTextField> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return _KitBaseTextField(
      title: widget.title,
      onChange: widget.onChange,
      errMessage: widget.errMessage,
      child: TextField(
        style: KitTextStyles.medium14.copyWith(
          color: appTheme.colors.text.primary,
        ),
        // cursorHeight: 16,
        textAlignVertical: TextAlignVertical.top,
        cursorColor: appTheme.colors.elements.blue,
        decoration: _getDecorator(
          isError: widget.errMessage != null,
          hintText: widget.hintText,
        ).copyWith(
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _isObscure = !_isObscure;
              });
            },
            icon: ImageIcon(
              AssetImage(
                _isObscure ? 'assets/icons/eye_slash.png' : 'assets/icons/eye.png',
              ),
              size: 20,
            ),
          ),
        ),
        onChanged: widget.onChange,
        obscureText: _isObscure,
        enableSuggestions: false,
        autocorrect: false,
      ),
    );
  }
}
