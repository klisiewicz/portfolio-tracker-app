import 'package:decimal/decimal.dart';
import 'package:decimal/intl.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

final currencyFormatProvider =
    Provider.autoDispose.family<String, Decimal>((Ref ref, Decimal amount) {
  return DecimalFormatter(
    NumberFormat.currency(
      locale: 'en_US',
      symbol: '\$',
      decimalDigits: amount.scale == 0 ? 0 : 2,
    ),
  ).format(amount);
  // return format.format(amount);
});
