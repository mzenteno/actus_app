import 'package:flutter/material.dart';
import 'package:seguromedico/core/theme/app_color.dart';
import 'package:seguromedico/core/theme/app_text_styles.dart';

class PasswordInput extends StatefulWidget {
  final String label;
  final String? hintText;
  final TextEditingController controller;
  final String? errorText;
  final bool showLabel;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final bool enabled;
  final bool autoFocus;

  const PasswordInput({
    super.key,
    required this.label,
    this.hintText,
    required this.controller,
    this.errorText,
    this.showLabel = true,
    this.onChanged,
    this.validator,
    this.enabled = true,
    this.autoFocus = false,
  });

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.showLabel) ...[
          Text(widget.label, style: AppTextStyles.inputLabel()),
          const SizedBox(height: 8),
        ],
        TextField(
          controller: widget.controller,
          obscureText: _obscureText,
          enabled: widget.enabled,
          autofocus: widget.autoFocus,
          onChanged: widget.onChanged,
          decoration: InputDecoration(
            hintText: widget.hintText ?? 'Enter your password',
            hintStyle: AppTextStyles.inputHint(),
            errorText: widget.errorText,
            errorStyle: AppTextStyles.inputError(),
            prefixIcon: Icon(
              Icons.lock_outline,
              color: AppColors.textSecondary.withOpacity(0.6),
            ),
            suffixIcon: IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility_off : Icons.visibility,
                color: AppColors.textSecondary.withOpacity(0.6),
              ),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.border, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.border, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.primary, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red, width: 1),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red, width: 2),
            ),
            filled: true,
            fillColor: widget.enabled ? Colors.white : Colors.grey.shade100,
          ),
          style: AppTextStyles.inputText(),
        ),
      ],
    );
  }
}
