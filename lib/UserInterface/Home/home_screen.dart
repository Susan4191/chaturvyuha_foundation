import 'package:flutter/material.dart';
import 'package:chaturvyuha_foundation/utils/app_colors.dart';
import 'package:chaturvyuha_foundation/utils/app_constants.dart';

import '../../utils/app_text_styles.dart';
import '../../widgets/highlight_card.dart';
import '../../widgets/image_text_card.dart';

class HomeScreen extends StatefulWidget {
  final ValueChanged<int>? onTabSelected;
  const HomeScreen({super.key, this.onTabSelected});

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
                                Expanded(
                                  flex: 5,
                                  child: ImageTextCard(
                                    imagePath: _logoPath,
                                    text:
                                        'Rooted in Tradition, Guided by Wisdom.',
                                  ),
                                ),
                              ],
                            )
                          else
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildIntroduction(isDesktop),
                                const SizedBox(height: 32),
                                ImageTextCard(
                                  imagePath: _logoPath,
                                  text:
                                      'Rooted in Tradition, Guided by Wisdom.',
                                ),
                              ],
                            ),

                          const SizedBox(height: 48),

                          // About/mission highlights
                          _buildMissionHighlights(isDesktop),

                          const SizedBox(height: 64),

                          // Yoga & Meditation highlights
                          _buildYogaMeditationHighlights(isDesktop),

                          const SizedBox(height: 64),

                          // Vedic Education highlights
                          _buildVedicEducationHighlights(isDesktop),

                          const SizedBox(height: 64),

                          // UPCOMING EVENTS SECTIO
                          _buildUpcomingEvents(isDesktop),

                          const SizedBox(height: 64),
                          // LATEST ARTICLES & NEWS SECTIO
                          _buildLatestArticles(isDesktop),

                          const SizedBox(height: 64),
                          // PHOTO & VIDEO HIGHLIGHTS SECTIO
                          _buildPhotoVideoHighlights(isDesktop),

                          const SizedBox(height: 64),

                          // ANNOUNCEMENTS SECTION
                          _buildAnnouncements(isDesktop),

                          const SizedBox(height: 64),
                          // CONTACT & SOCIAL LINKS SECTIO
                          _buildContactAndSocialLinks(isDesktop),

                          const SizedBox(height: 64),

                          // FOOTER SECTION
                          _buildFooter(isDesktop),

                          const SizedBox(height: 32),
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

  //Introductions
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
            widget.onTabSelected?.call(7);
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
            if (isDesktop) {
              return IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    for (int i = 0; i < highlights.length; i++) ...[
                      Expanded(
                        child: HighlightCard(
                          icon: highlights[i].icon,
                          title: highlights[i].title,
                          description: highlights[i].description,
                        ),
                      ),
                      if (i < highlights.length - 1) const SizedBox(width: 20),
                    ],
                  ],
                ),
              );
            }

            return Column(
              children: highlights
                  .map(
                    (h) => Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: HighlightCard(
                        icon: h.icon,
                        title: h.title,
                        description: h.description,
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

  // Yoga & Meditation Highlights
  Widget _buildYogaMeditationHighlights(bool isDesktop) {
    final highlights = [
      (
        icon: Icons.spa_outlined,
        title: 'Holistic Health',
        description:
            'Focus on the unity of mind, body, and spirit through traditional Vedic practices.',
      ),
      (
        icon: Icons.psychology_outlined,
        title: 'Mindfulness',
        description:
            'Techniques to improve concentration, reduce stress, and achieve mental clarity.',
      ),
      (
        icon: Icons.air_outlined,
        title: 'Breath & Energy',
        description:
            'Learn Pranayama to balance your vital energy and enhance overall vitality.',
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('YOGA & MEDITATION', style: AppTextStyles.sectionLabel),
        const SizedBox(height: 12),
        Text(
          'Experience Inner Peace',
          style: AppTextStyles.heading2.copyWith(fontSize: isDesktop ? 36 : 28),
        ),
        const SizedBox(height: 32),
        LayoutBuilder(
          builder: (context, constraints) {
            if (isDesktop) {
              return IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    for (int i = 0; i < highlights.length; i++) ...[
                      Expanded(
                        child: HighlightCard(
                          icon: highlights[i].icon,
                          title: highlights[i].title,
                          description: highlights[i].description,
                        ),
                      ),
                      if (i < highlights.length - 1) const SizedBox(width: 20),
                    ],
                  ],
                ),
              );
            }

            return Column(
              children: highlights
                  .map(
                    (h) => Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: HighlightCard(
                        icon: h.icon,
                        title: h.title,
                        description: h.description,
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

  // Vedic Education Highlights
  Widget _buildVedicEducationHighlights(bool isDesktop) {
    final highlights = [
      (
        icon: Icons.menu_book_outlined,
        title: 'Ancient Scriptures',
        description:
            'Deep dive into the Vedas, Upanishads, and traditional texts to understand timeless wisdom.',
      ),
      (
        icon: Icons.school_outlined,
        title: 'Gurukul System',
        description:
            'Learn about classic lineage-based learning models that nurture values and comprehensive growth.',
      ),
      (
        icon: Icons.translate_outlined,
        title: 'Sanskrit Learning',
        description:
            'Discover the structure, phonetics, and beauty of the language of Vedic literature.',
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('VEDIC EDUCATION', style: AppTextStyles.sectionLabel),
        const SizedBox(height: 12),
        Text(
          'Empower through Knowledge',
          style: AppTextStyles.heading2.copyWith(fontSize: isDesktop ? 36 : 28),
        ),
        const SizedBox(height: 32),
        LayoutBuilder(
          builder: (context, constraints) {
            if (isDesktop) {
              return IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    for (int i = 0; i < highlights.length; i++) ...[
                      Expanded(
                        child: HighlightCard(
                          icon: highlights[i].icon,
                          title: highlights[i].title,
                          description: highlights[i].description,
                        ),
                      ),
                      if (i < highlights.length - 1) const SizedBox(width: 20),
                    ],
                  ],
                ),
              );
            }

            return Column(
              children: highlights
                  .map(
                    (h) => Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: HighlightCard(
                        icon: h.icon,
                        title: h.title,
                        description: h.description,
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

  // UPCOMING EVENTS WIDGET
  Widget _buildUpcomingEvents(bool isDesktop) {
    final events = [
      (
        title: 'Maha Shivaratri Satsang',
        date: 'March 8, 2024',
        time: '6:00 PM',
        location: 'Main Community Hall',
      ),
      (
        title: 'Vedic Yoga Retreat',
        date: 'April 15, 2024',
        time: '6:00 AM',
        location: 'Wellness Center',
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('UPCOMING EVENTS', style: AppTextStyles.sectionLabel),
        const SizedBox(height: 12),
        Text(
          'Join our gatherings',
          style: AppTextStyles.heading2.copyWith(fontSize: isDesktop ? 36 : 28),
        ),
        const SizedBox(height: 32),
        LayoutBuilder(
          builder: (context, constraints) {
            if (isDesktop) {
              return Row(
                children: [
                  for (int i = 0; i < events.length; i++) ...[
                    Expanded(child: _eventCard(events[i])),
                    if (i < events.length - 1) const SizedBox(width: 20),
                  ],
                ],
              );
            }
            return Column(
              children: events
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: _eventCard(e),
                    ),
                  )
                  .toList(),
            );
          },
        ),
      ],
    );
  }

  Widget _eventCard(var event) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColor.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColor.primary.withAlpha(30)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.calendar_today_outlined,
                size: 18,
                color: AppColor.primary,
              ),
              const SizedBox(width: 8),
              Text(
                event.date,
                style: AppTextStyles.bodySmall.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              const Icon(Icons.access_time, size: 18, color: AppColor.grey),
              const SizedBox(width: 4),
              Text(event.time, style: AppTextStyles.bodySmall),
            ],
          ),
          const SizedBox(height: 16),
          Text(event.title, style: AppTextStyles.title),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                size: 18,
                color: AppColor.grey,
              ),
              const SizedBox(width: 4),
              Text(event.location, style: AppTextStyles.bodySmall),
            ],
          ),
        ],
      ),
    );
  }

  //LATEST ARTICLES & NEWS WIDGET
  Widget _buildLatestArticles(bool isDesktop) {
    final articles = [
      (
        title: 'The Relevance of Vedas in Modern Life',
        category: 'Wisdom',
        excerpt:
            'Discover how ancient Vedic principles can help solve modern day lifestyle challenges...',
      ),
      (
        title: 'Pranayama: Science of Breath Control',
        category: 'Wellness',
        excerpt:
            'Understanding the mechanics behind traditional pranayama practices and physical health...',
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('LATEST ARTICLES', style: AppTextStyles.sectionLabel),
        const SizedBox(height: 12),
        Text(
          'Insights and Stories',
          style: AppTextStyles.heading2.copyWith(fontSize: isDesktop ? 36 : 28),
        ),
        const SizedBox(height: 32),
        LayoutBuilder(
          builder: (context, constraints) {
            if (isDesktop) {
              return Row(
                children: [
                  for (int i = 0; i < articles.length; i++) ...[
                    Expanded(child: _articleCard(articles[i])),
                    if (i < articles.length - 1) const SizedBox(width: 20),
                  ],
                ],
              );
            }
            return Column(
              children: articles
                  .map(
                    (a) => Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: _articleCard(a),
                    ),
                  )
                  .toList(),
            );
          },
        ),
      ],
    );
  }

  Widget _articleCard(var article) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColor.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColor.primary.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF0DC),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              article.category.toUpperCase(),
              style: AppTextStyles.bulletLabel.copyWith(fontSize: 10),
            ),
          ),
          const SizedBox(height: 16),
          Text(article.title, style: AppTextStyles.title),
          const SizedBox(height: 12),
          Text(article.excerpt, style: AppTextStyles.bodySmall),
          const SizedBox(height: 16),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: Size.zero,
            ),
            child: const Text('Read More →', style: AppTextStyles.link),
          ),
        ],
      ),
    );
  }

  //PHOTO & VIDEO HIGHLIGHTS WIDGET
  Widget _buildPhotoVideoHighlights(bool isDesktop) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('MEDIA HIGHLIGHTS', style: AppTextStyles.sectionLabel),
        const SizedBox(height: 12),
        Text(
          'Moments captured',
          style: AppTextStyles.heading2.copyWith(fontSize: isDesktop ? 36 : 28),
        ),
        const SizedBox(height: 32),
        LayoutBuilder(
          builder: (context, constraints) {
            final double gridWidth = isDesktop
                ? (constraints.maxWidth - 40) / 3
                : constraints.maxWidth;
            final placeholders = [
              (
                title: 'Cultural Festival 2023',
                icon: Icons.photo_library_outlined,
              ),
              (
                title: 'International Yoga Day',
                icon: Icons.video_library_outlined,
              ),
              (
                title: 'Gurukul Graduation Day',
                icon: Icons.photo_library_outlined,
              ),
            ];

            return Wrap(
              spacing: 20,
              runSpacing: 20,
              children: placeholders.map((p) {
                return Container(
                  width: gridWidth,
                  height: 200,
                  decoration: BoxDecoration(
                    color: AppColor.surface,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: AppColor.primary.withOpacity(0.2),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(p.icon, size: 40, color: AppColor.primary),
                      const SizedBox(height: 16),
                      Text(
                        p.title,
                        style: AppTextStyles.bodySmall.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            );
          },
        ),
      ],
    );
  }

  // ANNOUNCEMENTS WIDGET
  Widget _buildAnnouncements(bool isDesktop) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF0DC),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColor.primary.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.campaign_outlined,
                color: AppColor.primary,
                size: 28,
              ),
              const SizedBox(width: 12),
              Text(
                'ANNOUNCEMENTS',
                style: AppTextStyles.sectionLabel.copyWith(
                  color: AppColor.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'Admissions Open for Sanskrit Batch 2024!',
            style: AppTextStyles.title.copyWith(fontSize: 20),
          ),
          const SizedBox(height: 8),
          const Text(
            'Enroll today to learn foundational phonetics, grammar, and pronunciation rules from expert faculty.',
            style: AppTextStyles.body,
          ),
        ],
      ),
    );
  }

  // CONTACT & SOCIAL LINKS WIDGET
  Widget _buildContactAndSocialLinks(bool isDesktop) {
    final socials = [
      (icon: Icons.facebook, label: 'Facebook'),
      (icon: Icons.camera_alt_outlined, label: 'Instagram'),
      (icon: Icons.smart_display_outlined, label: 'YouTube'),
    ];

    final contactInfo = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('CONTACT US', style: AppTextStyles.sectionLabel),
        const SizedBox(height: 12),
        Text(
          'Get in Touch',
          style: AppTextStyles.heading2.copyWith(fontSize: isDesktop ? 36 : 28),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            const Icon(Icons.email_outlined, color: AppColor.primary),
            const SizedBox(width: 12),
            Text('info@chaturvyuha.org', style: AppTextStyles.body),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            const Icon(Icons.phone_outlined, color: AppColor.primary),
            const SizedBox(width: 12),
            Text('+1 (555) 019-2834', style: AppTextStyles.body),
          ],
        ),
      ],
    );

    final socialWidget = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('FOLLOW OUR JOURNEY', style: AppTextStyles.sectionLabel),
        const SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: socials.map((s) {
            return ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(s.icon, size: 20),
              label: Text(s.label),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.surface,
                foregroundColor: AppColor.primary,
                elevation: 0,
                side: BorderSide(color: AppColor.primary.withOpacity(0.3)),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );

    if (isDesktop) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: contactInfo),
          const SizedBox(width: 40),
          Expanded(child: socialWidget),
        ],
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [contactInfo, const SizedBox(height: 40), socialWidget],
    );
  }

  // FOOTER WIDGET WITH POLICIES & INFO
  Widget _buildFooter(bool isDesktop) {
    final importantLinks = AppConstants.navigationItems;
    final policies = ['Privacy Policy', 'Terms of Service', 'Cookie Policy'];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: AppColor.primary, width: 0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isDesktop)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Chaturvyuha Foundation',
                        style: AppTextStyles.title.copyWith(
                          color: AppColor.primary,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Preserving ancient Vedic knowledge and cultural heritage for a harmonious and balanced society.',
                        style: AppTextStyles.bodySmall,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 40),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'QUICK LINKS',
                        style: AppTextStyles.sectionLabel,
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        direction: Axis.vertical,
                        spacing: 8,
                        children: importantLinks
                            .map(
                              (l) => InkWell(
                                onTap: () {
                                  widget.onTabSelected?.call(
                                    importantLinks.indexOf(l),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 2,
                                  ),
                                  child: Text(
                                    l,
                                    style: AppTextStyles.bodySmall,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('LEGAL', style: AppTextStyles.sectionLabel),
                      const SizedBox(height: 12),
                      Wrap(
                        direction: Axis.vertical,
                        spacing: 8,
                        children: policies
                            .map(
                              (p) => InkWell(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 2,
                                  ),
                                  child: Text(
                                    p,
                                    style: AppTextStyles.bodySmall,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ],
            )
          else
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Chaturvyuha Foundation',
                  style: AppTextStyles.title.copyWith(color: AppColor.primary),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Preserving ancient Vedic knowledge and cultural heritage for a harmonious and balanced society.',
                  style: AppTextStyles.bodySmall,
                ),
                const SizedBox(height: 32),
                const Text('QUICK LINKS', style: AppTextStyles.sectionLabel),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 16,
                  runSpacing: 12,
                  children: importantLinks
                      .map(
                        (l) => InkWell(
                          onTap: () {
                            widget.onTabSelected?.call(
                              importantLinks.indexOf(l),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4,
                              vertical: 4,
                            ),
                            child: Text(l, style: AppTextStyles.bodySmall),
                          ),
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(height: 32),
                const Text('LEGAL', style: AppTextStyles.sectionLabel),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 16,
                  runSpacing: 12,
                  children: policies
                      .map(
                        (p) => InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4,
                              vertical: 4,
                            ),
                            child: Text(p, style: AppTextStyles.bodySmall),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          const SizedBox(height: 40),
          Center(
            child: Text(
              '© ${DateTime.now().year} Chaturvyuha Foundation. All Rights Reserved.',
              style: AppTextStyles.bodySmall.copyWith(
                fontSize: 12,
                color: AppColor.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
