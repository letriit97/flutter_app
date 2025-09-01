// import 'package:flutter/material.dart';
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:food_apps/views/notifications/models/notification_type.dart';

class NotificationUtils {
  static IconData getNotificationIcon(NotificationType type) {
    switch (type) {
      case NotificationType.order:
        return Icons.shopping_cart_outlined;
      case NotificationType.delivery:
        return Icons.delivery_dining_outlined;
      case NotificationType.promotion:
        return Icons.local_offer_outlined;
      case NotificationType.payment:
        return Icons.payment_outlined;
    }
  }

  static Color getIconBackgroundColor(NotificationType type) {
    switch (type) {
      case NotificationType.order:
        return Colors.blue.withOpacity(0.2);
      case NotificationType.delivery:
        return Colors.orange.withOpacity(0.2);
      case NotificationType.promotion:
        return Colors.green.withOpacity(0.2);
      case NotificationType.payment:
        return Colors.purple.withOpacity(0.2);
    }
  }

  static Color getIconColor(NotificationType type) {
    switch (type) {
      case NotificationType.order:
        return Colors.blue;
      case NotificationType.delivery:
        return Colors.orange;
      case NotificationType.promotion:
        return Colors.green;
      case NotificationType.payment:
        return Colors.purple;
    }
  }
}
