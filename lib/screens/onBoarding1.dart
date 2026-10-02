import 'package:flutter/material.dart';
import 'package:islami/app_theme/app_colors.dart';
import 'package:islami/gen/assets.gen.dart';
import 'package:svg_flutter/svg.dart';

class OnBoarding1 extends StatelessWidget {
  const OnBoarding1({super.key});
  static const String routeName = '/OnBoarding1';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Image.asset(
                Assets.lib.assets.images.islamiHeader.path,
                width: 299,
                height: 141,
              ),
              const SizedBox(height: 40),
              SvgPicture.asset(
                Assets.lib.assets.images.b1,
                width: double.infinity,
                height: 400,
              ),
              const SizedBox(height: 40),
              const Text(
                'Welcome to Islami App',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.gold_color,
                ),
              ),
               SizedBox(height: 16),
              const SizedBox(width: 16),
                               
                               
               ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/OnBoarding2');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.gold_color,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
