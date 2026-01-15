import 'package:flutter/material.dart';
import 'package:seguromedico/core/theme/app_text_styles.dart';

class AuthHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget? icon;

  const AuthHeader({
    super.key,
    required this.title,
    required this.subtitle,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (icon != null) ...[icon!, const SizedBox(height: 24)],
        Text(
          title,
          style: AppTextStyles.displayLarge(
              color: Colors.white, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 12),
        Text(subtitle, style: AppTextStyles.bodyMedium(color: Colors.white)),
      ],
    );
  }
}
