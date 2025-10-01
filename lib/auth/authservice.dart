import 'package:supabase_flutter/supabase_flutter.dart';

class Authservice {
  final SupabaseClient _supabaseClient=Supabase.instance.client;

  Future<AuthResponse> signInWithPassword(String email,String password) async{
    final response = await _supabaseClient.auth.signInWithPassword(
      email: email,
      password: password,
    );
    return response;
  }

  Future<AuthResponse> signUpWithPassword(String FullName,String email,String password) async{
    final response = await _supabaseClient.auth.signUp(
      email: email,
      password: password,
    );
    final user=response.user;
    if(user!=null){
      await _supabaseClient.from('users').insert({
        'id':user.id,
        'fullname':FullName,
        'email':email,
        'password':password,
      });
    }
    return response;
  }
  Future GetFullName()async{
    final user=await _supabaseClient.auth.currentUser;
    if (user !=null) {
      final id=user.id;
      final response=await _supabaseClient.from('users').select('fullname').eq('id', id).single();
      return response['fullname'];
    }
  }
  Future<void> signOut() async{
    await _supabaseClient.auth.signOut();
  }
}