import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../widgets/parameter_slider.dart';
import 'crop_result_screen.dart';
//for backend server connection
import '../../../services/api_service.dart';
import '../models/crop_prediction_model.dart';


class CropInputScreen extends StatefulWidget {
  const CropInputScreen({super.key});

  @override
  State<CropInputScreen> createState() => _CropInputScreenState();
}

class _CropInputScreenState extends State<CropInputScreen> {
  double nitrogen = 90;
  double phosphorus = 42;
  double potassium = 43;
  double rainfall = 200;
  double temperature = 25;
  double ph = 6.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text("Smart Crop Recommendation"),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.textDark,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _sectionTitle("Soil Nutrients"),
          ParameterSlider(
            label: "Nitrogen (N)",
            value: nitrogen,
            max: 140,
            unit: "kg/ha",
            onChanged: (v) => setState(() => nitrogen = v),
          ),
          ParameterSlider(
            label: "Phosphorus (P)",
            value: phosphorus,
            max: 145,
            unit: "kg/ha",
            onChanged: (v) => setState(() => phosphorus = v),
          ),
          ParameterSlider(
            label: "Potassium (K)",
            value: potassium,
            max: 205,
            unit: "kg/ha",
            onChanged: (v) => setState(() => potassium = v),
          ),

          const SizedBox(height: 24),
          _sectionTitle("Climate Conditions"),

          ParameterSlider(
            label: "Rainfall",
            value: rainfall,
            max: 300,
            unit: "mm",
            onChanged: (v) => setState(() => rainfall = v),
          ),
          ParameterSlider(
            label: "Temperature",
            value: temperature,
            max: 45,
            unit: "°C",
            onChanged: (v) => setState(() => temperature = v),
          ),
          ParameterSlider(
            label: "Soil pH",
            value: ph,
            max: 14,
            unit: "",
            onChanged: (v) => setState(() => ph = v),
          ),

          const SizedBox(height: 80),
        ],
      ),

      /// ANALYZE BUTTON
      floatingActionButton: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
            ),

            //Repaced onPressed with ✅ NEW (REAL BACKEND CALL)
            // onPressed: () {
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (_) => const CropResultScreen(),
            //     ),
            //   );
            // },
            onPressed: () async {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) => const Center(child: CircularProgressIndicator()),
              );

              try {
                final result = await ApiService.predictCrop(
                  nitrogen: nitrogen,
                  phosphorus: phosphorus,
                  potassium: potassium,
                  temperature: temperature,
                  humidity: 70, // temporary fixed
                  rainfall: rainfall,
                  ph: ph,
                );

                Navigator.pop(context); // close loader

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CropResultScreen(result: result),
                  ),
                );
              } catch (e) {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Prediction failed")),
                );
              }
            },

            child: const Text(
              "Analyze Crop",
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
