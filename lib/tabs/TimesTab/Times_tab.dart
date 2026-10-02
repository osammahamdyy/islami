import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami/app_theme/app_colors.dart';
import 'package:islami/gen/assets.gen.dart';

class TimesTab extends StatelessWidget {
  const TimesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(Assets.lib.assets.images.timesBg.path, fit: BoxFit.cover),
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.black_color.withValues(alpha: 0.5),
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
              Container(
                height: 300,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 1, vertical: 20),
                padding: EdgeInsets.all(0),
                decoration: BoxDecoration(
                  color: AppColors.brown_color,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      Assets.lib.assets.images.group35.path,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      child: Text(
                        'Date1',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white_color,
                        ),
                      ),
                      left: 20,
                      top: 20,
                    ),
                    Positioned(
                      child: Text(
                        'Date2',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white_color,
                        ),
                      ),
                      right: 20,
                      top: 20,
                    ),
                    Positioned(
                      child: Text(
                        'Prayer Times \n Day name',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black_color,
                        ),
                      ),
                      left: 140,
                      right: 60,
                    ),
                    LayoutBuilder(
                      builder: (context, BoxConstraints constrains) {
                        return CarouselSlider.builder(
                          itemCount: 5,
                          options: CarouselOptions(
                            height: 160,

                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 5),
                            aspectRatio: 0.2,
                            enlargeCenterPage: true,
                            viewportFraction: 170 / 430,
                          ),
                          itemBuilder: (context, index, realIndex) => Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            color: AppColors.black_color.withValues(alpha: .5),
                            child: Column(
                              children: [
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 15,
                                      horizontal: 20,
                                    ),
                                    child: Column(
                                      children: [
                                        Text(
                                          'Prayer',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: AppColors.white_color,
                                          ),
                                        ),
                                        Text(
                                          '00:00',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 32,
                                            color: AppColors.white_color,
                                          ),
                                        ),

                                        Text(
                                          'AM/PM',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.white_color,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    Positioned(
                      bottom: 35,
                      left: 135,
                      child: Row(
                        children: [
                          Text(
                            'Next Prayer - 00:00',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(width: 60),
                          Icon(Icons.volume_mute_outlined, size: 40),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'Azkar',
                style: TextStyle(fontSize: 16, color: AppColors.white_color),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    spacing: 10,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.black_color,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: AppColors.gold_color,
                            width: 2,
                          ),
                        ),
                  
                        child: Column(
                          children: [
                            Image.asset(Assets.lib.assets.images.azkar2.path),
                            Text(
                              'Morning Azkar',
                              style: TextStyle(
                              
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppColors.white_color,
                              ),
                            ),
                          ],
                        ),
                      ),
                 
                       Container(
                        decoration: BoxDecoration(
                          color: AppColors.black_color,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: AppColors.gold_color,
                            width: 2,
                          ),
                        ),
                  
                        child: Column(
                          children: [
                            Image.asset(Assets.lib.assets.images.azkar1.path),
                            Text(
                              'Evening Azkar',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppColors.white_color,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
