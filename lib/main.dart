import 'package:flutter/material.dart';
import 'package:seguromedico/core/theme/app_theme.dart';
import 'package:seguromedico/features/auth/presentation/pages/login_page.dart';
import 'package:seguromedico/features/doctor/presentation/pages/dashboard_doctor_page.dart';
import 'core/di/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializa GetIt con tus dependencias
  await setupDependencies(useFake: true);

  FlutterError.onError = (details) {
    FlutterError.dumpErrorToConsole(
      details,
    ); // Esto imprime todo en la terminal
  };

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Seguro médico',
      theme: AppTheme.lightTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/doctor-dashboard': (context) => const DashboardDoctorPage(),
      },
    );
  }
}
