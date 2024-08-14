import 'package:easy_localization/easy_localization.dart';

import '../domain/model/dto/price.dart';

class Formatters {
  static final _smallSpace = String.fromCharCode(0x2009);

  static String formatMoneyFromPrice({required Price price}) {
    return '${price.price} ${price.currency}';
  }

  static String formatMoney({
    required double sum,
    required String currency,
  }) {
    final formatter = NumberFormat.decimalPattern('RU-ru');

    final sumText = formatter.format(sum).replaceAll(formatter.symbols.GROUP_SEP, _smallSpace);

    return '$sumText$_smallSpace${currencySymbol()}';
  }

  static String formatMoney2({
    required double sum,
    required String currency,
  }) {
    final formatter = NumberFormat.decimalPattern('RU-ru');
    double value = sum;
    if (sum < 0) {
      value = sum * -1;
    }

    final sumText = formatter.format(value).replaceAll(formatter.symbols.GROUP_SEP, _smallSpace);

    return '${sum < 0 ? '- ' : '+ '}$sumText$_smallSpace${currencySymbol()}';
  }

  static String currencySymbol() {
    return 'руб.'; //'₽';
  }

  static String fromDateCalendar(DateTime date) {
    var formatter = DateFormat('EEE, dd MMM');
    String formattedDate = formatter.format(date);
    return formattedDate;
  }

  static String fromDateCalendar2(DateTime date) {
    var formatter = DateFormat('dd MMMM');
    String formattedDate = formatter.format(date);
    return formattedDate;
  }

  static String fromStringDateCalendar2(String stringDate) {
    var dateFormatter = DateFormat('yyyy-MM-dd');
    final date = dateFormatter.parse(stringDate);
    return fromDateCalendar2(date);
  }

  static String fromDateCalendar3(DateTime date) {
    var formatter = DateFormat('MMMM');
    String formattedDate = formatter.format(date);
    return formattedDate;
  }

  static String fromDateCalendar4(DateTime date) {
    var formatter = DateFormat('yyyy');
    String formattedDate = formatter.format(date);
    return formattedDate;
  }

  static String fromDateServer(DateTime date) {
    var formatter = DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(date);
    return formattedDate;
  }

  static String pluralize(
    int count,
    String one,
    String few,
    String many, {
    String? zero,
  }) {
    if (count == 0 && (zero != null)) {
      return zero;
    }

    // Последняя цифра в числе
    int lastDigit = count % 10;

    // Предпоследняя цифра в числе
    int secondToLastDigit = (count ~/ 10) % 10;

    if (secondToLastDigit != 1) {
      if (lastDigit == 1) {
        return one;
      } else if (lastDigit >= 2 && lastDigit <= 4) {
        return few;
      }
    }

    return many;
  }
}
