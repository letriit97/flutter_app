// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:food_apps/utils/app_textstyle.dart';
import 'package:food_apps/utils/currency.dart';
import 'package:food_apps/views/my_orders/models/order.dart';
import 'package:get/get.dart';

class OrderCard extends StatelessWidget {
  final Order order;
  final VoidCallback onViewDetails;

  const OrderCard({
    super.key,
    required this.order,
    required this.onViewDetails,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
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
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: AssetImage(order.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                const SizedBox(width: 16),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Order # ${order.orderNumber}',
                        style: AppTextStyle.withColor(
                          AppTextStyle.h3,
                          Theme.of(context).textTheme.bodyLarge!.color!,
                        ),
                      ),

                      const SizedBox(height: 4),
                      Text(
                        '${order.itemCount} items . ${order.totalAmount.toVietNameseCurrency()}',
                        style: AppTextStyle.withColor(
                          AppTextStyle.h3,
                          isDark ? Colors.grey[400]! : Colors.grey[600]!,
                        ),
                      ),

                      const SizedBox(height: 8),
                      _buildStatusChip(
                        context,
                        order.status,
                        order.statusString,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Divider(height: 1),
          InkWell(
            onTap: onViewDetails,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Text(
                'View Details',
                style: AppTextStyle.withColor(
                  AppTextStyle.buttonMedium,
                  Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusChip(
    BuildContext context,
    OrderStatus status,
    String statusString,
  ) {
    Color getStatusColor() {
      switch (status) {
        case OrderStatus.active:
          return Colors.blue;
        case OrderStatus.completed:
          return Colors.green;
        case OrderStatus.cancelled:
          return Colors.red;
      }
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: getStatusColor().withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        statusString.capitalize!,
        style: AppTextStyle.withColor(AppTextStyle.bodySmall, getStatusColor()),
      ),
    );
  }
}
