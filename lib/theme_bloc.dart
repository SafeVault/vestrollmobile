import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Theme Events (keep the same)
abstract class ThemeEvent {}

class ThemeToggled extends ThemeEvent {}

class ThemeChanged extends ThemeEvent {
  final ThemeMode themeMode;
  ThemeChanged(this.themeMode);
}

// Theme State (keep the same)
class ThemeState {
  final ThemeMode themeMode;
  
  const ThemeState({required this.themeMode});
  
  bool get isDarkMode => themeMode == ThemeMode.dark;
  
  ThemeState copyWith({ThemeMode? themeMode}) {
    return ThemeState(
      themeMode: themeMode ?? this.themeMode,
    );
  }
}

// Convert to regular Bloc with manual persistence
class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  static const String _themeKey = 'theme_mode';
  
  ThemeBloc() : super(const ThemeState(themeMode: ThemeMode.light)) {
    on<ThemeToggled>(_onThemeToggled);
    on<ThemeChanged>(_onThemeChanged);
    
    // Load initial theme
    _loadTheme();
  }
  
  void _onThemeToggled(ThemeToggled event, Emitter<ThemeState> emit) async {
    final newThemeMode = state.themeMode == ThemeMode.light 
        ? ThemeMode.dark 
        : ThemeMode.light;
    emit(state.copyWith(themeMode: newThemeMode));
    await _saveTheme(newThemeMode);
  }
  
  void _onThemeChanged(ThemeChanged event, Emitter<ThemeState> emit) async {
    emit(state.copyWith(themeMode: event.themeMode));
    await _saveTheme(event.themeMode);
  }
  
  Future<void> _loadTheme() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final themeIndex = prefs.getInt(_themeKey) ?? 0;
      final themeMode = ThemeMode.values[themeIndex];
      add(ThemeChanged(themeMode));
    } catch (e) {
      // Handle error, use default theme
    }
  }
  
  Future<void> _saveTheme(ThemeMode themeMode) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt(_themeKey, themeMode.index);
    } catch (e) {
      // Handle error
    }
  }
}