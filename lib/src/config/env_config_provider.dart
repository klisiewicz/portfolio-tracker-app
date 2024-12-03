import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final baseUrlProvider = Provider<String>((Ref ref) {
  const baseUrlKey = 'BASE_URL';
  final baseUrl = dotenv.env[baseUrlKey];
  if (baseUrl == null) throw EnvVariableNotFoundError._(baseUrlKey);
  return baseUrl;
});

final class EnvVariableNotFoundError extends Error {
  final String variable;

  EnvVariableNotFoundError._(this.variable);

  @override
  String toString() {
    return 'Missing env variable "$variable". Make sure, the the ".env" file '
        'exists and contains "$variable" variable.';
  }
}
