import 'package:intl/intl.dart';

class HumanFormats {
  // ignore: non_constant_identifier_names
  static String HumanFormatsNumber( double number){
    final formatterNumber = NumberFormat.compactCurrency(
      decimalDigits: 0,
      symbol: '',
    ).format(number);
    return formatterNumber;
  }
}