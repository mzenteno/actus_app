import 'package:flutter/material.dart';
import 'package:seguromedico/core/theme/app_color.dart';
import 'package:seguromedico/core/theme/app_text_styles.dart';

class IndicatorsCardWidget extends StatelessWidget {
  const IndicatorsCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[200]!),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Disponible para visitas',
              style: AppTextStyles.bodyMedium(fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(width: 16),

          // Switch a la derecha
          Switch(
            value: true,
            onChanged: (value) {},
            activeThumbColor: AppColors.primary,
            activeTrackColor: AppColors.primary.withValues(alpha: 0.3),
          ),
        ],
      ),
    );
  }
}
