
import 'dart:convert';

import 'package:api/models/World_State_Model.dart';
import 'package:http/http.dart' as http;

import 'Utilities/app_url.dart';

class StatesServices {

// ==========================================
// WORLD STATES API
// ==========================================

Future<WorldStateModel> fetchWorldStateRecords() async {
final response = await http.get(
Uri.parse(AppUrl.worldStatusApi),
);

if (response.statusCode == 200) {
final data = jsonDecode(response.body);

return WorldStateModel.fromJson(data);
} else {
throw Exception('Error Message');
}
}


// ==========================================
// COUNTRIES LIST API
// ==========================================

Future<List<dynamic>> countriesListApi() async {
final response = await http.get(
Uri.parse(AppUrl.countriesList),
);

if (response.statusCode == 200) {
final data = jsonDecode(response.body);

return data;
} else {
throw Exception('Error Message');
}
}
}
