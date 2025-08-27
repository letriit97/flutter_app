import 'package:flutter/material.dart';
import 'package:food_apps/utils/app_textstyle.dart';
import 'package:food_apps/views/forgot_password_screen.dart';
import 'package:food_apps/views/main_screen.dart';
import 'package:food_apps/views/sign_up_screen.dart';
import 'package:food_apps/views/widgets/custom_text_field.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              Text(
                'Welcome back!',
                style: AppTextStyle.withColor(
                  AppTextStyle.h1,
                  Theme.of(context).textTheme.bodyLarge!.color!,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Sign in to continue',
                style: AppTextStyle.withColor(
                  AppTextStyle.bodyLarge,
                  isDark ? Colors.grey[300]! : Colors.grey[600]!,
                ),
              ),
              const SizedBox(height: 40),
              CustomTextField(
                label: 'Email',
                prefixIcon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập email';
                  }

                  if (!GetUtils.isEmail(value)) {
                    return 'Vui lòng nhập email hợp lệ';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              CustomTextField(
                label: 'Password',
                prefixIcon: Icons.lock_outlined,
                keyboardType: TextInputType.visiblePassword,
                isPassword: true,
                controller: _passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập mật khẩu';
                  }

                  if (!GetUtils.isEmail(value)) {
                    return 'Vui lòng nhập email hợp lệ';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 8),

              // Forgot password?
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Handle forgot password
                    Get.to(() => ForgotPasswordScreen());
                  },
                  child: Text(
                    'Forgot password?',
                    style: AppTextStyle.withColor(
                      AppTextStyle.buttonMedium,
                      Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Sign In button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _handleSignIn,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Sign In'.toUpperCase(),
                    style: AppTextStyle.withColor(
                      AppTextStyle.buttonMedium,
                      Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),
              // Sign Up Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: AppTextStyle.withColor(
                      AppTextStyle.bodyMedium,
                      isDark ? Colors.grey[400]! : Colors.grey[600]!,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(() => SignUpScreen());
                      // Handle sign up navigation
                    },
                    child: Text(
                      'Sign up',
                      style: AppTextStyle.bodySmall.copyWith(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleSignIn() {
    final AuthenticationController authenticationController =
        Get.find<AuthenticationController>();

    // final email = _emailController.text.trim();
    // final password = _passwordController.text.trim();

    // Perform sign-in logic here
    // print('Email: $email');
    // print('Password: $password');

    authenticationController.login();
    Get.offAll(() => const MainScreen());
  }
}
