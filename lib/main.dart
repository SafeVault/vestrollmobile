import 'package:flutter/material.dart';
import 'package:vestrollmobile/app.dart';
import 'package:vestrollmobile/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await _initializeImportantResources();
  await setupServiceLocator();

  runApp(const App());
}

Future<void> _initializeImportantResources() async {}
