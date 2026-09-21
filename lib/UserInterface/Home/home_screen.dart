import 'package:flutter/material.dart';
import 'package:chaturvyuha_foundation/utils/app_colors.dart';

import '../../utils/app_text_styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const String _logoPath = 'assets/chaturvedal-1.png';

  // @override
  // void initState() {
  //   super.initState();
  //
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     if (!mounted) return;
  //
  //     _showWelcomePopup();
  //   });
  // }

  // void _showWelcomePopup() {
  //   showDialog<void>(
  //     context: context,
  //     barrierDismissible: true,
  //     builder: (dialogContext) {
  //       return AlertDialog(
  //         backgroundColor: AppColor.backgroundColor,
  //         surfaceTintColor: Colors.transparent,
  //         insetPadding: const EdgeInsets.all(20),
  //         scrollable: true,
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(24),
  //         ),
  //         titlePadding: const EdgeInsets.fromLTRB(16, 8, 8, 0),
  //         title: Align(
  //           alignment: Alignment.topRight,
  //           child: IconButton(
  //             tooltip: 'Close',
  //             onPressed: () {
  //               Navigator.of(dialogContext).pop();
  //             },
  //             icon: Icon(Icons.close, color: AppColor.grey),
  //           ),
  //         ),
  //         contentPadding: const EdgeInsets.fromLTRB(28, 0, 28, 28),
  //         content: SizedBox(
  //           width: 440,
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               Image.asset(_logoPath, height: 100, fit: BoxFit.contain),
  //               const SizedBox(height: 28),
  //               Text(
  //                 'WELCOME TO OUR COMMUNITY',
  //                 textAlign: TextAlign.center,
  //                 style: TextStyle(
  //                   color: AppColor.primary,
  //                   fontSize: 11,
  //                   fontWeight: FontWeight.w600,
  //                   letterSpacing: 2,
  //                   height: 1.5,
  //                 ),
  //               ),
  //               const SizedBox(height: 16),
  //               Text(
  //                 'Ancient Wisdom.\nA Meaningful Life.',
  //                 textAlign: TextAlign.center,
  //                 style: AppTextStyles.heading.copyWith(
  //                   color: AppColor.primary,
  //                   fontSize: 32,
  //                   fontWeight: FontWeight.bold,
  //                   height: 1.2,
  //                 ),
  //               ),
  //               const SizedBox(height: 20),
  //               Text(
  //                 'Explore Vedic learning, yoga and meditation, '
  //                 'and celebrate the traditions that bring us together.',
  //                 textAlign: TextAlign.center,
  //                 style: TextStyle(
  //                   color: AppColor.grey,
  //                   fontSize: 16,
  //                   height: 1.7,
  //                 ),
  //               ),
  //               const SizedBox(height: 28),
  //               SizedBox(
  //                 width: double.infinity,
  //                 child: ElevatedButton(
  //                   onPressed: () {
  //                     Navigator.of(dialogContext).pop();
  //                   },
  //                   style: _buttonStyle(),
  //                   child: const Text(
  //                     'Explore the Foundation →',
  //                     textAlign: TextAlign.center,
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final bool isDesktop = constraints.maxWidth >= 900;
              return SingleChildScrollView(
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1320),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: isDesktop ? 48 : 24,
                        vertical: isDesktop ? 64 : 32,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // First section: introduction and image
                          if (isDesktop)
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 6,
                                  child: _buildIntroduction(isDesktop),
                                ),
                                const SizedBox(width: 40),
                                Expanded(flex: 5, child: _buildImage()),
                              ],
                            )
                          else
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildIntroduction(isDesktop),
                                const SizedBox(height: 32),
                                _buildImage(),
                              ],
                            ),

                          const SizedBox(height: 48),

                          // About/mission highlights
                          _buildMissionHighlights(isDesktop),

                          const SizedBox(height: 64),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  //introductions
  Widget _buildIntroduction(bool isDesktop) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Wisdom • Wellness • Community
        Wrap(
          spacing: 20,
          runSpacing: 12,
          children: [
            for (final label in ['Wisdom', 'Wellness', 'Community'])
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.circle, size: 6, color: AppColor.primary),
                  const SizedBox(width: 8),
                  Text(label, style: AppTextStyles.bulletLabel),
                ],
              ),
          ],
        ),

        const SizedBox(height: 28),

        // Heading
        Text(
          'Ancient Wisdom.\nA Meaningful Life.',
          style: AppTextStyles.heading.copyWith(fontSize: isDesktop ? 54 : 36),
        ),

        const SizedBox(height: 24),

        // Description
        const Text(
          'Discover Vedic learning, yoga and cultural traditions '
          'that inspire a balanced life and bring our community together.',
          style: AppTextStyles.bodyLarge,
        ),

        const SizedBox(height: 32),

        // Membership button
        ElevatedButton(
          onPressed: () {
            // TODO: Connect this to your membership screen.
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.primary,
            foregroundColor: AppColor.white,
            elevation: 0,
            textStyle: AppTextStyles.button,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text('Become a Member →'),
        ),

        const SizedBox(height: 28),

        const Text(
          'Rooted in values. Growing together.',
          style: AppTextStyles.tagline,
        ),
      ],
    );
  }

  //image
  Widget _buildImage() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColor.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColor.border),
      ),
      child: AspectRatio(
        aspectRatio: 1.2,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(_logoPath, fit: BoxFit.contain),
        ),
      ),
    );
  }

  // Mission Highlights
  Widget _buildMissionHighlights(bool isDesktop) {
    final highlights = [
      (
        icon: Icons.auto_awesome_outlined,
        title: 'Spiritual Activities',
        description:
            'Organize spiritual gatherings and programs that encourage reflection and meaningful connection.',
      ),
      (
        icon: Icons.account_balance_outlined,
        title: 'Culture & Heritage',
        description:
            'Build awareness of the importance of protecting our culture, traditions and indigenous values.',
      ),
      (
        icon: Icons.self_improvement,
        title: 'Yoga & Meditation',
        description:
            'Promote Vedic yoga and meditation to support mental and physical wellbeing.',
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('OUR PURPOSE', style: AppTextStyles.sectionLabel),
        const SizedBox(height: 12),
        Text(
          'What we work towards',
          style: AppTextStyles.heading2.copyWith(fontSize: isDesktop ? 36 : 28),
        ),
        const SizedBox(height: 32),
        LayoutBuilder(
          builder: (context, constraints) {
            final double cardWidth = isDesktop
                ? (constraints.maxWidth - 40) / 3
                : constraints.maxWidth;

            return Wrap(
              spacing: 20,
              runSpacing: 20,
              children: highlights
                  .map(
                    (h) => SizedBox(
                      width: cardWidth,
                      child: _buildHighlightCard(
                        h.icon,
                        h.title,
                        h.description,
                      ),
                    ),
                  )
                  .toList(),
            );
          },
        ),
      ],
    );
  }

  Widget _buildHighlightCard(IconData icon, String title, String description) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColor.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColor.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF0DC),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: AppColor.primary, size: 28),
          ),
          const SizedBox(height: 20),
          Text(title, style: AppTextStyles.title),
          const SizedBox(height: 12),
          Text(description, style: AppTextStyles.bodySmall),
        ],
      ),
    );
  }
}
