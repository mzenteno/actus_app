import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:seguromedico/core/theme/app_color.dart';

class MapArrivalSheet extends StatelessWidget {
  const MapArrivalSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.background,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 50),
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
          ),
          child: Column(
            children: [
              _buildHandle(),
              const Expanded(
                child: Center(child: Text("Mapa de Google aquí")),
              ),
              SafeArea(
                child: _buildArrivalButton(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildHandle() {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 12),
    height: 5,
    width: 40,
    decoration: BoxDecoration(
        color: Colors.grey[300], borderRadius: BorderRadius.circular(10)),
  );
}

Widget _buildArrivalButton(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(20),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 50)),
      onPressed: () => Navigator.pop(context, true),
      child: const Text("LLEGUÉ"),
    ),
  );
}
