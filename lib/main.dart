import 'package:flutter/material.dart';
import 'package:vestrollmobile/app.dart';
import 'package:vestrollmobile/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await _initializeImportantResources();

  // Initialize dependency injection
  await setupServiceLocator();

  runApp(const App());
}

Future<void> _initializeImportantResources() async {
  // Load environment variables or perform other startup logic here
  // await dotenv.load(fileName: ".env");
}
