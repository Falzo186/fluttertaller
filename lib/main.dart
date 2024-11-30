
import 'package:supabase_flutter/supabase_flutter.dart';

import 'views/landing_view.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

 await Supabase.initialize(
    url: 'https://zimaquloazgxlsrkansg.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InppbWFxdWxvYXpneGxzcmthbnNnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzIwNzk5OTEsImV4cCI6MjA0NzY1NTk5MX0.yrX23ncF2_Eyi4Uc31Xum7CaAR6UWsTCynexXUeFwQ4',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'taller',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
     home: const LandingView(),
     
    );
  }
}

