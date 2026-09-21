import 'package:chaturvyuha_foundation/utils/app_colors.dart';
import 'package:chaturvyuha_foundation/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import '../Home/home_screen.dart';
import '../about_screen.dart';
import '../become_member_scree.dart';
import '../contact_us_screen.dart';
import '../dharma_sanskriti_screen.dart';
import '../education_screen.dart';
import '../gallery_screen.dart';
import '../yoga_meditation_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  final List<String> _navigation = [
    "Home",
    "About",
    "Dharma & Sanskriti",
    "Yoga & Meditation",
    "Education",
    "Gallery",
    "Contact Us",
    "Become a Member",
  ];
  final List<Widget> _pages = [
    const HomeScreen(),
    const AboutScreen(),
    const DharmaSanskritiScreen(),
    const YogaMeditationScreen(),
    const EducationScreen(),
    const GalleryScreen(),
    const ContactUsScreen(),
    const BecomeMemberScree(),
  ];

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 1100;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backgroundColor,
        centerTitle: false,

        toolbarHeight: 80,

        titleSpacing: isSmallScreen ? 15 : 50,
        title: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            "assets/chaturvedal-1.png",
            height: 60,
            errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.error),
          ),
        ),

        actions: !isSmallScreen
            ? [
                ...List.generate(
                  _navigation.length,
                  (index) => menuButton(index: index, text: _navigation[index]),
                ),

                // Right-side space
                const SizedBox(width: 50),
              ]
            : [
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Builder(
                    builder: (context) => IconButton(
                      tooltip: 'Open menu',
                      icon: const Icon(Icons.menu),
                      onPressed: () => Scaffold.of(context).openEndDrawer(),
                    ),
                  ),
                ),
              ],
      ),

      //sideNavigation
      endDrawer: isSmallScreen
          ? Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: const BoxDecoration(color: AppColor.primary),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.center,

                          //sideTopImage
                          child: Image.asset("assets/chaturvedal-1.png"),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                            icon: const Icon(Icons.close, color: Colors.white),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //sideNavigation
                  ...List.generate(
                    _navigation.length,
                    ((index) => sideListTile(
                      context,
                      text: _navigation[index],
                      index: index,
                    )),
                  ),
                ],
              ),
            )
          : null,
      body: _pages[_selectedIndex],
    );
  }

  //NavigationMenu
  TextButton menuButton({required int index, required String text}) {
    final bool isSelected = _selectedIndex == index;

    return TextButton(
      onPressed: () => setState(() => _selectedIndex = index),
      style: TextButton.styleFrom(
        foregroundColor: isSelected ? AppColor.primary : AppColor.black,
      ),
      child: Text(
        text,
        style: isSelected
            ? AppTextStyles.navButtonActive
            : AppTextStyles.navButton,
      ),
    );
  }

  //sideNavigationMenu
  ListTile sideListTile(
    BuildContext context, {
    required String text,
    required int index,
  }) {
    return ListTile(
      title: Text(text),
      selected: _selectedIndex == index,
      selectedColor: AppColor.primary,
      iconColor: AppColor.grey,
      onTap: () {
        setState(() => _selectedIndex = index);
        Navigator.pop(context); // Close the drawer.
      },
    );
  }
}
