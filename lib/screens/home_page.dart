import 'package:app_sencilla/widgets/imatge_slider.dart';
import 'package:flutter/material.dart';
import '../preferences/preferencies.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';
import 'login_page.dart'; // Importa la pàgina de Login
import 'package:confetti/confetti.dart'; // Importa el paquet de confetti

// Aquesta pàgina mostra una benvinguda a l'usuari amb una imatge i un botó per disparar confetis.
// També permet canviar entre mode clar i mode fosc, i navegar a la pàgina de login.
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Crea un controlador per als confetis
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    // Inicialitza el controlador de confetis
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 1));
  }

  @override
  void dispose() {
    // Libera el controlador de confetis quan la pàgina es destrueix
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        actions: [
          // Botó per canviar entre mode clar i fosc
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
          // Botó de tancar sessió
          IconButton(
            icon: const Icon(Icons.exit_to_app), // Icona per sortir
            onPressed: () async {
              // Redirigeix a la pàgina de Login
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Container(
              width: 250,
              height: 250,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/11.png'),
                ),
              ),
            ),
            const Text(
              'Benvingut a l\'App!',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Inicia l'animació de confetis quan es prem el botó
                _confettiController.play();
              },
              child: const Text('Confetiiiiis!'),
            ),
            // Widget per mostrar els confetis
            ConfettiWidget(
              confettiController: _confettiController,
              blastDirectionality:
                  BlastDirectionality.explosive, // Direcció dels confetis
              numberOfParticles: 20, // Nombre de confetis
              gravity: 0.1, // Gravetat per al moviment dels confetis
            ),
            const SizedBox(height: 90),
            // Afegir el widget del slider d'imatges
            ImageSlider(),
          ],
        ),
      ),
    );
  }
}
