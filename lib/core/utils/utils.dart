import 'package:intl/intl.dart';

class Utils {
  static String numberFormatCurrency(double number) => NumberFormat.currency(locale: 'pt', customPattern: '#,###', symbol: '', decimalDigits: 2).format(number);
}