import 'package:supabase_flutter/supabase_flutter.dart';

class ApiClient {
  static final ApiClient _apiClient = ApiClient._internal();

  factory ApiClient() {
    return _apiClient;
  }

  ApiClient._internal();

  Future<bool> signIn(String email, String password) async {
    final response = await Supabase.instance.client.auth
        .signIn(email: email, password: password);
    if (response.error != null) {
      /// Handle error
      return false;
    } else {
      /// Sign in with success
      return true;
    }
  }
}
