import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:seguromedico/core/theme/app_color.dart';
import 'package:seguromedico/features/doctor/presentation/pages/dashboard/dashboard_doctor_page.dart';
import 'package:seguromedico/features/doctor/presentation/pages/profile/profile_doctor.page.dart';

class MainDoctor extends StatefulWidget {
  const MainDoctor({super.key});

  @override
  State<MainDoctor> createState() => _MainDoctorState();
}

class _MainDoctorState extends State<MainDoctor> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const DashboardDoctorPage(),
    const DashboardDoctorPage(),
    const ProfileDoctorPage(),
    const ProfileDoctorPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: Duration(microseconds: 500),
        child: Container(
          key: ValueKey<int>(_currentIndex),
          child: _pages[_currentIndex],
        ),
      ),
      bottomNavigationBar: Container(
        height: 100,
        padding: EdgeInsets.only(
          top: 3,
          bottom: MediaQuery.of(context).padding.bottom,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 15,
              offset: const Offset(0, -3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Symbols.home, Symbols.home, 0),
            _buildNavItem(
                Symbols.medical_services, Symbols.medical_services, 1),
            _buildNavItem(Symbols.patient_list, Symbols.patient_list, 2),
            _buildNavItem(Symbols.person, Symbols.person, 3),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, IconData activeIcon, int index) {
    bool isSelected = _currentIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 50,
            height: 45,
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.primary.withValues(alpha: 0.1)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(
              isSelected ? activeIcon : icon,
              fill: 0.0,
              size: 32,
              weight: isSelected ? 400 : 300,
              color: isSelected ? AppColors.primary : Colors.grey[600],
            ),
          ),
          const SizedBox(height: 3),
        ],
      ),
    );
  }
}
