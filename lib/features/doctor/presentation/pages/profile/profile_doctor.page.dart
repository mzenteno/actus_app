import 'package:flutter/material.dart';
import 'package:seguromedico/core/theme/app_color.dart';
import 'package:seguromedico/core/widgets/custom_layout.dart';

class ProfileDoctorPage extends StatefulWidget {
  const ProfileDoctorPage({super.key});

  @override
  State<ProfileDoctorPage> createState() => _ProfileDoctorPageState();
}

class _ProfileDoctorPageState extends State<ProfileDoctorPage> {
  @override
  Widget build(BuildContext context) {
    return CustomLayout(
      statusColor: Colors.red,
      statusIcons: Brightness.light,
      iosStatusBrightness: Brightness.dark,
      navColor: Colors.red,
      navIcons: Brightness.light,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                color: AppColors.primary, // Tu azul de fondo
                child: const Center(
                  child: Text(
                    "Perfil del Doctor",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        onTap: (index) {
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Ajustes',
          ),
        ],
      ),
    );
  }
}
