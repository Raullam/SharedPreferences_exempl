# app_sencilla


Descripció

Aquesta aplicació és una app de demostració que integra les funcionalitats de registre d'usuaris, login, canvi de temes (clar/oscuro) i un slider d'imatges que rota automàticament. La informació de l'usuari es guarda localment mitjançant SharedPreferences, permetent que les credencials (correu electrònic i contrasenya) es mantinguin entre sessions. A més, la configuració del tema (clar/oscuro) es guarda i es gestiona amb Provider.

Funcionalitats

Login i Registre: Permet als usuaris registrar-se amb el seu correu electrònic i contrasenya, i iniciar sessió amb aquestes credencials.
Temes (Clar/Oscuro): Canvi de tema (clar o fosc) que es guarda a les preferències de l'usuari.
Slider d'Imatges: Un slider que mostra imatges de plantes i rota automàticament, començant des de la segona imatge.
Confetti: Quan es prem un botó, es mostren confetis per a celebrar l'acció.

# Com Funciona

# 1. SharedPreferences per a l'emmagatzematge de dades
SharedPreferences s'utilitza per emmagatzemar dades locals de l'usuari com el correu electrònic, la contrasenya i l'estat del tema (clar/oscuro).
Quan l'usuari es registra o inicia sessió, les seves credencials es guarden en les preferències locals per garantir que es mantinguin entre sessions.
Preferencies és una classe que s'encarrega de gestionar l'emmagatzematge i recuperació de les preferències de l'usuari, utilitzant SharedPreferences.

# 2. Provider per a la gestió del tema
Provider és utilitzat per gestionar l'estat global de l'aplicació, com el tema (clar/oscuro).
La classe ThemeProvider s'encarrega de gestionar el tema actual de l'aplicació i notificar els canvis a les pantalles que l'estiguin escoltant.
Quan l'usuari canvia el tema (mitjançant la icona de la barra d'accions), el canvi es guarda a les preferències amb Preferencies.isDarkMode i es notifica a través de notifyListeners() per actualitzar l'UI.

# 3. LoginPage i RegisterPage
LoginPage: Els usuaris poden iniciar sessió amb el correu electrònic i la contrasenya guardats en les preferències locals. Si les credencials coincideixen, l'usuari accedeix a la pantalla d'inici.
RegisterPage: Els usuaris poden registrar-se amb el seu correu electrònic i contrasenya. Un cop registrats, les seves credencials es guarden a les preferències locals.

# 4. HomePage
Un cop l'usuari inicia sessió, accedeix a la pantalla d'inici on es mostra un missatge de benvinguda i un slider d'imatges.
A la pantalla d'inici també hi ha un botó per mostrar confetis.
Els usuaris poden continuar navegant per la app o canviar entre modes (clar/oscuro).

# 5. ImageSlider
Un slider d'imatges que rota automàticament entre un conjunt d'imatges de plantes.
El slider comença des de la segona imatge i rota cada 3 segons.
Les imatges es mostren amb un efecte de desplaçament suau.

# 6. Confetti

Quan l'usuari prem el botó de confetis, es mostren confetis a la pantalla per a celebrar l'acció.

## Com Ho Fem

1. SharedPreferences: Emmagatzematge Local
SharedPreferences és una eina que permet guardar petites quantitats de dades localment, com el correu electrònic, la contrasenya i les preferències de l'usuari.
En aquesta aplicació, utilitzem Preferencies per gestionar l'emmagatzematge i la recuperació de les dades de l'usuari (com el correu electrònic i la contrasenya).
Quan l'usuari es registra o inicia sessió, les seves credencials es guarden amb:

dart

Preferencies.email = _emailController.text;
Preferencies.password = _passwordController.text;

Això permet que les credencials es mantinguin disponibles fins que l'usuari decideixi esborrar-les o modificar-les.

2. Provider: Gestió del Tema
Provider és una solució d'estat per Flutter que permet gestionar l'estat global de l'aplicació. En aquest cas, el tema de l'aplicació (clar o fosc).
La classe ThemeProvider és un ChangeNotifier que s'encarrega de gestionar l'estat del tema. Quan l'usuari canvia el tema, es guarda a les preferències locals amb:

dart
Preferencies.isDarkMode = true; // Guardem el mode fosc
notifyListeners() s'utilitza per notificar a totes les pantalles que estan escoltant que el tema ha canviat i que cal actualitzar l'UI.

3. PageView per al Slider d'Imatges
El slider d'imatges utilitza un PageView.builder per mostrar les imatges. El PageController es configura per començar des de la segona imatge i fa una rotació automàtica cada 3 segons.
Quan l'usuari canvia la imatge manualment o el sistema fa una rotació automàtica, la imatge es mostra amb un efecte suau de desplaçament.

4. ConfettiWidget
Utilitzem el paquet confetti per mostrar confetis quan l'usuari prem un botó. El controlador de confetis es gestiona a la pantalla d'inici i es dispara quan l'usuari fa clic en el botó de confetis.

Estructura del Projecte
```lib/
lib/
├── main.dart            # Punt d'entrada de l'aplicació
├── pages/
│   ├── home_page.dart   # Pantalla d'inici
│   ├── login_page.dart  # Pantalla de login
│   ├── register_page.dart # Pantalla de registre
├── preferences/
│   └── preferencies.dart # Classe per gestionar SharedPreferences
├── providers/
│   └── theme_provider.dart # Proveïdor per gestionar el tema
└── widgets/
    └── imatge_slider.dart # Widget per al slider d'imatges
```
    
Dependències

flutter: SDK de Flutter.
provider: Per a la gestió de l'estat global (tema).
shared_preferences: Per emmagatzemar informació localment.
confetti: Per mostrar confetis a la pantalla.

##Com executar l'app
Clona aquest repositori a la teva màquina local:


```bash
git clone https://github.com/usuari/app_sencilla.git
Navega fins al directori del projecte:
```
```bash
cd app_sencilla
Instal·la les dependències:
```

```bash
flutter pub get
Executa l'aplicació:
```
bash
```bash
flutter run
```

Contribució
Si vols contribuir a aquesta aplicació, pots fer un fork d'aquest repositori, realitzar els canvis i enviar un pull request. Tots els comentaris i millores són benvinguts!

Aquest README fa èmfasi en com SharedPreferences i Provider s'utilitzen per gestionar les preferències de l'usuari i l'estat global de l'aplicació (tema), respectivament. Si tens més preguntes o necessites més detalls, no dubtis a preguntar!
