/// Centralized API and input constraint constants.
abstract final class ApiConstants {
  /// Base HTTPS URL for the catalog backend, overridable via `--dart-define`.
  static const String baseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'https://dummyjson.com',
  );

  /// Explicit connection and receive timeout enforced on all HTTP calls.
  static const Duration timeout = Duration(seconds: 10);

  /// Debounce interval for real-time search queries.
  static const Duration searchDebounce = Duration(milliseconds: 300);

  /// Maximum permitted length for sanitized search queries.
  static const int maxSearchLength = 100;

  /// Default page limit requested from the DummyJSON products endpoint.
  static const String defaultCatalogLimit = '30';

  /// Builds a validated HTTPS [Uri] using [Uri.https] and never string concatenation.
  static Uri buildUri(String path, [Map<String, String>? queryParameters]) {
    final Uri parsed = Uri.parse(baseUrl);
    if (parsed.scheme != 'https' || parsed.authority.isEmpty) {
      throw const FormatException('API_BASE_URL must be a valid HTTPS URL.');
    }

    final String resolvedPath = parsed.path.isEmpty || parsed.path == '/'
        ? path
        : <String>[
            ...parsed.pathSegments.where((String segment) => segment.isNotEmpty),
            ...path.split('/').where((String segment) => segment.isNotEmpty),
          ].join('/');

    return Uri.https(parsed.authority, resolvedPath, queryParameters);
  }
}
