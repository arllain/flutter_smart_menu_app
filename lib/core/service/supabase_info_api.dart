import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:smart_menu_app/core/service/api_info.dart';

class SupabaseInfoAPI implements APIInfo {
  @override
  String get baseUrl => 'https://jsxjwrxzefciuvttbbly.supabase.co/rest/v1';

  @override
  Uri getUrl({
    required String url,
    Map<String, String>? extraParameters,
  }) {
    final queryParameters = <String, String>{};
    if (extraParameters != null) {
      queryParameters.addAll(extraParameters);
    }
    return Uri.parse('$baseUrl/$url').replace(
      queryParameters: queryParameters,
    );
  }

  @override
  Map<String, String> getHeaders() {
    final headerInfo = <String, String>{'apiKey': dotenv.get('API_KEY')};
    return headerInfo;
  }
}
