import 'package:intl/intl.dart';
import 'package:localization/localization.dart';
import 'package:smart_menu_app/layers/domain/entities/product/product_entity.dart';

class AppUtils {
  static formatCurrency(double totalPrice) {
    var form = NumberFormat.currency(
        locale: 'locale'.i18n(), symbol: 'currency_symbol'.i18n());

    return form.format(totalPrice);
  }

  static calculateTax(double total, double tax) {
    return total * (tax / 100);
  }

  static calculateTotal(double total, double tax) {
    return total + (total * (tax / 100));
  }

  static sumTotal(Map<ProductEntity, int> cartList) {
    double totalPrice = 0.00;
    for (var element in cartList.entries) {
      totalPrice = element.key.price * element.value + totalPrice;
    }
    return totalPrice;
  }
}
