import 'package:flutter/material.dart';
import 'package:seguromedico/core/theme/app_color.dart';
import 'package:seguromedico/core/theme/app_text_styles.dart';
import 'package:seguromedico/core/widgets/buttons/custom_icon_button.dart';
import 'package:seguromedico/features/doctor/presentation/widgets/indicators_doctor_widget.dart';
import 'package:seguromedico/features/doctor/presentation/widgets/metrics_dashboard_doctor_widget.dart';
import 'package:seguromedico/features/doctor/presentation/widgets/practice_active_widget.dart';

class DashboardDoctorPage extends StatefulWidget {
  const DashboardDoctorPage({super.key});

  @override
  State<DashboardDoctorPage> createState() => _DashboardDoctorPageState();
}

class _DashboardDoctorPageState extends State<DashboardDoctorPage> {
  DateTime _selectedDate = DateTime.now();
  String? _selectedTime;

  final List<Map<String, dynamic>> _morningSlots = [
    {'time': '07:30 AM', 'available': true},
    {'time': '07:40 AM', 'available': true},
    {'time': '07:50 AM', 'available': true},
    {'time': '08:30 AM', 'available': true},
    {'time': '08:45 AM', 'available': true},
    {'time': '09:00 AM', 'available': true},
    {'time': '09:30 AM', 'available': true},
    {'time': '10:30 AM', 'available': true},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.only(
              top: 50,
              bottom: 16,
              left: 16,
              right: 16,
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
                        'assets/images/icon_doctor.webp',
                        width: 45,
                        height: 45,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Center(
                          child: Column(
                        children: [
                          Text(
                            "Dr. Juan Marcelo Zenteno",
                            style: AppTextStyles.titleMedium(),
                          ),
                        ],
                      )),
                    ),
                    Row(
                      children: [
                        CustomIconButton(
                          icon: Icons.notifications_outlined,
                          onPressed: () {
                            print('Icono presionado');
                          },
                        ),
                        CustomIconButton(
                          icon: Icons.shopping_cart_outlined,
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
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IndicatorsDoctorWidget(),

                  SizedBox(height: 25),
                  MetricsDashboardDoctorWidget(),

                  SizedBox(height: 25),
                  Text('Consultas',
                      style: AppTextStyles.titleMedium(
                          fontWeight: FontWeight.w600)),

                  SizedBox(height: 25),
                  PracticeActiveWidget(),

                  SizedBox(height: 25),
                  _buildDoctorCard(),

                  // Selector de fecha
                  _buildDateSelector(),
                  SizedBox(height: 24),

                  // Morning Slots
                  _buildTimeSection(
                    title: 'Horario',
                    slots: _morningSlots,
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.white,
        child: ElevatedButton(
          onPressed: _selectedTime != null ? () {} : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.cardBackground,
            minimumSize: const Size(double.infinity, 56),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            _selectedTime != null
                ? 'Book Appointment at $_selectedTime'
                : 'Select a Time Slot',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDoctorCard() {
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
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color(0xFFE8F3F1),
            ),
            child: const Icon(Icons.person, size: 40, color: AppColors.primary),
          ),
          const SizedBox(width: 16),

          // Información del doctor
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Consultas atentidas',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(
                      Icons.local_hospital,
                      size: 16,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '50 consultas atendidas',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    // Rating
                    const Icon(
                      Icons.star,
                      size: 16,
                      color: Colors.amber,
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      '50',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '(500 puntos ganados)',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateSelector() {
    final today = DateTime.now();
    final tomorrow = today.add(const Duration(days: 1));

    final isTodaySelected = _isSameDay(_selectedDate, today);
    final isTomorrowSelected = _isSameDay(_selectedDate, tomorrow);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15),
        const Text(
          'Ultimas consultas detalladas',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            Expanded(
              child: _DateButton(
                date: today,
                label: 'Paciente 1',
                slots: 'A domicilio',
                isSelected: isTodaySelected,
                onTap: () {
                  setState(() {
                    _selectedDate = today;
                    _selectedTime = null;
                  });
                },
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _DateButton(
                date: tomorrow,
                label: 'Tomorrow',
                slots: '50 Slots Available',
                isSelected: isTomorrowSelected,
                onTap: () {
                  setState(() {
                    _selectedDate = tomorrow;
                    _selectedTime = null;
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  bool _isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  Widget _buildTimeSection({
    required String title,
    required List<Map<String, dynamic>> slots,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: slots.map((slot) {
            final isSelected = _selectedTime == slot['time'];

            return GestureDetector(
              onTap: slot['available']
                  ? () {
                      setState(() {
                        _selectedTime = slot['time'];
                      });
                    }
                  : null,
              child: Container(
                width: 100,
                height: 50,
                decoration: BoxDecoration(
                  color: isSelected
                      ? const Color(0xFF199A8E) // Verde cuando seleccionado
                      : slot['available']
                          ? Colors.white
                          : Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isSelected
                        ? const Color(0xFF199A8E)
                        : slot['available']
                            ? Colors.grey[300]!
                            : Colors.grey[200]!,
                  ),
                  boxShadow: slot['available'] && !isSelected
                      ? [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ]
                      : null,
                ),
                child: Center(
                  child: Text(
                    slot['time'],
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight:
                          isSelected ? FontWeight.w600 : FontWeight.w500,
                      color: isSelected
                          ? Colors.white
                          : slot['available']
                              ? Colors.black
                              : Colors.grey[400],
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class _DateButton extends StatelessWidget {
  final DateTime date;
  final String label;
  final String slots;
  final bool isSelected;
  final VoidCallback onTap;

  const _DateButton({
    required this.date,
    required this.label,
    required this.slots,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.primary : Colors.grey[300]!,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '${date.day} ${_getMonthName(date.month)}',
              style: TextStyle(
                fontSize: 14,
                color: isSelected ? Colors.white70 : Colors.grey[600],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              slots,
              style: TextStyle(
                fontSize: 12,
                color: isSelected ? Colors.white : AppColors.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getMonthName(int month) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return months[month - 1];
  }
}
