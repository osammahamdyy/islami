import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/app_theme/app_colors.dart';
import 'package:islami/gen/assets.gen.dart';
import 'package:islami/models/suraModel.dart';

class Sura extends StatefulWidget {
  const Sura({super.key});
  static const String routeName = '/suradetails';
  @override
  State<Sura> createState() => _SuraState();
}

class _SuraState extends State<Sura> {
  List<String> suraContent = [];
  @override
  Widget build(BuildContext context,) {
    Suramodel suraModel = ModalRoute.of(context)!.settings.arguments as Suramodel;
    if (suraContent.isEmpty) {
      loadSuraContent(suraModel.id);
    }
    return Scaffold(
      appBar: AppBar(title: Text(suraModel.suraNameEN)),
      body: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.lib.assets.images.surabg.path),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 50,
          children: [
            Center(
              child: Text(
                suraModel.suraNameAR,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: AppColors.gold_color,
                ),
              ),
            ),
           Expanded(
  child: ListView(
    children: [
      Text.rich(
        TextSpan(
          children: List.generate(suraContent.length, (index) {
            return TextSpan(
              children: [
                TextSpan(
                  text: suraContent[index],
                  style: TextStyle(
                    fontSize: 24,
                    color: AppColors.gold_color,
                    height: 1.5,
                  ),
                ),
                TextSpan(
                  text: ' (${index + 1}) ',
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.gold_color,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            );
          }),
        ),
        textAlign: TextAlign.justify,
        textDirection: TextDirection.rtl,
      ),
    ],
  ),
),
          ],
        ),
      ),
    );
  }

  Future<void> loadSuraContent(String id) async {
    String content = await rootBundle.loadString('lib/assets/suras/$id.txt');
     suraContent = content.trim().split('\n');
     log('content: $content');
    setState(() {
     
    });
  }
}
