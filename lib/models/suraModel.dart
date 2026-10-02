import 'package:islami/data/suradet.dart';

class Suramodel {
  final String id;
 final String suraNameAR;
 final String suraNameEN;
 final int ayatCount;

 Suramodel({
   required this.suraNameAR,
   required this.suraNameEN,
   required this.ayatCount,
   required this.id,
 });

  static List<Suramodel> get allsuras{
    List<Suramodel> surasList = [];
    for(int i=0; i<suraDet.arabicAuranSuras.length; i++){
      surasList.add(Suramodel(
        id: (i+1).toString(),
        suraNameAR: suraDet.arabicAuranSuras[i],
        suraNameEN: suraDet.englishQuranSurahs[i],
        ayatCount: int.parse(suraDet.AyaNumber[i]),
      ));
    }
    return surasList;
  }
}