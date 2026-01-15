import 'package:flutter/material.dart';
import 'package:seguromedico/core/theme/app_color.dart';
import 'package:seguromedico/core/theme/app_text_styles.dart';

class IndicatorsDoctorWidget extends StatefulWidget {
  const IndicatorsDoctorWidget({super.key});

  @override
  State<IndicatorsDoctorWidget> createState() => _IndicatorsDoctorWidgetState();
}

class _IndicatorsDoctorWidgetState extends State<IndicatorsDoctorWidget> {
  bool _isAvailableForVisits = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[200]!),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Disponible para visitas',
                  style: AppTextStyles.titleSmall(),
                ),
                const SizedBox(height: 4),
                Text(
                  _isAvailableForVisits ? 'Activado' : 'Desactivado',
                  style: TextStyle(
                    fontSize: 16,
                    color: _isAvailableForVisits
                        ? AppColors.primary
                        : Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),

          // Switch a la derecha
          Switch(
            value: _isAvailableForVisits,
            onChanged: (value) {
              setState(() {
                _isAvailableForVisits = value;
              });
              // Aquí puedes agregar lógica adicional cuando cambie el switch
            },
            activeColor: AppColors.primary,
            activeTrackColor: AppColors.primary.withOpacity(0.3),
          ),
        ],
      ),
    );
  }
}
