import 'package:chaturvyuha_foundation/utils/app_colors.dart';
import 'package:chaturvyuha_foundation/utils/app_text_styles.dart';
import 'package:chaturvyuha_foundation/utils/app_constants.dart';
import 'package:flutter/material.dart';

// Import all functional screens
import '../About/about_screen.dart';
import '../BecomeMember/become_member_screen.dart';
import '../ContactUs/contact_us_screen.dart';
import '../Home/home_screen.dart';
import '../dharma_sanskriti_screen/dharma_sanskriti_screen.dart';
import '../Education/education_screen.dart';
import '../Media/media_screen.dart';
import '../YogaAndMeditation/yoga_meditation_screen.dart';
import '../Events/events_screen.dart';
import '../Knowledge/knowledge_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;
  late List<Widget> _pages;

  final List<String> _navigation = AppConstants.navigationItems;

  @override
  void initState() {
    super.initState();
    _pages = [
      HomeScreen(
        onTabSelected: (index) => setState(() => _selectedIndex = index),
      ),
      const AboutScreen(),
      const DharmaSanskritiScreen(),
      const YogaMeditationScreen(),
      const EducationScreen(),
      const EventsScreen(),
      const KnowledgeScreen(),
      const MediaScreen(),
      const ContactUsScreen(),
      const BecomeMemberScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    // Breakpoint for smaller laptop/tablet screens
    final bool isSmallScreen = MediaQuery.of(context).size.width < 1200;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backgroundColor,
        scrolledUnderElevation: 0,
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

      // Side Navigation Drawer for Mobile/Tablet
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
      body: IndexedStack(index: _selectedIndex, children: _pages),
    );
  }

  // Header Navigation Menu Buttons
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

  // Drawer Menu List Items
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
        Navigator.pop(context);
      },
    );
  }
}
