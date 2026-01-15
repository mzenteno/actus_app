import 'package:flutter/material.dart';
import 'package:seguromedico/core/theme/app_color.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;
  final VoidCallback onPressed;
  final EdgeInsetsGeometry margin;
  final double iconSize;
  final EdgeInsetsGeometry padding;
  final double borderRadius;

  const CustomIconButton({
    super.key,
    required this.icon,
    this.iconColor = AppColors.textPrimary,
    this.backgroundColor = AppColors.background,
    required this.onPressed,
    this.margin = const EdgeInsets.symmetric(horizontal: 4),
    this.iconSize = 22,
    this.padding = const EdgeInsets.all(2),
    this.borderRadius = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: iconColor,
          size: iconSize,
        ),
        padding: padding,
      ),
    );
  }
}
