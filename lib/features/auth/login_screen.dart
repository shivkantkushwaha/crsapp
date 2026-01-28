import 'package:flutter/material.dart';
import '../home/home_screen.dart';
import '../../core/constants/app_colors.dart';
import '../../core/widgets/primary_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),

              /// LOGO
              Center(
                child: Image.asset(
                  'lib/core/assets/images/crs_logo.png',
                  height: 90,
                ),
              ),

              const SizedBox(height: 30),

              /// TITLE
              const Text(
                "Welcome to CRS",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Smart agriculture powered by AI",
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textLight,
                ),
              ),

              const SizedBox(height: 40),

              /// EMAIL
              const Text("Email"),
              const SizedBox(height: 6),
              TextField(
                decoration: InputDecoration(
                  hintText: "example@email.com",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              /// PASSWORD
              const Text("Password"),
              const SizedBox(height: 6),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Enter password",
                  suffixIcon: const Icon(Icons.visibility_off),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(color: Colors.red.shade400),
                ),
              ),

              const SizedBox(height: 24),

              /// LOGIN BUTTON
              PrimaryButton(
                text: "Login",
                onTap: () {},
              ),

              const SizedBox(height: 14),

              /// GUEST BUTTON
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 52),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const HomeScreen(isGuest: true),
                    ),
                  );
                },
                child: const Text("Continue as Guest"),
              ),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
