import 'package:shared_preferences/shared_preferences.dart';

/// Aquesta classe gestiona les preferències de l'usuari utilitzant SharedPreferences.
/// Permet guardar i recuperar el correu electrònic, la contrasenya i l'estat del mode fosc.
/// També permet netejar les preferències guardades.
///
class Preferencies {
  static late SharedPreferences _prefs;

  static String _email = '';
  static String _password = '';
  static bool _isDarkMode = false; // Afegim l'estat del tema

  // Inicialitza SharedPreferences
  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Getter i Setter per al correu electrònic
  static String get email {
    return _prefs.getString('email') ?? _email;
  }

  static set email(String value) {
    _email = value;
    _prefs.setString('email', value);
  }

  // Getter i Setter per a la contrasenya
  static String get password {
    return _prefs.getString('password') ?? _password;
  }

  static set password(String value) {
    _password = value;
    _prefs.setString('password', value);
  }

  // Getter i Setter per a l'estat del mode fosc
  static bool get isDarkMode {
    return _prefs.getBool('isDarkMode') ?? _isDarkMode;
  }

  static set isDarkMode(bool value) {
    _isDarkMode = value;
    _prefs.setBool('isDarkMode', value);
  }

  // Mètode per netejar les preferències (esborrar correu i contrasenya)
  static Future<void> clear() async {
    await _prefs.remove('email');
    await _prefs.remove('password');
  }
}
