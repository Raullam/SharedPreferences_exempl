import 'package:flutter/material.dart';
import 'dart:async';

// Aquesta classe crea un slider d'imatges que rota automàticament, començant des de la segona imatge.
class ImageSlider extends StatefulWidget {
  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  final List<String> imagePaths = List.generate(
    26, // Número d'imatges
    (index) =>
        'assets/plantes/${index + 1}.png', // Genera la ruta de cada imatge
  );

  // Inicialitza el PageController amb initialPage en 1 (segona imatge)
  final PageController _pageController = PageController(
    initialPage: 1, // Comença des de la segona imatge
    viewportFraction: 0.35, // Una mica més gran que abans
  );

  int _currentPage = 1; // Comença des de la segona imatge

  @override
  void initState() {
    super.initState();
    _startInfiniteRotation();
  }

  // Inicia la rotació infinita de les imatges cada 3 segons
  void _startInfiniteRotation() {
    Timer.periodic(Duration(seconds: 3), (timer) {
      if (_pageController.hasClients) {
        _currentPage++;
        if (_currentPage >= imagePaths.length) {
          _currentPage = 0; // Torna al principi
        }
        _pageController.animateToPage(
          _currentPage,
          duration: Duration(seconds: 1),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150, // Altura del slider
      child: PageView.builder(
        controller: _pageController,
        itemCount: imagePaths.length, // Número d'imatges
        itemBuilder: (context, index) {
          return Image.asset(
            imagePaths[index], // Carregar la imatge des dels assets
            fit: BoxFit.contain, // Ajustar la imatge perquè no es talli
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
