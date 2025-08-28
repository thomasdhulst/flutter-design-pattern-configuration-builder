# vehicule_card — Lancement et tests rapides

Ce projet Flutter contient plusieurs écrans de démonstration. Vous pouvez lancer l’app et choisir quel écran afficher en modifiant un index `bodies[0..3]` dans [`lib/main.dart`](lib/main.dart).

## Prérequis
- Flutter installé et dans le PATH (vérifier avec `flutter --version`)
- Un device (émulateur/simulateur ou physique) disponible (`flutter devices`)

## Installation des dépendances
```sh
flutter pub get
```

## Lancer l’application
- Lancer sur le device par défaut:
  ```sh
  flutter run
  ```
- Lancer sur une plateforme spécifique (exemples):
  ```sh
  flutter run -d chrome     # Web
  flutter run -d ios        # iOS (simulateur)
  flutter run -d macos      # macOS
  flutter run -d windows    # Windows
  flutter run -d linux      # Linux
  ```

## Choisir l’écran à afficher (bodies[0..3])
1. Ouvrir [`lib/main.dart`](lib/main.dart).
2. Repérer le tableau `bodies` et la ligne `runApp(...)`.
3. Remplacer l’index pour choisir l’écran:

```dart
// filepath: lib/main.dart
// ...existing code...
  final bodies = const [
    ListOfVehicule1(),  // 0
    ListOfVehicles2(),  // 1
    BikePage1(),        // 2
    BikePage2(),        // 3
  ];
  runApp(VehiclesDemoApp(body: bodies[3])); // <- changez l’index 0..3 ici
// ...existing code...
```

- Mapping des écrans:
  - 0 — [`ListOfVehicule1`](lib/list_of_vehicule1.dart) : Garage (sans Builder)
  - 1 — [`ListOfVehicles2`](lib/list_of_vehicles2.dart) : Garage (avec Builder & Director)
  - 2 — [`BikePage1`](lib/bike_page1.dart) : Vélo en action (sans Builder)
  - 3 — [`BikePage2`](lib/bike_page2.dart) : Vélo en action (avec Builder)

L’application est enveloppée par [`VehiclesDemoApp`](lib/widgets/vehicles_demo_app.dart), qui fournit le thème et un bandeau de démo.

## Dépannage rapide
- Ressources non à jour:
  ```sh
  flutter clean
  flutter pub get
  flutter run
  ```
- Aucun device détecté:
  ```sh
  flutter devices
  ```
  Démarrez un simulateur/émulateur ou connectez un appareil.