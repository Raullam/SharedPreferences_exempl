import 'package:flutter/material.dart';
import '../preferences/preferencies.dart';
import 'home_page.dart';
import 'register_page.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';

// Aquesta pàgina és la pantalla de login, on l'usuari pot introduir les seves credencials.
// Permet canviar entre mode clar i mode fosc, i accedir a la pàgina principal o a la de registre.
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadCredentials(); // Carrega les credencials des de les preferències
  }

  // Carrega les credencials guardades
  _loadCredentials() {
    _emailController.text = Preferencies.email;
    _passwordController.text = Preferencies.password;
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.end, // Alinea el botó a la dreta
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Acció creativa: mostrar un diàleg d'informació
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Exemple d\'us SharedPrefrencies'),
                          content: const Text(
                              'Exemple de login i tema nit/dia utilitzant SharedPreferences.\n\nRegistra un usuari guardant les seves credencials (Correu, contrasenya), un cop registrat ja sempre sortiran les seves credencials al registrarse (Es guarden al localStorage).\n\nEs podran esborrar les credencials a la pagina de registre!'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Tancar'),
                            ),
                          ],
                        ),
                      );
                    },
                    child: const Icon(Icons.info),
                  ),
                ],
              ),
              imatgePlanta(), // Mostra la imatge de la planta
              TextField(
                controller: _emailController,
                decoration:
                    const InputDecoration(labelText: 'Correu Electronic'),
              ),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Contrasenya'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Comprova les credencials i redirigeix a la pàgina principal
                  if (_emailController.text == Preferencies.email &&
                      _passwordController.text == Preferencies.password) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  } else {
                    // Mostra un missatge d'error si les credencials no són correctes
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Correu o contrasenya erronis')),
                    );
                  }
                },
                child: const Text('Login'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Redirigeix a la pàgina de registre
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                },
                child: const Text('Registrar-se'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget per mostrar la imatge de la planta
class imatgePlanta extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 250,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/planta1.png'),
        ),
      ),
    );
  }
}
