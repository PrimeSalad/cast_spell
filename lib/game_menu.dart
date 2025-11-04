import 'package:flutter/material.dart';

class GameMenuScreen extends StatelessWidget {
  const GameMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          /// 🖼️ Background
          Positioned.fill(
            child: Image.asset(
              'assets/images/bg2.png',
              fit: BoxFit.cover,
            ),
          ),

          /// 📋 Main content
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    /// 🧠 Logo
                    Image.asset(
                      'assets/images/logo2.png',
                      width: size.width * 0.8,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 40),

                    /// 🐾 Animals button
                    _categoryButton(
                      imagePath: 'assets/images/category_animals.png',
                      onTap: () {
                        Navigator.pushNamed(context, '/animal_game');
                      },
                    ),
                    const SizedBox(height: 20),

                    /// 🍎 Fruits button
                    _categoryButton(
                      imagePath: 'assets/images/category_fruits.png',
                      onTap: () {
                        Navigator.pushNamed(context, '/fruits_game');
                      },
                    ),
                    const SizedBox(height: 20),

                    /// 🪑 Things button
                    _categoryButton(
                      imagePath: 'assets/images/category_things.png',
                      onTap: () {
                        Navigator.pushNamed(context, '/things_game');
                      },
                    ),
                    const SizedBox(height: 20),

                    /// 🎲 Mixed button
                    _categoryButton(
                      imagePath: 'assets/images/category_mixed.png',
                      onTap: () {
                        Navigator.pushNamed(context, '/mixed_game');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),

          /// 🔙 Back Button (Top-left)
          Positioned(
            top: 70,
            left: 30,
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
                size: 40,
              ),
              // ✅ Go back to main.dart (home screen)
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/', // 👈 main.dart home route
                  (route) => false,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  /// 🪵 Custom Button Widget
  Widget _categoryButton({
    required String imagePath,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(
        imagePath,
        width: 250,
        fit: BoxFit.contain,
        errorBuilder: (_, __, ___) =>
            const Icon(Icons.error_outline, size: 40, color: Colors.red),
      ),
    );
  }
}
