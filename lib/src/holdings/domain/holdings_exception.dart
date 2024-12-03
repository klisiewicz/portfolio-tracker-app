import 'package:meta/meta.dart';

@immutable
sealed class HoldingsException implements Exception {
  const HoldingsException();

  factory HoldingsException.notFound(String userId) =>
      HoldingsNotFoundException(userId);

  factory HoldingsException.unknown(Object source) =>
      HoldingsUnknownException(source);
}

final class HoldingsNotFoundException extends HoldingsException {
  final String userId;

  const HoldingsNotFoundException(this.userId);

  @override
  String toString() => 'HoldingsNotFoundException: $userId';
}

final class HoldingsUnknownException extends HoldingsException {
  final Object source;

  const HoldingsUnknownException(this.source);

  @override
  String toString() => 'HoldingsUnknownException: $source';
}
