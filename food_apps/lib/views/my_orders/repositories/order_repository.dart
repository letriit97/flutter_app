import 'package:food_apps/views/my_orders/models/order.dart';
import 'package:uuid/uuid.dart';

class OrderRepository {
  List<Order> getOrders() {
    final uuid = Uuid();
    List<Order> orders = List.generate(10, (index) {
      return Order(
        orderNumber: uuid.v1(),
        itemCount: index + 1,
        totalAmount: 100000 * (index + 1),
        status: OrderStatus.active,
        imageUrl: 'assets/images/orders/$index.jpg',
        orderDate: DateTime.now().subtract(Duration(hours: index * 2)),
      );
    });
    return orders;
  }

  List<Order> getOrderByStatus(OrderStatus status) {
    return getOrders().where((item) => item.status == status).toList();
  }
}
