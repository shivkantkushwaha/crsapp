import 'dart:convert';
import 'package:http/http.dart' as http;
import '../features/crop/models/crop_prediction_model.dart';

class ApiService {
  // 🔴 CHANGE THIS IF IP CHANGES
  static const String baseUrl = "http://10.12.141.189:8000";


  static Future<CropPredictionResult> predictCrop({
    required double nitrogen,
    required double phosphorus,
    required double potassium,
    required double temperature,
    required double humidity,
    required double rainfall,
    required double ph,
  }) async {
    final url = Uri.parse("$baseUrl/predict");

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "nitrogen": nitrogen,
        "phosphorus": phosphorus,
        "potassium": potassium,
        "temperature": temperature,
        "humidity": humidity,
        "rainfall": rainfall,
        "ph": ph,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return CropPredictionResult.fromJson(data);
    } else {
      throw Exception("Failed to get prediction");
    }
  }
}
