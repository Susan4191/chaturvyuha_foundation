import 'package:chaturvyuha_foundation/Screens/about_screen.dart';
import 'package:chaturvyuha_foundation/Screens/contact_us_screen.dart';
import 'package:chaturvyuha_foundation/Screens/dharma_sanskriti_screen.dart';
import 'package:chaturvyuha_foundation/Screens/education_screen.dart';
import 'package:chaturvyuha_foundation/Screens/gallery_screen.dart';
import 'package:chaturvyuha_foundation/Screens/home_screen.dart';
import 'package:chaturvyuha_foundation/Screens/yoga_meditation_screen.dart';
import 'package:chaturvyuha_foundation/utils/app_colors.dart';
import 'package:chaturvyuha_foundation/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'become_member_scree.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;
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

    final Widget logo = ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.asset(
        "assets/chaturvedal-1.png",
        height: 60,
        errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: AppColors.backgroundColor,
        title: Padding(padding: const EdgeInsets.only(left: 8.0), child: logo),
        actions: !isSmallScreen
            ? [
                TextButton(
                  onPressed: () => setState(() => _selectedIndex = 0),
                  style: TextButton.styleFrom(
                    foregroundColor: _selectedIndex == 0
                        ? AppColors.primary
                        : AppColors.black,
                  ),
                  child: Text(
                    'Home',
                    style: _selectedIndex == 0
                        ? AppTextStyles.navButtonActive
                        : AppTextStyles.navButton,
                  ),
                ),
                const SizedBox(width: 10),
                TextButton(
                  onPressed: () => setState(() => _selectedIndex = 1),
                  style: TextButton.styleFrom(
                    foregroundColor: _selectedIndex == 1
                        ? AppColors.primary
                        : AppColors.black,
                  ),
                  child: Text(
                    'About',
                    style: _selectedIndex == 1
                        ? AppTextStyles.navButtonActive
                        : AppTextStyles.navButton,
                  ),
                ),
                const SizedBox(width: 10),
                TextButton(
                  onPressed: () => setState(() => _selectedIndex = 2),
                  style: TextButton.styleFrom(
                    foregroundColor: _selectedIndex == 2
                        ? AppColors.primary
                        : AppColors.black,
                  ),
                  child: Text(
                    'Dharma & Sanskriti',
                    style: _selectedIndex == 2
                        ? AppTextStyles.navButtonActive
                        : AppTextStyles.navButton,
                  ),
                ),
                const SizedBox(width: 10),
                TextButton(
                  onPressed: () => setState(() => _selectedIndex = 3),
                  style: TextButton.styleFrom(
                    foregroundColor: _selectedIndex == 3
                        ? AppColors.primary
                        : AppColors.black,
                  ),
                  child: Text(
                    'Yoga & Meditation',
                    style: _selectedIndex == 3
                        ? AppTextStyles.navButtonActive
                        : AppTextStyles.navButton,
                  ),
                ),
                const SizedBox(width: 10),
                TextButton(
                  onPressed: () => setState(() => _selectedIndex = 4),
                  style: TextButton.styleFrom(
                    foregroundColor: _selectedIndex == 4
                        ? AppColors.primary
                        : AppColors.black,
                  ),
                  child: Text(
                    'Education',
                    style: _selectedIndex == 4
                        ? AppTextStyles.navButtonActive
                        : AppTextStyles.navButton,
                  ),
                ),
                const SizedBox(width: 10),

                const SizedBox(width: 20),
                TextButton(
                  onPressed: () => setState(() => _selectedIndex = 6),
                  style: TextButton.styleFrom(
                    foregroundColor: _selectedIndex == 6
                        ? AppColors.primary
                        : AppColors.black,
                  ),
                  child: Text(
                    'Gallery',
                    style: _selectedIndex == 6
                        ? AppTextStyles.navButtonActive
                        : AppTextStyles.navButton,
                  ),
                ),
                const SizedBox(width: 10),
                TextButton(
                  onPressed: () => setState(() => _selectedIndex = 7),
                  style: TextButton.styleFrom(
                    foregroundColor: _selectedIndex == 7
                        ? AppColors.primary
                        : AppColors.black,
                  ),
                  child: Text(
                    'Contact Us',
                    style: _selectedIndex == 7
                        ? AppTextStyles.navButtonActive
                        : AppTextStyles.navButton,
                  ),
                ),
                const SizedBox(width: 10),

                const SizedBox(width: 16),
              ]
            : [
                Builder(
                  builder: (context) => IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () => Scaffold.of(context).openEndDrawer(),
                  ),
                ),
              ],
      ),
      endDrawer: isSmallScreen
          ? Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: const BoxDecoration(color: AppColors.primary),
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
                  ListTile(
                    title: const Text('Home'),
                    selected: _selectedIndex == 0,
                    selectedColor: AppColors.primary,
                    iconColor: AppColors.grey,
                    onTap: () {
                      setState(() => _selectedIndex = 0);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: const Text('About'),
                    selected: _selectedIndex == 1,
                    selectedColor: AppColors.primary,
                    iconColor: AppColors.black,
                    onTap: () {
                      setState(() => _selectedIndex = 1);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: const Text('Dharma & Sanskriti'),
                    selected: _selectedIndex == 2,
                    selectedColor: AppColors.primary,
                    iconColor: AppColors.black,
                    onTap: () {
                      setState(() => _selectedIndex = 2);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: const Text('Yoga & Meditation'),
                    selected: _selectedIndex == 3,
                    selectedColor: AppColors.primary,
                    iconColor: AppColors.black,
                    onTap: () {
                      setState(() => _selectedIndex = 3);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: const Text('Education'),
                    selected: _selectedIndex == 4,
                    selectedColor: AppColors.primary,
                    iconColor: AppColors.black,
                    onTap: () {
                      setState(() => _selectedIndex = 4);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: const Text('Become a Member'),
                    selected: _selectedIndex == 5,
                    selectedColor: AppColors.primary,
                    iconColor: AppColors.black,
                    onTap: () {
                      setState(() => _selectedIndex = 5);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: const Text('Gallery'),
                    selected: _selectedIndex == 6,
                    selectedColor: AppColors.primary,
                    iconColor: AppColors.black,
                    onTap: () {
                      setState(() => _selectedIndex = 6);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: const Text('Contact Us'),
                    selected: _selectedIndex == 7,
                    selectedColor: AppColors.primary,
                    iconColor: AppColors.black,
                    onTap: () {
                      setState(() => _selectedIndex = 7);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: const Text('Become A Member'),
                    selected: _selectedIndex == 8,
                    selectedColor: AppColors.primary,
                    iconColor: AppColors.black,
                    onTap: () {
                      setState(() => _selectedIndex = 8);
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            )
          : null,
      body: _pages[_selectedIndex],
    );
  }
}
