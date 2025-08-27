import 'package:flutter/material.dart';
import 'package:food_apps/utils/app_textstyle.dart';
import 'package:food_apps/views/widgets/custom_text_field.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    void showSuccessDialog(BuildContext context) {
      Get.dialog(
        AlertDialog(
          title: Text("Check Your Email", style: AppTextStyle.bodyMedium),
          content: Text(
            "We have sent a password reset link to your email.",
            style: AppTextStyle.bodyMedium,
          ),
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: Text(
                "OK",
                style: AppTextStyle.withColor(
                  AppTextStyle.buttonMedium,
                  Theme.of(context).primaryColor,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              Text(
                'Forgot Password?',
                style: AppTextStyle.withColor(
                  AppTextStyle.h1,
                  Theme.of(context).textTheme.bodyLarge!.color!,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Enter your email to reset your password',
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
                    return 'Please enter your email';
                  }

                  if (!GetUtils.isEmail(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              // Reset Password button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => showSuccessDialog(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Reset Password'.toUpperCase(),
                    style: AppTextStyle.withColor(
                      AppTextStyle.buttonMedium,
                      Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
