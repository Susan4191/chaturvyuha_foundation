import 'package:flutter/material.dart';
import 'package:chaturvyuha_foundation/utils/app_colors.dart';

import '../utils/app_text_styles.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isDesktop = constraints.maxWidth >= 900;

            return SingleChildScrollView(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1320),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: isDesktop ? 23 : 24,
                      vertical: isDesktop ? 56 : 32,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildIntroduction(isDesktop),
                        const SizedBox(height: 40),
                        _buildMission(),
                        const SizedBox(height: 48),
                        _buildSectionLabel('OUR PURPOSE'),
                        const SizedBox(height: 12),
                        Text(
                          'What we work towards',
                          style: _headingStyle(isDesktop ? 36 : 28),
                        ),
                        const SizedBox(height: 24),
                        _buildObjectives(),
                        const SizedBox(height: 40),
                        _buildClosingMessage(),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildIntroduction(bool isDesktop) {
    final introduction = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionLabel('ABOUT US'),
        const SizedBox(height: 18),
        Text(
          'Rooted in wisdom.\nUnited in purpose.',
          style: _headingStyle(isDesktop ? 48 : 34),
        ),
        const SizedBox(height: 24),
        Text(
          'Chaturvyuha Foundation is dedicated to preserving cultural '
          'heritage, sharing Vedic knowledge and encouraging a '
          'balanced, meaningful way of life.',
          style: _bodyStyle(18),
        ),
        const SizedBox(height: 16),
        Text(
          'Our purpose brings together spiritual activities, yoga, '
          'meditation and education to promote wellbeing, harmony '
          'and respect across communities.',
          style: _bodyStyle(16),
        ),
      ],
    );

    final logo = Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: _cardDecoration(),
      child: Column(
        children: [
          Image.asset(
            'assets/chaturvedal-1.png',
            height: 160,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return Icon(
                Icons.spa_outlined,
                size: 100,
                color: AppColors.primary,
              );
            },
          ),
          const SizedBox(height: 24),
          Text(
            'Wisdom • Wellness • Community',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              height: 1.6,
            ),
          ),
        ],
      ),
    );

    if (isDesktop) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(flex: 7, child: introduction),
          const SizedBox(width: 56),
          Expanded(flex: 5, child: logo),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [introduction, const SizedBox(height: 28), logo],
    );
  }

  Widget _buildMission() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF0DC),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.grey),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionLabel('OUR MISSION'),
          const SizedBox(height: 14),
          Text(
            'Preserving traditions. Inspiring mindful living.',
            style: _headingStyle(28),
          ),
          const SizedBox(height: 16),
          Text(
            'To preserve culture, traditions and indigenous values '
            'while making spiritual learning, Vedic education, yoga '
            'and meditation accessible to people of every caste, '
            'class and community.',
            style: _bodyStyle(16),
          ),
        ],
      ),
    );
  }

  Widget _buildObjectives() {
    final objectives = [
      (
        icon: Icons.auto_awesome_outlined,
        title: 'Spiritual Activities',
        description:
            'Organize spiritual gatherings, discourses and related '
            'programs that encourage reflection and meaningful connection.',
      ),
      (
        icon: Icons.account_balance_outlined,
        title: 'Culture & Heritage',
        description:
            'Build awareness of the importance of protecting our '
            'culture, traditions and indigenous values.',
      ),
      (
        icon: Icons.self_improvement,
        title: 'Yoga & Meditation',
        description:
            'Promote Vedic yoga and meditation to support mental '
            'and physical wellbeing.',
      ),
      (
        icon: Icons.menu_book_outlined,
        title: 'Vedic Education',
        description:
            'Encourage Vedic learning for the welfare, harmony '
            'and peace of society.',
      ),
      (
        icon: Icons.favorite_outline,
        title: 'Mindful Lifestyles',
        description:
            'Encourage healthier habits and thoughtful choices '
            'that contribute to a caring and responsible society.',
      ),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final columns = constraints.maxWidth >= 1000
            ? 3
            : constraints.maxWidth >= 620
            ? 2
            : 1;

        const spacing = 20.0;
        final cardWidth =
            (constraints.maxWidth - spacing * (columns - 1)) / columns;

        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: objectives.map((objective) {
            return SizedBox(
              width: cardWidth,
              child: _buildObjectiveCard(
                icon: objective.icon,
                title: objective.title,
                description: objective.description,
              ),
            );
          }).toList(),
        );
      },
    );
  }

  Widget _buildObjectiveCard({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF0DC),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: AppColors.primary, size: 28),
          ),
          const SizedBox(height: 20),
          Text(title, style: _headingStyle(23)),
          const SizedBox(height: 12),
          Text(description, style: _bodyStyle(15)),
        ],
      ),
    );
  }

  Widget _buildClosingMessage() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.black, width: 2)),
      ),
      child: Column(
        children: [
          Icon(Icons.diversity_3_outlined, color: AppColors.primary, size: 36),
          const SizedBox(height: 16),
          Text(
            'A place for every community.',
            textAlign: TextAlign.center,
            style: _headingStyle(26),
          ),
          const SizedBox(height: 12),
          Text(
            'Our purpose embraces people of every caste, class '
            'and community through shared learning and mutual respect.',
            textAlign: TextAlign.center,
            style: _bodyStyle(16),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionLabel(String text) {
    return Text(
      text,
      style: TextStyle(
        color: AppColors.primary,
        fontSize: 12,
        fontWeight: FontWeight.w700,
        letterSpacing: 2,
        height: 1.5,
      ),
    );
  }

  TextStyle _headingStyle(double size) {
    return AppTextStyles.heading.copyWith(
      color: AppColors.black,
      fontSize: size,
      fontWeight: FontWeight.w700,
      height: 1.2,
    );
  }

  TextStyle _bodyStyle(double size) {
    return TextStyle(color: AppColors.grey, fontSize: size, height: 1.7);
  }

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: const Color(0xFFFFFCF7),
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: AppColors.grey),
    );
  }
}
