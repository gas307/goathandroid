import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'screens/login_screen.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");

  // 👉 Prawidłowe miejsce na print
  print("🟢 MAIN ODPALOWY");
  print("📦 API_URL: ${dotenv.env['API_URL']}");

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Logowanie Google',
      home: LoginScreen(),
    );
  }
}
