import 'package:fitness_app/features/auth/presentation/view_model/sign_up_cubit.dart';
import 'package:fitness_app/features/auth/presentation/widgets/sign_up_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => SignUpCubit(),
          child: const SignUpViewBody(),
        ),
      ),
    );
  }
}
