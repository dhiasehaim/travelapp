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

  Future GetTarvelInfoForJournal() async {
    final user = await _supabaseClient.auth.currentUser;
    if (user == null) {
      return;
    }
    final id = user.id;
    final TravelId = await _supabaseClient
        .from('userstravel')
        .select('cityname,travelid')
        .eq('user_id', id);
    List<Map<String, dynamic>> TravelCity = [];
    for (var travel in TravelId) {
      final pictures = await _supabaseClient
          .from('travelpictures')
          .select('image_url')
          .eq('travel_id', travel['travelid'])
          .limit(1);

      TravelCity.add({
        'cityname': travel['cityname'],
        'travelid': travel['travelid'],
        'image_url': pictures.isNotEmpty ? pictures[0]['image_url'] : null,
      });
    }
    return TravelCity;
  }

  Future<int> CountCountries() async {
    final user = await _supabaseClient.auth.currentUser;
    if (user == null) {
      return 0;
    }
    final id = user.id;
    final response = await _supabaseClient
        .from('userstravel')
        .select(
          'countryname',
        )
        .eq('user_id', id);
    return response.length;
  }

  Future<int> CountCities() async {
    final user = await _supabaseClient.auth.currentUser;
    if (user == null) {
      return 0;
    }
    final id = user.id;
    final response = await _supabaseClient
        .from('userstravel')
        .select(
          'cityname',
        )
        .eq('user_id', id);
    return response.length;
  }

  // ignore: non_constant_identifier_names
  Future GetTarvelInfo() async {
    final user = await _supabaseClient.auth.currentUser;
    if (user == null) {
      return;
    }
    final id = user.id;
    final TravelId = await _supabaseClient.from('userstravel').select();
    final userfullname = await GetFullName();
    List<Map<String, dynamic>> TravelCity = [];
    for (var travel in TravelId) {
      final pictures = await _supabaseClient
          .from('travelpictures')
          .select('image_url')
          .eq('travel_id', travel['travelid']);

      TravelCity.add({
        'personname': userfullname,
        'cityname': travel['cityname'],
        'travelid': travel['travelid'],
        'countryname': travel['countryname'],
        'user_description': travel['user_description'],
        'title': travel['title'],
        'image_url': pictures.isNotEmpty ? pictures[0]['image_url'] : null,
        'image_list':  pictures.map((pic) => pic['image_url']).toList(),
      });
    }
    return TravelCity;
  }
}
