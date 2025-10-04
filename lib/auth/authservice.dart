import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Authservice {
  final SupabaseClient _supabaseClient = Supabase.instance.client;

  Future<AuthResponse> signInWithPassword(String email, String password) async {
    final response = await _supabaseClient.auth.signInWithPassword(
      email: email,
      password: password,
    );
    return response;
  }

  Future<AuthResponse> signUpWithPassword(
      String FullName, String email, String password) async {
    final response = await _supabaseClient.auth.signUp(
      email: email,
      password: password,
    );
    final user = response.user;
    if (user != null) {
      await _supabaseClient.from('users').insert({
        'id': user.id,
        'fullname': FullName,
        'email': email,
        'password': password,
      });
    }
    return response;
  }

  Future GetFullName() async {
    final user = await _supabaseClient.auth.currentUser;
    if (user != null) {
      final id = user.id;
      final response = await _supabaseClient
          .from('users')
          .select('fullname')
          .eq('id', id)
          .single();
      return response['fullname'];
    }
  }

  Future<void> signOut() async {
    await _supabaseClient.auth.signOut();
  }

  Future InserTravelInfo(String CountryName, String CityName,
      String Description, String Title, List<XFile>? MultiIamge) async {
    final user = await _supabaseClient.auth.currentUser;
    if (user == null) {
      return;
    }
    final id = user.id;
    final insertedTrip = await _supabaseClient
        .from('userstravel')
        .insert({
          'user_id': id,
          'countryname': CountryName,
          'cityname': CityName,
          'user_description': Description,
          'title': Title,
        })
        .select('travelid')
        .single();

    final TravelId = insertedTrip['travelid'];

    for (final img in MultiIamge!) {
      final bytes = await img.readAsBytes();
      final fileName = img.name;
      final filePath = 'public/$id/$TravelId/$fileName';

      final storageResponse = await _supabaseClient.storage
          .from('TravePicture')
          .uploadBinary(filePath, bytes);

      if (storageResponse.isEmpty) {
        print('Upload failed for ${img.name}');
        continue;
      }
      final imageUrl =
          _supabaseClient.storage.from('TravePicture').getPublicUrl(filePath);

      await _supabaseClient.from('travelpictures').insert({
        'user_id': id,
        'travel_id': TravelId,
        'image_url': imageUrl,
      });
    }
  }

 Future GetTravelInfo() async {
  final user = _supabaseClient.auth.currentUser;

  if (user == null) {
    return null; // user not logged in
  }

  // Get the latest travelid for this user
  final travelResult = await _supabaseClient
      .from('userstravel')
      .select('travelid')
      .eq('user_id', user.id)
      .order('travelid', ascending: false)
      .limit(1);

  if (travelResult.isEmpty) {
    return []; // no travels yet
  }

  final travelId = travelResult.first['travelid'];

  // Now get pictures for that travel
  final response = await _supabaseClient
      .from('travelpictures')
      .select()
      .eq('user_id', user.id)
      .eq('travel_id', travelId)
      .limit(1);

  return response;
}

}
