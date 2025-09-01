import 'package:food_apps/views/notifications/models/notification_type.dart';

class NotificationRepository {
  List<NotificationItem> getNotifications() {
    return [
      NotificationItem(
        title: 'New Order',
        message: 'You have a new order from John Doe.',
        time: '2 min ago',
        type: NotificationType.order,
        isRead: true,
      ),
      NotificationItem(
        title: 'Delivery Update',
        message: 'Your order has been shipped.',
        time: '1 hour ago',
        type: NotificationType.delivery,
      ),
      NotificationItem(
        title: 'Promotion',
        message: 'Get 20% off on your next order!',
        time: '3 hours ago',
        type: NotificationType.promotion,
        isRead: true,
      ),
      NotificationItem(
        title: 'Payment Received',
        message: 'Your payment has been received.',
        time: '5 hours ago',
        type: NotificationType.payment,
        isRead: true,
      ),
    ];
  }
}
