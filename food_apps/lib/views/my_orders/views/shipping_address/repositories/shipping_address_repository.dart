import 'package:food_apps/views/my_orders/views/shipping_address/models/address.dart';
import 'package:uuid/uuid.dart';

class ShippingAddressRepository {
  List<Address> getAddresses() {
    final uuid = Uuid();
    return [
      new Address(
        id: '1',
        label: 'Home',
        fullAddress:
            '123 main street , phuong phu tho, thu dau mot, tinh binh duong',
        city: 'Thu dau mot, binh duong',
        state: 'NY',
        zipCode: '10001',
        type: AddressType.home,
      ),
      new Address(
        id: '2',
        label: 'Office',
        fullAddress:
            '123 To dan pho 16, T.T Pongdrang, Huyen krongbuk, Tinh Daklak',
        city: 'krongbuk, Tinh Daklak',
        state: 'NY',
        zipCode: '10002',
        type: AddressType.office,
      ),
    ];
  }

  Address? getDefaultAddress() {
    return getAddresses().firstWhere(
      (address) => address.isDefault,
      orElse: () => getAddresses().first,
    );
  }
}
