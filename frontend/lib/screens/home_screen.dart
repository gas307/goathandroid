import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'login_screen.dart'; // 👈 dodaj ten import, jeśli pliki są w jednym folderze

class HomeScreen extends StatelessWidget {
  final String email;

  const HomeScreen({required this.email});

  void _signOut(BuildContext context) async {
    await GoogleSignIn().signOut();
    print("🚪 Wylogowano użytkownika");

    // Przejście z powrotem do ekranu logowania
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Strona główna"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            tooltip: "Wyloguj",
            onPressed: () => _signOut(context),
          )
        ],
      ),
      body: Center(
        child: Text(
          "Zalogowano jako:\n$email",
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
