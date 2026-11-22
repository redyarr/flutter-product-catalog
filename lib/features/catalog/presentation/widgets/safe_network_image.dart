import 'package:flutter/material.dart';
import 'package:flutter_testapp/core/utils/url_validator.dart';

/// Displays a network image only after validating `https://` scheme safety,
/// with loading placeholder and graceful error fallback.
class SafeNetworkImage extends StatelessWidget {
  const SafeNetworkImage({
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.semanticsLabel,
    super.key,
  });

  final String imageUrl;
  final BoxFit fit;
  final String? semanticsLabel;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    if (!UrlValidator.isValidHttpsUrl(imageUrl)) {
      return _ImageFallback(colorScheme: colorScheme);
    }

    return Image.network(
      imageUrl,
      fit: fit,
      semanticLabel: semanticsLabel,
      loadingBuilder: (
        BuildContext context,
        Widget child,
        ImageChunkEvent? loadingProgress,
      ) {
        if (loadingProgress == null) {
          return child;
        }
        return DecoratedBox(
          decoration: BoxDecoration(color: colorScheme.surfaceContainer),
          child: Center(
            child: Icon(
              Icons.image_outlined,
              size: 28,
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        );
      },
      errorBuilder: (
        BuildContext context,
        Object error,
        StackTrace? stackTrace,
      ) {
        return _ImageFallback(colorScheme: colorScheme);
      },
    );
  }
}

class _ImageFallback extends StatelessWidget {
  const _ImageFallback({required this.colorScheme});

  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: colorScheme.surfaceContainer),
      child: Center(
        child: Icon(
          Icons.inventory_2_outlined,
          size: 32,
          color: colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }
}
