import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/widgets/glass_card.dart';
import '../crop/screens/crop_input_screen.dart';


class HomeScreen extends StatefulWidget {
  final bool isGuest;
  const HomeScreen({super.key, this.isGuest = false});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.grey,
        onTap: (index) => setState(() => currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// HEADER
              Row(
                children: [
                  Image.asset(
                    'lib/core/assets/images/crs_logo.png',
                    height: 36,
                  ),
                  const Spacer(),
                  const Icon(Icons.notifications_none),
                ],
              ),

              const SizedBox(height: 24),

              /// WELCOME
              Text(
                widget.isGuest ? "Welcome, Guest 👋" : "Welcome back 👋",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                "How can CRS help you today?",
                style: TextStyle(color: AppColors.textLight),
              ),

              const SizedBox(height: 30),

              /// FEATURE CARDS
              Expanded(
                child: ListView(
                  children: [
                    FeatureCard(
                      title: "Smart Crop Recommendation",
                      subtitle:
                      "AI-based crop prediction with confidence & advisory",
                      icon: Icons.agriculture,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const CropInputScreen(),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 16),
                    FeatureCard(
                      title: "Kisan Saathi (AI Chatbot)",
                      subtitle:
                      "Ask farming questions in simple language",
                      icon: Icons.smart_toy,
                      onTap: () {},
                    ),
                    const SizedBox(height: 16),
                    FeatureCard(
                      title: "Soil Health (Coming Soon)",
                      subtitle:
                      "Understand soil condition & nutrient balance",
                      icon: Icons.science,
                      disabled: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// FEATURE CARD WIDGET
class FeatureCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback? onTap;
  final bool disabled;

  const FeatureCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.onTap,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: disabled ? 0.5 : 1,
      child: GestureDetector(
        onTap: disabled ? null : onTap,
        child: GlassCard(
          child: Row(
            children: [
              CircleAvatar(
                radius: 26,
                backgroundColor: AppColors.primary.withOpacity(0.15),
                child: Icon(icon, color: AppColors.primary),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text(subtitle,
                        style:
                        const TextStyle(color: AppColors.textLight)),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, size: 16),
            ],
          ),
        ),
      ),
    );
  }
}

