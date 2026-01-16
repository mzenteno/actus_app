import 'package:flutter/material.dart';
import 'package:seguromedico/core/theme/app_color.dart';
import 'package:seguromedico/core/theme/app_text_styles.dart';
import 'package:seguromedico/features/doctor/presentation/widgets/dashboard/map_arrival_sheet.dart';

class PracticeActiveCardWidget extends StatelessWidget {
  const PracticeActiveCardWidget({super.key});

  final bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Paciente actual
          Text('paciente activo',
              style: AppTextStyles.titleSmall(fontWeight: FontWeight.w500)),
          SizedBox(height: 15),
          _currentPatient(context),

          // Próximos pacientes
          SizedBox(height: 15),
          Text('Próximos pacientes',
              style: AppTextStyles.titleSmall(fontWeight: FontWeight.w500)),
          SizedBox(height: 15),
          _nextPatient()
        ],
      ),
    );
  }
}

Widget _currentPatient(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: Colors.grey.shade200, width: 1),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/images/icon_patient_dashboard.jpg',
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 2),
                  Text(
                    'Juan Marcelo Zenteno Molina',
                    style: AppTextStyles.bodyMedium(),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(Icons.location_on,
                          size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(
                        'a 2.5 km',
                        style: AppTextStyles.bodySmall(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),

        const SizedBox(height: 5),

        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
              'Fuerte dolor de cabeza, dolor abdominal, mareos y náuseas',
              style: AppTextStyles.labelMedium()),
        ),

        SizedBox(height: 20),

        // Botones
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () {
                  _openMap(context);
                },
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text('Ver ubicación',
                    style:
                        AppTextStyles.buttonMedium(color: AppColors.primary)),
              ),
            ),
            SizedBox(width: 5),
            Expanded(
              child: FilledButton.icon(
                onPressed: () {},
                style: FilledButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: AppColors.primary,
                ),
                label: Text(
                  'Contactar',
                  style: AppTextStyles.buttonMedium(),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _nextPatient() {
  return Row(
    children: [
      Expanded(
        child: _cardNextPatient(),
      ),
      const SizedBox(width: 12),
      Expanded(
        child: _cardNextPatient(),
      ),
    ],
  );
}

Widget _cardNextPatient() {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(
        color: Colors.grey[300]!,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withValues(alpha: 0.1),
          blurRadius: 4,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Paciente1",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          "a 10 km",
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "hace 10 minutos",
          style: TextStyle(
            fontSize: 12,
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}

void _openMap(BuildContext context) async {
  final result = await showModalBottomSheet<bool>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    backgroundColor: Colors.transparent,
    builder: (context) => const MapArrivalSheet(), // <--- Llamas a tu widget
  );

  if (result == true) {
    // Aquí disparas el siguiente diálogo de "Iniciar Consulta"
    //_showStartConsultationDialog();
  }
}
