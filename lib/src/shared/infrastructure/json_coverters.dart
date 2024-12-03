import 'package:decimal/decimal.dart';
import 'package:json_annotation/json_annotation.dart';

class DecimalNumConverter implements JsonConverter<Decimal, num> {
  const DecimalNumConverter();

  @override
  Decimal fromJson(num json) => Decimal.parse('$json');

  @override
  num toJson(Decimal object) => object.toDouble();
}
