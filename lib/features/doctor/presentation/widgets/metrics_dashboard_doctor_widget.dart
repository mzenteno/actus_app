import 'package:flutter/material.dart';
import 'package:seguromedico/core/theme/app_color.dart';
import 'package:seguromedico/core/theme/app_text_styles.dart';

class MetricsDashboardDoctorWidget extends StatefulWidget {
  const MetricsDashboardDoctorWidget({super.key});

  @override
  State<MetricsDashboardDoctorWidget> createState() =>
      _MetricsDashboardDoctorWidgetState();
}

class _MetricsDashboardDoctorWidgetState
    extends State<MetricsDashboardDoctorWidget> {
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return SizedBox(
      height: 180,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          SizedBox(
            width: 160,
            child: _buildRatingCard(),
          ),
          const SizedBox(width: 12),
          SizedBox(
            width: 200,
            child: _buildConsultationsCard(),
          ),
          const SizedBox(width: 12),
          SizedBox(
            width: 200,
            child: _buildConsultationsCard(),
          ),
        ],
      ),
    );
  }

  Widget _buildRatingCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.background,
            blurRadius: 15,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            '4.8',
            style: AppTextStyles.displayMedium(fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.star_rounded, color: Colors.amber, size: 25),
              const Icon(Icons.star_rounded, color: Colors.amber, size: 25),
              const Icon(Icons.star_rounded, color: Colors.amber, size: 25),
              const Icon(Icons.star_rounded, color: Colors.amber, size: 25),
              const Icon(Icons.star_rounded, color: Colors.amber, size: 25),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            'Valoración',
            style: AppTextStyles.bodySmall(fontWeight: FontWeight.w500),
          ),
          Text(
            'promedio',
            style: AppTextStyles.bodySmall(fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 2),
          Text('47 opiniones',
              style: AppTextStyles.bodySmall()
                  .copyWith(color: Colors.grey.shade600)),
        ],
      ),
    );
  }

  Widget _buildConsultationsCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.background,
            blurRadius: 15,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Consultas del mes', style: AppTextStyles.bodyMedium()),
          const SizedBox(height: 10),
          Center(
            child: Text('12',
                style:
                    AppTextStyles.displayMedium(fontWeight: FontWeight.w400)),
          ),
          const SizedBox(height: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Progreso mensual',
                    style: AppTextStyles.labelSmall().copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                  Text(
                    '12/15',
                    style: AppTextStyles.labelSmall().copyWith(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              SizedBox(
                height: 8,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: 12 / 15, // 80%
                    backgroundColor: Colors.grey.shade200,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      AppColors.primary,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '80% de la meta alcanzada',
                style: AppTextStyles.labelSmall().copyWith(
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
