import 'package:flutter/material.dart';
import 'package:islami/app_theme/app_colors.dart';
import 'package:islami/gen/assets.gen.dart';
import 'package:islami/tabs/HadeethTab/Hadeeth_tab.dart';
import 'package:islami/tabs/QuranTab/Quran_tab.dart';
import 'package:islami/tabs/RadioTaab/Radio_tab.dart';
import 'package:islami/tabs/SebhaTab/Sebha_tab.dart';
import 'package:islami/tabs/TimesTab/Times_tab.dart';
import 'package:svg_flutter/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> tabs = [
    QuranTab(),
    HadeethTab(),
    SebhaTab(),
    RadioTab(),
    TimesTab(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          currentIndex = value;
          setState(() {});
        },
        currentIndex: currentIndex,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        unselectedItemColor: Colors.black87,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.gold_color,
        selectedItemColor: AppColors.white_color,
        items: [
          _buildBottomNavItem(
            icon: (Assets.lib.assets.images.icQuran),
            label: 'Quran',
          ),
          _buildBottomNavItem(
            icon: (Assets.lib.assets.images.icHadeth),
            label: 'Hadeth',
          ),
          _buildBottomNavItem(
            icon: (Assets.lib.assets.images.icSebha),
            label: 'Sebha',
          ),
          _buildBottomNavItem(
            icon: (Assets.lib.assets.images.icRadio),
            label: 'Radio',
          ),
          _buildBottomNavItem(
            icon: (Assets.lib.assets.images.icTime),
            label: 'Prayer times',
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavItem({
    required String icon,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        icon,
        colorFilter: ColorFilter.mode(AppColors.black_color, BlendMode.srcIn),
        width: 26,
        height: 26,
      ),
      activeIcon: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        decoration: BoxDecoration(
          color: AppColors.black_color.withValues(alpha: 0.6),
          borderRadius: BorderRadius.circular(66),
        ), // BoxDecoration
        child: SvgPicture.asset(
          icon,
          width: 20,
          height: 20,
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
      ), // Container
      label: label,
    ); // BottomNavigationBarItem
  }
}
