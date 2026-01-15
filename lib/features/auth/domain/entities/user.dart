class User {
  final int id;
  final String name;
  final String email;
  final String role; // asegurado | doctor

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
  });

  // Métodos de dominio puro
  bool get isDoctor => role == 'doctor';
  bool get isPatient => role == 'asegurado';
}
