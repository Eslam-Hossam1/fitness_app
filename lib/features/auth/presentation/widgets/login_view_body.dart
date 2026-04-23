import 'package:fitness_app/core/routing/routes_paths.dart';
import 'package:fitness_app/core/services/auth_service/supabase_auth_service.dart';
import 'package:fitness_app/core/theme/app_colors.dart';
import 'package:fitness_app/core/theme/app_text_styles.dart';
import 'package:fitness_app/core/utils/assets.dart';
import 'package:fitness_app/core/widgets/buttons/custom_text_button.dart';
import 'package:fitness_app/core/widgets/text_form_fields/custom_password_form_field_with_title.dart';
import 'package:fitness_app/core/widgets/text_form_fields/custom_text_form_field_with_title.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final SupabaseAuthService supabaseAuthServise = SupabaseAuthService();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.onUserInteraction;
  late String email, password;
  void executeLogin() async {
    try {
      await supabaseAuthServise.signInWithEmailPassword(
        email: email,
        password: password,
      );
    } catch (err) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(err.toString())));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text('IronPulse', style: AppTextStyles.bold18(context)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 24, bottom: 0),
                  child: Image.asset(
                    Assets.imagesPngsLoginBody,
                    fit: BoxFit.cover,
                  ),
                ),
                Text('Welcome Back', style: AppTextStyles.bold32(context)),
                SizedBox(height: 8),
                Text(
                  'Fuel your progress. Log in to your pulse.',
                  style: AppTextStyles.regular16(
                    context,
                  ).copyWith(color: AppColors.darkSurface),
                ),
                SizedBox(height: 24),

                CustomTextFormFieldWithTitle(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Field is Required';
                    }
                    return null;
                  },
                  prefixIcon: Icon(Icons.email_outlined),
                  title: 'Email Address',
                  hint: 'Enter your email',
                  onSaved: (value) {
                    email = value!;
                  },
                ),
                SizedBox(height: 16),
                CustomPasswordTextFormFieldWithTitle(
                  validator: (value) {
                    {
                      if (value == null || value.isEmpty) {
                        return 'Field is Required';
                      }
                      return null;
                    }
                  },
                  hint: 'Enter your PassWord',
                  title: 'PassWord',
                  onSaved: (value) {
                    password = value!;
                  },
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'Forget PassWord?',
                        style: AppTextStyles.medium14(
                          context,
                        ).copyWith(color: AppColors.darkPrimary),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                CustomTextButton(
                  width: double.infinity,
                  text: 'Log In',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      // login Function
                      executeLogin();
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Do not have an account',
                      style: AppTextStyles.regular14(
                        context,
                      ).copyWith(color: AppColors.darkSurface),
                    ),
                    InkWell(
                      onTap: () {
                        context.go(RoutePaths.signUp);
                      },
                      child: Text(
                        'SignUp?',
                        style: AppTextStyles.bold14(
                          context,
                        ).copyWith(color: AppColors.darkPrimary),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
