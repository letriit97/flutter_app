// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:food_apps/utils/app_textstyle.dart';
import 'package:food_apps/views/widgets/custom_text_field.dart';
import 'package:get/get.dart';

class ProfileForm extends StatelessWidget {
  const ProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: isDark
                      ? Colors.black.withOpacity(0.2)
                      : Colors.grey.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),

            child: const CustomTextField(
              label: 'Full Name',
              prefixIcon: Icons.person_outline,
              initialvalue: 'Lee Min Tee',
            ),
          ),

          // Email
          const SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: isDark
                      ? Colors.black.withOpacity(0.2)
                      : Colors.grey.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: const CustomTextField(
              label: 'Email',
              prefixIcon: Icons.email_outlined,
              initialvalue: 'lmtri1908@gmail.com',
              keyboardType: TextInputType.emailAddress,
            ),
          ),

          // Phone Number
          const SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: isDark
                      ? Colors.black.withOpacity(0.2)
                      : Colors.grey.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: const CustomTextField(
              label: 'Phone Number',
              prefixIcon: Icons.phone_outlined,
              initialvalue: '0346390511',
              keyboardType: TextInputType.text,
            ),
          ),

          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Get.back(),
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                padding: const EdgeInsets.symmetric(vertical: 16),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Save Changes',
                style: AppTextStyle.withColor(AppTextStyle.h3, Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
