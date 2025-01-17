import 'package:flutter/material.dart';
import '../preferences/preferencies.dart';

/// Aquesta classe gestiona el tema de l'aplicació (clar o fosc).
/// Utilitza SharedPreferences per guardar l'estat del mode (clar/fosc) entre sessions.
class ThemeProvider extends ChangeNotifier {
  ThemeData currentTheme;

  // Constructor que inicialitza el tema segons l'estat guardat a les preferències
  ThemeProvider({required bool isDarkMode})
      : currentTheme = isDarkMode ? ThemeData.dark() : ThemeData.light();

  // Canviar a mode clar
  setLightMode() {
    currentTheme = ThemeData.light();
    Preferencies.isDarkMode = false; // Guardem l'estat a les preferències
    notifyListeners();
  }

  // Canviar a mode fosc
  setDarkMode() {
    currentTheme = ThemeData.dark();
    Preferencies.isDarkMode = true; // Guardem l'estat a les preferències
    notifyListeners();
  }
}
