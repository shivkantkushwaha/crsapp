import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../models/crop_prediction_model.dart';

class CropResultScreen extends StatelessWidget {
  final CropPredictionResult? result;

  const CropResultScreen({
    super.key,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    // ❌ If prediction failed or backend error
    if (result == null) {
      return _errorScreen(context);
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text("Recommendation Result"),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.textDark,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            /// RECOMMENDED CROP
            _resultCard(
              title: "Recommended Crop",
              value: result!.recommendedCrop,
              emoji: "🌱",
            ),

            const SizedBox(height: 16),

            /// CONFIDENCE
            _resultCard(
              title: "Confidence",
              value:
              "${(result!.confidence * 100).toStringAsFixed(1)}%",
              emoji: "📊",
            ),

            const SizedBox(height: 16),

            /// ALTERNATIVES
            _resultCard(
              title: "Top Alternatives",
              value: result!.alternatives.join(", "),
              emoji: "🔁",
            ),

            const SizedBox(height: 24),

            /// ADVISORY
            Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "🌾 Crop Advisory",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 14),

                    Text(
                      "• Fertilizer: ${result!.advisory.fertilizer}",
                      style: const TextStyle(fontSize: 15),
                    ),
                    const SizedBox(height: 6),

                    Text(
                      "• Irrigation: ${result!.advisory.irrigation}",
                      style: const TextStyle(fontSize: 15),
                    ),
                    const SizedBox(height: 6),

                    Text(
                      "• Sowing Season: ${result!.advisory.sowingSeason}",
                      style: const TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// RESULT CARD
  Widget _resultCard({
    required String title,
    required String value,
    required String emoji,
  }) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        leading: Text(
          emoji,
          style: const TextStyle(fontSize: 26),
        ),
        title: Text(title),
        subtitle: Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  /// ❌ ERROR UI (Backend / Network Issue)
  Widget _errorScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text("Prediction Failed"),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.textDark,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.warning_amber_rounded,
                size: 64,
                color: Colors.orange,
              ),
              SizedBox(height: 16),
              Text(
                "We are facing technical issues",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                "Unable to generate crop recommendation right now.\nPlease try again after some time.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
