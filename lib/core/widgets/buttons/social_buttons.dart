// lib/core/widgets/buttons/social_auth_button.dart
import 'package:flutter/material.dart';
import 'package:seguromedico/core/theme/app_color.dart';
import 'package:seguromedico/core/theme/app_text_styles.dart';

enum SocialAuthType { google, facebook, apple }

class SocialButtons extends StatelessWidget {
  final SocialAuthType type;
  final VoidCallback onPressed;
  final String? customText;

  const SocialButtons({
    super.key,
    required this.type,
    required this.onPressed,
    this.customText,
  });

  @override
  Widget build(BuildContext context) {
    final (icon, text, color, textColor, borderColor) = _getButtonData();

    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        border: borderColor != null
            ? Border.all(color: borderColor, width: 1)
            : null,
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(width: 12),
            Text(
              customText ?? text,
              style: AppTextStyles.labelMedium().copyWith(
                color: textColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  (Widget, String, Color, Color, Color?) _getButtonData() {
    switch (type) {
      case SocialAuthType.google:
        return (
          // Icono con colores de Google
          SizedBox(
            width: 24,
            height: 24,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  child: Container(
                    width: 12,
                    height: 24,
                    decoration: BoxDecoration(
                      color: Color(0xFF4285F4), // Azul
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  child: Container(
                    width: 12,
                    height: 24,
                    decoration: BoxDecoration(
                      color: Color(0xFF34A853), // Verde
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    'G',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
          'Continuar con Google',
          Colors.white,
          AppColors.textPrimary,
          AppColors.border,
        );
      case SocialAuthType.facebook:
        return (
          const Icon(Icons.facebook, color: Colors.white, size: 24),
          'Continue with Facebook',
          const Color(0xFF1877F2), // Azul Facebook oficial
          Colors.white,
          null,
        );
      case SocialAuthType.apple:
        return (
          const Icon(Icons.apple, color: Colors.white, size: 24),
          'Continue with Apple',
          Colors.black,
          Colors.white,
          null,
        );
    }
  }
}
