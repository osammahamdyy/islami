import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/app_theme/app_colors.dart';
import 'package:islami/gen/assets.gen.dart';
import 'package:islami/models/hadeethModel.dart';

class HadeethTab extends StatefulWidget {
  const HadeethTab({super.key});

  @override
  State<HadeethTab> createState() => _HadeethTabState();
}

class _HadeethTabState extends State<HadeethTab> {
  final List<Hadeethmodel> hadeeths = [];
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    if (hadeeths.isEmpty) {
      loadHadeeth();
    }
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(Assets.lib.assets.images.hadeethbg.path, fit: BoxFit.cover),
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
              SizedBox(height: 55),
              if (isLoading)
                CircularProgressIndicator(color: AppColors.gold_color)
              else
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, BoxConstraints constrains) {
                      return CarouselSlider.builder(
                        itemCount: hadeeths.length,
                        options: CarouselOptions(
                          height: constrains.maxHeight,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 5),
                          aspectRatio: 0.2,
                          enlargeCenterPage: true,
                          viewportFraction: 300 / 430,
                        ),
                        itemBuilder: (context, index, realIndex) => Card(
                          shape: RoundedRectangleBorder(
                           
                            borderRadius: BorderRadius.circular(24),
                          ),
                          color: AppColors.gold_color,
                          child: Stack(
                            children: [
                              Image.asset(
                                Assets.lib.assets.images.hadeethcardbg.path,
                                fit: BoxFit.cover,
                              ),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 40,
                                    horizontal: 20,
                                  ),
                                  child: Column(
                                    children: [
                                      Text(
                                        hadeeths[index].title,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24,
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      Expanded(
                                        child: SingleChildScrollView(
                                          child: Text(
                                            textAlign: TextAlign.center,
                                            textDirection: TextDirection.rtl,
                                            hadeeths[index].content,
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
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
                ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> loadHadeeth() async {
    for (int i = 1; i <= 50; i++) {
      try {
        String content = await rootBundle.loadString(
          'lib/assets/ahadeeth/h$i.txt',
        );
        content = content.trim();
        List<String> lines = content.split('\n');
        hadeeths.add(
          Hadeethmodel(title: lines[0], content: lines.sublist(1).join('\n')),
        );
      } catch (e) {
        debugPrint('FAILED on h$i.txt: $e');
      }
    }
    setState(() {
      isLoading = false;
    });
  }
}
