import 'package:flutter/material.dart';
import 'package:mova_app/screens/choose_interest.dart';

// Import screen Anda.
// Sesuaikan path import ini jika FillProfileScreen berada di sub-folder.
// Contoh asumsi: FillProfileScreen berada di lib/features/account_setup/profile_form.dart

void main() {
  // Pastikan binding diinisialisasi sebelum menjalankan aplikasi
  WidgetsFlutterBinding.ensureInitialized(); 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark, 
        primaryColor: Color(0xFFE21220), 
        scaffoldBackgroundColor: Color(0xFF1E1E1E), 
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        fontFamily: 'Roboto', 
        useMaterial3: true,
      ),
      home: ChooseInterest(), 
    );
  }
}