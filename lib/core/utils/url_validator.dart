/// Utilities for validating remote media URLs before network rendering.
abstract final class UrlValidator {
  /// Returns true only if [rawUrl] is a non-empty HTTPS URL with a valid host.
  static bool isValidHttpsUrl(String? rawUrl) {
    if (rawUrl == null) {
      return false;
    }
    final String trimmed = rawUrl.trim();
    if (!trimmed.startsWith('https://')) {
      return false;
    }
    final Uri? parsed = Uri.tryParse(trimmed);
    return parsed != null &&
        parsed.scheme == 'https' &&
        parsed.host.isNotEmpty;
  }
}
