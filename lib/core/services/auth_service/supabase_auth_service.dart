import 'package:fitness_app/core/routing/routes_paths.dart';
import 'package:fitness_app/features/auth/presentation/widgets/login_view_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuthService {
  final SupabaseClient supabaseClient = Supabase.instance.client;
  Future<AuthResponse> signInWithEmailPassword({
    required String email,
    required String password,
  }) async {
    return await supabaseClient.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }
}

// auth manager listen to the  auth state changes

class AuthLogInManager extends StatelessWidget {
  const AuthLogInManager({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Supabase.instance.client.auth.onAuthStateChange,
      builder: (context, snapshot) {
        // loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        // checking authentication
        final session = snapshot.hasData ? snapshot.data!.session : null;
        if (session != null) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.go(RoutePaths.home);
          });
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else {
          return const LoginViewBody();
        }
      },
    );
  }
}
