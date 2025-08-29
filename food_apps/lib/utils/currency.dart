// how to create function to use in cart_screen.dart
// how to static use like that amount.formatCurrency()

extension CurrencyFormatting on double {
  String toVietNameseCurrency() {
    return '${toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')} đ';
  }
}
