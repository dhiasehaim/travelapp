import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:travelapp/Page1.dart';

void main() async{
  await Supabase.initialize(
    anonKey:'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1vZnp1ZXJqZnFqY3FiYmV6bGVvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTYyNzk2NzgsImV4cCI6MjA3MTg1NTY3OH0.jGC5dj4If78IC2009HHZgoDveZteTSXcjM78pjeV48g' ,
    url: 'https://mofzuerjfqjcqbbezleo.supabase.co',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel App',
      debugShowCheckedModeBanner: false,
      home: Page1(),
    );
  }
}

