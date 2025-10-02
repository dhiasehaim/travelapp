import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:travelapp/Loginpages/Login.dart';
import 'package:travelapp/Pages/mainpage.dart';

class Authgate extends StatefulWidget {
  const Authgate({super.key});

  @override
  State<Authgate> createState() => _AuthgateState();
}

class _AuthgateState extends State<Authgate> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AuthState>(
      stream:Supabase.instance.client.auth.onAuthStateChange, 
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else {
          final session = snapshot.hasData ? snapshot.data!.session : null;
          if (session == null) {
            return const Login();
          } else {
            return const Mainpage();
          }
        }
      },
      );
  }
}