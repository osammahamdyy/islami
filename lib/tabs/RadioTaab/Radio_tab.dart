import 'package:flutter/material.dart';
import 'package:islami/app_theme/app_colors.dart';
import 'package:islami/gen/assets.gen.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  int selectedTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(Assets.lib.assets.images.radioBg.path, fit: BoxFit.cover),
        SafeArea(
          child: Column(
            children: [
              Image.asset(
                Assets.lib.assets.images.islamiHeader.path,
                height: 141,
                width: 299,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => setState(() => selectedTabIndex = 0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 14,
                      ),
                      decoration: BoxDecoration(
                        color: selectedTabIndex == 0
                            ? AppColors.gold_color
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        'Radio',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: selectedTabIndex == 0
                              ? AppColors.black_color
                              : AppColors.white_color,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  GestureDetector(
                    onTap: () => setState(() => selectedTabIndex = 1),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 14,
                      ),
                      decoration: BoxDecoration(
                        color: selectedTabIndex == 1
                            ? AppColors.gold_color
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        'Reciters',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: selectedTabIndex == 1
                              ? AppColors.black_color
                              : AppColors.white_color,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child: selectedTabIndex == 0
                    ? ListView.builder(
                        itemCount: 10,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) => SizedBox(
                          height: 150,
                          width: double.infinity,
                          child: Card(
                            color: AppColors.gold_color,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20.0,
                                vertical: 0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Radio Station ${index + 1}',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.black_color,
                                    ),
                                  ),

                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Image.asset(
                                        Assets.lib.assets.images.mosque021.path,
                                        fit: BoxFit.contain,
                                      ),

                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.play_arrow,
                                            size: 32,
                                            color: AppColors.black_color,
                                          ),
                                          Icon(
                                            Icons.volume_up,
                                            size: 32,
                                            color: AppColors.black_color,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    : ListView.builder(
                        itemCount: 10,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) => SizedBox(
                          height: 150,
                          width: double.infinity,
                          child: Card(
                            color: AppColors.gold_color,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20.0,
                                vertical: 0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Reciter Name ${index + 1}',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.black_color,
                                    ),
                                  ),

                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Image.asset(
                                        Assets.lib.assets.images.mosque021.path,
                                        fit: BoxFit.contain,
                                      ),

                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.play_arrow,
                                            size: 32,
                                            color: AppColors.black_color,
                                          ),
                                          Icon(
                                            Icons.volume_up,
                                            size: 32,
                                            color: AppColors.black_color,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
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
