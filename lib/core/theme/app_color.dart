// lib/core/theme/app_colors.dart
import 'package:flutter/material.dart';

class AppColors {
  // Color azul principal (#2D5BFF) - Botones principales, elementos destacados
  static const Color primary = Color.fromRGBO(24, 119, 242, 1);

  // Color azul claro (#E6ECFF) - Fondos de cards, estados hover
  static const Color primaryLight = Color.fromRGBO(230, 236, 255, 1);

  // Color de fondo blanco (#FFFFFF) - Fondo principal de la aplicación
  static const Color background = Color.fromARGB(255, 240, 240, 240);

  // Color de fondo para tarjetas (#F8F9FF) - Fondo de cards y contenedores
  static const Color cardBackground = Color.fromRGBO(248, 249, 255, 1);

  // Color de texto principal (#333333) - Títulos y texto importante
  static const Color textPrimary = Color.fromRGBO(51, 51, 51, 1);

  // Color de texto secundario (#666666) - Subtítulos y descripciones
  static const Color textSecondary = Color.fromRGBO(102, 102, 102, 1);

  // Color para hints/placeholders (#999999) - Texto de ayuda en inputs
  static const Color textHint = Color.fromRGBO(153, 153, 153, 1);

  // Color para bordes (#E0E0E0) - Bordes de inputs y separadores
  static const Color border = Color.fromRGBO(224, 224, 224, 1);

  // Color para éxito (#4CD964) - Mensajes de confirmación, estados positivos
  static const Color success = Color.fromRGBO(76, 217, 100, 1);

  // Color para errores (#FF5252) - Mensajes de error, validaciones fallidas
  static const Color error = Color.fromRGBO(255, 82, 82, 1);

  // Color para advertencias (#FFB74D) - Estados intermedios, notificaciones
  static const Color warning = Color.fromRGBO(255, 183, 77, 1);
}
