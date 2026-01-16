import 'package:flutter/material.dart';
import 'package:seguromedico/core/theme/app_color.dart';
import 'package:seguromedico/core/theme/app_text_styles.dart';

class MetricsCardWidget extends StatelessWidget {
  const MetricsCardWidget({super.key});

  final bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return SizedBox(
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          SizedBox(
            width: 145,
            child: _buildRatingCard(),
          ),
          const SizedBox(width: 12),
          SizedBox(
            width: 240,
            child: _buildConsultationsCard(),
          ),
          const SizedBox(width: 12),
          SizedBox(
            width: 250,
            child: _buildConsultationsCard(),
          ),
        ],
      ),
    );
  }

  Widget _buildRatingCard() {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
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
          const SizedBox(height: 22),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.star_rounded, color: Colors.amber, size: 23),
              const Icon(Icons.star_rounded, color: Colors.amber, size: 23),
              const Icon(Icons.star_rounded, color: Colors.amber, size: 23),
              const Icon(Icons.star_rounded, color: Colors.amber, size: 23),
              const Icon(Icons.star_rounded, color: Colors.amber, size: 23),
            ],
          ),
          const SizedBox(height: 5),
          Text('47 opiniones',
              style: AppTextStyles.bodySmall()
                  .copyWith(color: Colors.grey.shade600)),
        ],
      ),
    );
  }

  Widget _buildConsultationsCard() {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
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
                    'Consultas este mes',
                    style: AppTextStyles.bodySmall().copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                  Text(
                    '12/15',
                    style: AppTextStyles.bodySmall().copyWith(
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
                'Meta alcanzada 80%',
                style: AppTextStyles.bodySmall()
                    .copyWith(color: Colors.grey.shade600),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
