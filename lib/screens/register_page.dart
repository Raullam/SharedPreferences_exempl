import 'package:flutter/material.dart';
import '../preferences/preferencies.dart';
import 'login_page.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';

// Aquesta pàgina permet registrar un nou usuari, guardant les seves credencials (correu i contrasenya).
// També permet esborrar les credencials guardades i canviar entre mode clar i mode fosc.
class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Guarda les credencials a SharedPreferences
  _saveCredentials() {
    Preferencies.email = _emailController.text;
    Preferencies.password = _passwordController.text;
  }

  // Esborra les credencials guardades i neteja els camps de text
  _clearCredentials() {
    Preferencies.email = '  ';
    Preferencies.password = '';
    _emailController.clear();
    _passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Registre'),
        centerTitle: true,
        actions: [
          // Botó per canviar entre mode clar i mode fosc
          IconButton(
            icon: Icon(themeProvider.currentTheme == ThemeData.dark()
                ? Icons.wb_sunny
                : Icons.nights_stay),
            onPressed: () {
              themeProvider.currentTheme == ThemeData.dark()
                  ? themeProvider.setLightMode()
                  : themeProvider.setDarkMode();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Camp per introduir el correu electrònic
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Correu electronic'),
            ),
            // Camp per introduir la contrasenya
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Contrasenya'),
            ),
            const SizedBox(height: 20),
            // Botó per registrar l'usuari
            ElevatedButton(
              onPressed: () {
                _saveCredentials(); // Guarda les credencials
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          LoginPage()), // Redirigeix a la pàgina de login
                );
              },
              child: const Text('Registrar'),
            ),
            const SizedBox(height: 20),
            // Botó per esborrar les credencials
            ElevatedButton(
              onPressed: _clearCredentials, // Esborra les credencials
              child: const Text('Esborrar contingut  Credentials'),
            ),
          ],
        ),
      ),
    );
  }
}
