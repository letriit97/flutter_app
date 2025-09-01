// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:food_apps/controllers/auth_controller.dart';
import 'package:food_apps/utils/app_textstyle.dart';
import 'package:food_apps/views/my_orders/views/screens/my_order_screen.dart';
import 'package:food_apps/views/setting_screen.dart';
import 'package:food_apps/views/signin_screen.dart';
import 'package:get/get.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Account',
          style: AppTextStyle.withColor(
            AppTextStyle.h3,
            isDark ? Colors.white : Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => Get.to(() => SettingScreen()),
            icon: Icon(
              Icons.settings_outlined,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
        ],
        backgroundColor: isDark ? Colors.black : Colors.white,
        foregroundColor: isDark ? Colors.white : Colors.black,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildProfileSection(context),
            const SizedBox(height: 24),
            _buildMenuSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileSection(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[900] : Colors.grey[200],
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(24.0),
        ),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/images/avatar.png'),
          ),
          SizedBox(width: 12),
          Text(
            "Lee Min Tee",
            style: AppTextStyle.withColor(
              AppTextStyle.h2,
              Theme.of(context).textTheme.bodyLarge!.color!,
            ),
          ),
          SizedBox(height: 4),
          Text(
            "lmtri97@gmail.com",
            style: AppTextStyle.withColor(
              AppTextStyle.bodyMedium,
              isDark ? Colors.grey[400]! : Colors.grey[600]!,
            ),
          ),

          SizedBox(height: 16),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
              side: BorderSide(
                color: isDark ? Colors.grey[400]! : Colors.grey[600]!,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: Text(
              "Edit Profile",
              style: AppTextStyle.withColor(
                AppTextStyle.bodyMedium,
                Theme.of(context).textTheme.bodyLarge!.color!,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuSection(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final menuItem = [
      {'icon': Icons.shopping_bag_outlined, 'title': 'My Order'},
      {'icon': Icons.location_on_outlined, 'title': 'Shipping Address'},
      {'icon': Icons.help_outline, 'title': 'Help Center'},
      {'icon': Icons.logout_outlined, 'title': 'Logout'},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: menuItem.map((item) {
          return Container(
            margin: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
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
            child: ListTile(
              leading: Icon(
                item['icon'] as IconData,
                color: Theme.of(context).primaryColor,
              ),
              title: Text(
                item['title'] as String,
                style: AppTextStyle.withColor(
                  AppTextStyle.bodyMedium,
                  Theme.of(context).textTheme.bodyLarge!.color!,
                ),
              ),
              trailing: Icon(
                Icons.chevron_right,
                color: isDark ? Colors.grey[400] : Colors.grey[600],
              ),
              onTap: () {
                if (item['title'] == 'Logout') {
                  // Handle logout action
                  _showLogoutDialog(context);
                } else if (item['title'] == 'My Order') {
                  Get.to(() => MyOrderScreen());
                  // Handle My Order action
                } else if (item['title'] == 'Shipping Address') {
                  // Handle Shipping Address action
                } else {
                  // Handle other menu item actions
                }
              },
            ),
          );
        }).toList(),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    Get.dialog(
      AlertDialog(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 20.0,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.logout_rounded,
                size: 32,
                color: Theme.of(context).primaryColor,
              ),
            ),

            const SizedBox(height: 8),
            Text(
              "Are you sure you want to logout?",
              style: AppTextStyle.withColor(
                AppTextStyle.bodyMedium,
                isDark ? Colors.grey[400]! : Colors.grey[600]!,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Get.back(),
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 12.0),
                      side: BorderSide(
                        color: isDark ? Colors.grey[700]! : Colors.grey[300]!,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    child: Text(
                      "Cancel",
                      style: AppTextStyle.withColor(
                        AppTextStyle.buttonMedium,
                        Theme.of(context).textTheme.bodyLarge!.color!,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      final AuthenticationController authController =
                          Get.find<AuthenticationController>();
                      authController.logout();
                      Get.offAll(() => SignInScreen());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      elevation: 0,
                      padding: EdgeInsets.symmetric(vertical: 12.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    child: Text(
                      "Logout",
                      style: AppTextStyle.withColor(
                        AppTextStyle.buttonMedium,
                        Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
