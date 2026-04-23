import 'package:fitness_app/core/services/auth_service/supabase_auth_service.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: const AuthLogInManager()));
  }
}
