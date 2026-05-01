import 'package:fitness_app/core/routing/routes_paths.dart';
import 'package:fitness_app/core/utils/app_regex.dart';
import 'package:fitness_app/core/utils/assets.dart';
import 'package:fitness_app/core/widgets/buttons/custom_elevated_button.dart';
import 'package:fitness_app/core/widgets/text_form_fields/custom_text_form.dart';
import 'package:fitness_app/core/widgets/toast/show_toast.dart';
import 'package:fitness_app/features/auth/presentation/view_model/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fitness_app/core/extensions/responsive_extension.dart';
import 'package:fitness_app/core/theme/app_text_styles.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'IronPulse',
          style: AppTextStyles.bold22(context, color: Colors.white),
        ),
        centerTitle: true,
        leading: BackButton(onPressed: () => context.go(RoutePaths.login)),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w(context)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SignUpUpperPart(),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textFieldTitle(text: ' Full Name', context: context),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h(context)),
                      child: CustomTextForm(
                        controller: _nameController,
                        keyboardType: TextInputType.name,
                        hintText: 'Enter your Name',
                      ),
                    ),
                    textFieldTitle(text: ' Email Address', context: context),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h(context)),
                      child: CustomTextForm(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        hintText: 'Enter your Email',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email is required';
                          } else if (!AppRegex.isValidEmail(value)) {
                            return 'Enter a valid email';
                          }
                          return null;
                        },
                      ),
                    ),
                    textFieldTitle(text: ' Password', context: context),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h(context)),
                      child: CustomTextForm(
                        controller: _passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        hintText: 'Enter your Password',
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                          child: Icon(
                            _isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                        obscureText: !_isPasswordVisible,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password is required';
                          } else if (!AppRegex.isPasswordValid(value)) {
                            return 'Min 8 chars, upper, lower, number & symbol';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h(context)),
              BlocConsumer<SignUpCubit, SignUpState>(
                listener: (context, state) {
                  if (state is SignUpSuccess) {
                    context.go(RoutePaths.login);
                    ShowToast.showToastSuccessTop(context: context, message: 'Account Created');
                  } else if (state is SignUpFailure) {
                    ShowToast.showToastErrorTop(context: context, message: state.message);
                  }
                },
                builder: (context, state) {
                  final isLoading = state is SignUpLoading;

                  return CustomElevatedButton(
                    onPressed: isLoading
                        ? () {}
                        : () {
                            if (_formKey.currentState!.validate()) {
                              context.read<SignUpCubit>().signUp(
                                name: _nameController.text,
                                email: _emailController.text.trim(),
                                password: _passwordController.text,
                              );
                            }
                          },
                    text: isLoading ? 'Loading...' : 'Create Account',
                    width: double.infinity,
                    height: 50.h(context),
                    backgroundColor: isLoading
                        ? Colors.grey.withOpacity(0.5)
                        : const Color(0xFF0D7FF2),
                    textColor: Colors.white,
                    // isLoading: state is SignUpLoading,
                  );
                },
              ),
              SizedBox(height: 15.h(context)),
              const DividerOR(),
              SizedBox(height: 10.h(context)),
              const SignUpWithGoogle(),
              SizedBox(height: 10.h(context)),
              const HaveAnAccount(),
            ],
          ),
        ),
      ),
    );
  }

  Padding textFieldTitle({required String text, required BuildContext context}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 2.h(context), top: 5.h(context)),
      child: Text(
        text,
        style: AppTextStyles.bold14(context, color: Colors.white),
      ),
    );
  }
}

class SignUpWithGoogle extends StatelessWidget {
  const SignUpWithGoogle({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55.h(context),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF1E2A3A),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(color: Colors.white.withOpacity(0.2)),
          ),
        ),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.imagesSvgsGoogle,
              width: 24.w(context),
              height: 24.h(context),
            ),
            SizedBox(width: 10.w(context)),
            Text(
              'Sign up with Google',
              style: AppTextStyles.bold16(context, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class HaveAnAccount extends StatelessWidget {
  const HaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account? ',
          style: AppTextStyles.regular14(context, color: Colors.white54),
        ),
        GestureDetector(
          onTap: () => context.go(RoutePaths.login),
          child: Text(
            'Log in',
            style: AppTextStyles.bold14(context, color: const Color(0xFF2563EB)),
          ),
        ),
      ],
    );
  }
}

class DividerOR extends StatelessWidget {
  const DividerOR({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: Colors.white.withOpacity(0.2),
            thickness: 1,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w(context)),
          child: Text(
            'OR',
            style: AppTextStyles.regular14(context, color: Colors.white38),
          ),
        ),
        Expanded(
          child: Divider(
            color: Colors.white.withOpacity(0.2),
            thickness: 1,
          ),
        ),
      ],
    );
  }
}

class SignUpUpperPart extends StatelessWidget {
  const SignUpUpperPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          Assets.imagesPngsSignUp,
          height: 200.h(context),
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Positioned(
          bottom: 35,
          left: 50,
          child: Text('Join the Forge', style: AppTextStyles.bold36(context, color: Colors.white)),
        ),
        Positioned(
          bottom: 15,
          left: 15,
          child: Text(
            'Start your transformation journey today.',
            style: AppTextStyles.regular16(context, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
