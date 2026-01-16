import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seguromedico/core/di/injection.dart';
import 'package:seguromedico/core/theme/app_color.dart';
import 'package:seguromedico/core/widgets/custom_layout.dart';
import 'package:seguromedico/features/auth/domain/usecases/login/login_use_case.dart';
import 'package:seguromedico/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:seguromedico/features/auth/presentation/bloc/auth_state.dart';
import 'package:seguromedico/features/auth/presentation/widgets/login/login_form_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthBloc(loginUseCase: getIt<LoginUseCase>()),
      child: const _LoginView(),
    );
  }
}

class _LoginView extends StatelessWidget {
  const _LoginView();

  @override
  Widget build(BuildContext context) {
    return CustomLayout(
      statusColor: AppColors.primary,
      statusIcons: Brightness.light,
      iosStatusBrightness: Brightness.dark,
      navColor: Colors.white,
      navIcons: Brightness.dark,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
          if (state is AuthSuccess) {
            Navigator.pushNamed(context, "/doctor-dashboard");
          }
        },
        builder: (context, state) {
          return LoginFormWidget(state: state);
        },
      ),
    );
  }
}
