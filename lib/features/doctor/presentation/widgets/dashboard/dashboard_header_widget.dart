import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:seguromedico/core/theme/app_color.dart';
import 'package:seguromedico/core/theme/app_text_styles.dart';
import 'package:seguromedico/core/widgets/buttons/custom_icon_button.dart';

class DashboardHeaderWidget extends StatelessWidget {
  const DashboardHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      padding: const EdgeInsets.only(
        top: 10,
        bottom: 10,
        left: 10,
        right: 10,
      ),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  'assets/images/icon_doctor_dashboard.webp',
                  width: 45,
                  height: 45,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  "Dr. Juan Marcelo zenteno molina",
                  style: AppTextStyles.titleMedium(color: Colors.white),
                ),
              ),
              Row(
                children: [
                  CustomIconButton(
                    backgroundColor: Colors.white.withValues(alpha: 0.2),
                    borderRadius: 15,
                    iconColor: Colors.white,
                    icon: Symbols.notifications,
                    onPressed: () {
                      print('Icono presionado');
                    },
                  ),
                  CustomIconButton(
                    backgroundColor: Colors.white.withValues(alpha: 0.2),
                    iconColor: Colors.white,
                    borderRadius: 15,
                    icon: Symbols.shopping_cart,
                    onPressed: () {
                      print('Icono presionado');
                    },
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
