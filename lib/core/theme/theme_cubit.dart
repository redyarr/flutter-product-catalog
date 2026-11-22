import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Manages application [ThemeMode], defaulting to system and supporting AppBar toggle.
class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);

  /// Toggles between [ThemeMode.dark] and [ThemeMode.light] based on [currentBrightness].
  void toggleTheme(Brightness currentBrightness) {
    final ThemeMode nextMode = currentBrightness == Brightness.dark
        ? ThemeMode.light
        : ThemeMode.dark;
    emit(nextMode);
  }
}
