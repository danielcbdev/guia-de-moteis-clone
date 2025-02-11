import 'package:guia_de_moteis_clone/core/utils/utils.dart';
import 'package:intl/intl.dart';

final mask = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

extension DoubleToMoney on double {
  String get toMoney => mask.format(this);
}

extension UnmaskMoney on String {
  double get unmask => double.parse(
        replaceAll('R\$', '').replaceAll(' ', '').replaceAll(',', '.'),
      );
}

extension StringToMoney on String {
  String get toMoney => 'R\$ ${double.parse(this) < 1 ? '0' : ''}${Utils.numberFormatCurrency(double.parse(this))}';
}
