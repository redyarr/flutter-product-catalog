import 'package:flutter/material.dart';

/// Studio-lit theme-aware radial backdrop used behind product imagery.
class StudioImageBackdrop extends StatelessWidget {
  const StudioImageBackdrop({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color outerColor = colorScheme.surfaceContainerLow;
    final Color centerColor =
        colorScheme.surfaceContainerHighest != outerColor
            ? colorScheme.surfaceContainerHighest
            : (colorScheme.brightness == Brightness.light
                ? colorScheme.surfaceContainerLowest
                : colorScheme.surfaceContainerHigh);

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: const Alignment(0, -0.08),
          radius: 0.9,
          colors: <Color>[
            centerColor,
            colorScheme.surfaceContainer,
            outerColor,
          ],
          stops: const <double>[0.0, 0.58, 1.0],
        ),
      ),
      child: child,
    );
  }
}
