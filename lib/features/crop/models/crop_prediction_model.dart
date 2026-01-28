class CropPredictionResult {
  final String recommendedCrop;
  final double confidence;
  final String suitability;
  final List<String> alternatives;
  final CropAdvisory advisory;

  CropPredictionResult({
    required this.recommendedCrop,
    required this.confidence,
    required this.suitability,
    required this.alternatives,
    required this.advisory,
  });

  factory CropPredictionResult.fromJson(Map<String, dynamic> json) {
    return CropPredictionResult(
      recommendedCrop: json["recommended_crop"],
      confidence: json["confidence"].toDouble(),
      suitability: json["suitability"],
      alternatives: List<String>.from(json["top_alternatives"]),
      advisory: CropAdvisory.fromJson(json["advisory"]),
    );
  }
}

class CropAdvisory {
  final String fertilizer;
  final String irrigation;
  final String sowingSeason;

  CropAdvisory({
    required this.fertilizer,
    required this.irrigation,
    required this.sowingSeason,
  });

  factory CropAdvisory.fromJson(Map<String, dynamic> json) {
    return CropAdvisory(
      fertilizer: json["fertilizer"],
      irrigation: json["irrigation"],
      sowingSeason: json["sowing_season"],
    );
  }
}
