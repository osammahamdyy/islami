import 'package:flutter/material.dart';
import 'package:islami/app_theme/app_colors.dart';
import 'package:islami/gen/assets.gen.dart';
import 'package:islami/models/suraModel.dart';
import 'package:islami/tabs/QuranTab/suraTab.dart';
import 'package:svg_flutter/svg.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  String searchQuery = '';
  List<int> mostRecentSuras = []; 
   


  @override
  Widget build(BuildContext context) {
    List<Suramodel> filteredSuras = Suramodel.allsuras
        .where(
          (sura) =>
              sura.suraNameEN.toLowerCase().contains(
                searchQuery.toLowerCase(),
              ) ||
              sura.suraNameAR.contains(searchQuery),
        )
        .toList();

    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(Assets.lib.assets.images.quranbg.path, fit: BoxFit.cover),
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
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              // <-- SingleChildScrollView removed, Column goes straight here
              children: [
                Image.asset(
                  Assets.lib.assets.images.islamiHeader.path,
                  width: 299,
                  height: 141,
                ),
                SizedBox(height: 20),
                TextField(
                  style: TextStyle(color: AppColors.white_color),
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value;
                    });
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.black_color.withValues(alpha: .5),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.gold_color),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.gold_color),
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(14),
                      child: SvgPicture.asset(
                        Assets.lib.assets.images.icQuran,
                        color: AppColors.gold_color,
                      ),
                    ),
                    hintText: "Sura name",
                    hintStyle: TextStyle(color: AppColors.white_color),
                  ),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Most Recently',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white_color,
                    ),
                  ),
                ),
                SizedBox(height: 10),
               
                SizedBox(

                  height: 150,
                  child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Card(
                      color: AppColors.gold_color,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 12,
                        ),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 8,
                              children: [
                                Text(
                                  'data',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.black_color,
                                  ),
                                ),
                                Text(
                                  'data2',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.black_color,
                                  ),
                                ),
                                Text(
                                  'data3',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.black_color,
                                  ),
                                ),
                              ],
                            ),
                            Image.asset(
                              Assets.lib.assets.images.imgMostRecent.path,
                              height: 135,
                              width: 153,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Suras List',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white_color,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    itemCount: filteredSuras.length,
                    separatorBuilder: (context, index) => Divider(
                      color: AppColors.white_color.withValues(alpha: 0.2),
                      endIndent: 44,
                      indent: 44,
                      height: 1,
                    ),
                    itemBuilder: (context, index) =>
                        drawSura(context, index, filteredSuras[index]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget drawSura(BuildContext context, int index, Suramodel suraModel) {
    return ListTile(
      onTap: () { 
        setState(() {
          addMostRecentSura(index);
        });
     
        Navigator.of(context).pushNamed(Sura.routeName, arguments: suraModel);
      },
      minVerticalPadding: 0,
      contentPadding: EdgeInsets.all(0),
      leading: Stack(
        alignment: AlignmentGeometry.center,
        children: [
          SvgPicture.asset(Assets.lib.assets.images.suraNum),
          Text(
            (index + 1).toString(),
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: AppColors.white_color,
            ),
          ),
        ],
      ),
      title: Text(
        suraModel.suraNameEN,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: AppColors.white_color,
        ),
      ),
      subtitle: Text(
        suraModel.ayatCount.toString(),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
          color: AppColors.white_color,
        ),
      ),
      trailing: Text(
        suraModel.suraNameAR,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: AppColors.white_color,
        ),
      ),
    );
  }
  void addMostRecentSura(int suraIndex) {
   if (mostRecentSuras.contains(suraIndex)) {
      mostRecentSuras.remove(suraIndex);
      mostRecentSuras.insert(0, suraIndex);
    }
    else {
      mostRecentSuras.insert(0, suraIndex);
      if (mostRecentSuras.length > 5) {
        mostRecentSuras.removeLast();
      }
    }
    setState(() {});
  }
}
