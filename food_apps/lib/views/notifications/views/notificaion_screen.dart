// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:food_apps/utils/app_textstyle.dart';
import 'package:food_apps/views/notifications/models/notification_type.dart';
import 'package:food_apps/views/notifications/repositories/notification_repository.dart';
import 'package:food_apps/views/notifications/utils/notitication_utils.dart';
import 'package:get/get.dart';

class NotificaionScreen extends StatelessWidget {
  final NotificationRepository _repository = NotificationRepository();
  NotificaionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final notifications = _repository.getNotifications();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: isDark ? Colors.white : Colors.black,
          ),
        ),

        title: Text(
          'Notifications',
          style: AppTextStyle.withColor(
            AppTextStyle.h3,
            isDark ? Colors.white : Colors.black,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Mask all as read',
              style: AppTextStyle.withColor(
                AppTextStyle.bodyMedium,
                Theme.of(context).primaryColor,
              ),
            ),
          ),
        ],
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: notifications.length,
        itemBuilder: (context, index) =>
            _buildNotificationCard(context, notifications[index]),
      ),
    );
  }

  Widget _buildNotificationCard(
    BuildContext context,
    NotificationItem notification,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: notification.isRead
            ? Theme.of(context).cardColor
            : Theme.of(context).primaryColor.withOpacity(0.1),

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

      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: NotificationUtils.getIconBackgroundColor(notification.type),
            shape: BoxShape.circle,
          ),
          child: Icon(
            NotificationUtils.getNotificationIcon(notification.type),
            color: NotificationUtils.getIconColor(notification.type),
          ),
        ),
        title: Text(
          notification.title,
          style: AppTextStyle.withColor(
            AppTextStyle.bodyLarge,
            Theme.of(context).textTheme.bodyLarge!.color!,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              notification.message,
              style: AppTextStyle.withColor(
                AppTextStyle.bodySmall,
                isDark ? Colors.grey[400]! : Colors.grey[600]!,
              ),
            ),
          ],
        ),
        // trailing: Text(
        //   notification.time,
        //   style: AppTextStyle.withColor(
        //     AppTextStyle.bodySmall,
        //     isDark ? Colors.white54 : Colors.black54,
        //   ),
        // ),
      ),
    );
  }
}
