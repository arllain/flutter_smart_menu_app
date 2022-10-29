import 'package:intl/intl.dart';
import 'package:localization/localization.dart';

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
}
