import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class ParameterSlider extends StatelessWidget {
  final String label;
  final double value;
  final double max;
  final String unit;
  final ValueChanged<double> onChanged;

  const ParameterSlider({
    super.key,
    required this.label,
    required this.value,
    required this.max,
    required this.unit,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shadowColor: Colors.black12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  value.toStringAsFixed(1),
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 4),
                Text(unit, style: const TextStyle(color: Colors.grey)),
              ],
            ),
            Slider(
              value: value,
              max: max,
              activeColor: AppColors.primary,
              onChanged: onChanged,
            ),
          ],
        ),
      ),
    );
  }
}
