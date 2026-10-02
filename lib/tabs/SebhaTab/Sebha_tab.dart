import 'package:flutter/material.dart';
import 'package:islami/app_theme/app_colors.dart';
import 'package:islami/gen/assets.gen.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
    List<String> tasbeehs = ['سبحان الله', 'الحمد لله', 'الله أكبر'];
     double turns = 0;
  @override
  Widget build(BuildContext context) {
    
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(Assets.lib.assets.images.sebhabg.path, fit: BoxFit.cover),
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.black_color.withValues(alpha: 0.7),
                AppColors.black_color,
              ],
            ),
          ),
        ),
        SafeArea(
          child: Column(
            children: [
              Image.asset(
                Assets.lib.assets.images.islamiHeader.path,
                height: 141,
                width: 299,
              ),
              SizedBox(height: 40),
              Text(
                'سَبِّحِ اسْمَ رَبِّكَ الأعلى ',
                style: TextStyle(
                  fontSize: 36,
                  color: AppColors.gold_color,
                  fontWeight: FontWeight.bold,
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    counter++;
                    turns += 0.03;
                  });
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    AnimatedRotation(
                      turns: turns,
                      duration: Duration(milliseconds: 200),
                      curve: Curves.easeInOut,
                      child: Image.asset(Assets.lib.assets.images.sebha.path),
                    ),
                   // Image.asset(Assets.lib.assets.images.sebha.path),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          tasbeehs[counter % tasbeehs.length],
                          style: TextStyle(
                            fontSize: 24,
                            color: AppColors.gold_color,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          '$counter',
                          style: TextStyle(
                            fontSize: 36,
                            color: AppColors.gold_color,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}