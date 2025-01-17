import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/theme_provider.dart';
import 'screens/login_page.dart';
import 'preferences/preferencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Inicialitzem els Widgets
  await Preferencies.init(); // Inicialitzem SharedPreferences
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => ThemeProvider(isDarkMode: Preferencies.isDarkMode),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exemple Preferencies',
      theme: themeProvider.currentTheme, // Aplica el tema
      home: LoginPage(), // Página d'inici
    );
  }
}
