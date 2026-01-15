import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seguromedico/core/theme/app_color.dart';
import 'package:seguromedico/core/theme/app_text_styles.dart';
import 'package:seguromedico/core/widgets/buttons/primary_button.dart';
import 'package:seguromedico/core/widgets/buttons/social_buttons.dart';
import 'package:seguromedico/core/widgets/inputs/password_input.dart';
import 'package:seguromedico/core/widgets/inputs/textfield_input.dart';
import 'package:seguromedico/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:seguromedico/features/auth/presentation/bloc/auth_event.dart';
import 'package:seguromedico/features/auth/presentation/bloc/auth_state.dart';
import 'package:seguromedico/features/auth/presentation/widgets/auth_header.dart';

class LoginFormWidget extends StatefulWidget {
  final AuthState state;

  const LoginFormWidget({
    super.key,
    required this.state,
  });

  @override
  State<LoginFormWidget> createState() => LoginFormWidgetState();
}

class LoginFormWidgetState extends State<LoginFormWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _submitForm(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<AuthBloc>().add(
          LoginEvent(_emailController.text.trim(), _passwordController.text));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary, // Fondo azul general
      body: Column(
        children: [
          // PARTE AZUL FIJA (NO SCROLL)
          SafeArea(
            bottom: false,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.35,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AuthHeader(
                    title: "Angeles\ncuidando tu salud",
                    subtitle: "Para continuar inicia sesión",
                  ),
                ],
              ),
            ),
          ),

          // PARTE BLANCA CON SCROLL CONTROLADO
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: Container(
                color: Colors.white,
                child: SingleChildScrollView(
                  controller: _scrollController,
                  physics: const BouncingScrollPhysics(),
                  child: Container(
                    constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height * 0.65,
                    ),
                    padding: const EdgeInsets.all(24),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFieldInput(
                            label: 'Email',
                            hintText: 'Enter your email',
                            controller: _emailController,
                            prefixIcon: Icons.email_outlined,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'El email es requerido';
                              }
                              if (!value.contains('@')) {
                                return 'Email inválido';
                              }
                              return null;
                            },
                          ),

                          const SizedBox(height: 20),

                          PasswordInput(
                            label: 'Contraseña',
                            controller: _passwordController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'La contraseña es requerida';
                              }
                              if (value.length < 6) {
                                return 'Mínimo 6 caracteres';
                              }
                              return null;
                            },
                          ),

                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: GestureDetector(
                                onTap: () {},
                                child: Text(
                                  "Olvidaste tu contraseña?",
                                  style: AppTextStyles.bodyMedium(
                                      color: AppColors.primary,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 24),

                          PrimaryButton(
                            text: 'INICIAR SESION',
                            onPressed: () => _submitForm(context),
                            isLoading: widget.state is AuthLoading,
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Center(
                              child: Text.rich(
                                TextSpan(
                                  text: "Ya tienes una cuenta?  ",
                                  style: AppTextStyles.bodyMedium(),
                                  children: [
                                    WidgetSpan(
                                      alignment: PlaceholderAlignment.middle,
                                      child: GestureDetector(
                                        onTap: () {
                                          print("Ir a pantalla de registro");
                                        },
                                        child: Text(
                                          "Regístrate",
                                          style: AppTextStyles.bodyMedium(
                                              color: AppColors.primary,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 30),

                          SocialButtons(
                            type: SocialAuthType.google,
                            onPressed: () {},
                          ),

                          // Espacio para el teclado
                          SizedBox(
                            height: MediaQuery.of(context).viewInsets.bottom,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
