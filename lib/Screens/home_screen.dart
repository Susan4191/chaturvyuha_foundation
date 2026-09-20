import 'package:flutter/material.dart';
import 'package:chaturvyuha_foundation/utils/app_colors.dart';

import '../utils/app_text_styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.onBecomeMember});

  final VoidCallback? onBecomeMember;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const String _logoPath = 'assets/chaturvedal-1.png';

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      _showWelcomePopup();
    });
  }

  void _showWelcomePopup() {
    showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (dialogContext) {
        return AlertDialog(
          backgroundColor: AppColors.backgroundColor,
          surfaceTintColor: Colors.transparent,
          insetPadding: const EdgeInsets.all(20),
          scrollable: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          titlePadding: const EdgeInsets.fromLTRB(16, 8, 8, 0),
          title: Align(
            alignment: Alignment.topRight,
            child: IconButton(
              tooltip: 'Close',
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
              icon: Icon(Icons.close, color: AppColors.grey),
            ),
          ),
          contentPadding: const EdgeInsets.fromLTRB(28, 0, 28, 28),
          content: SizedBox(
            width: 440,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(_logoPath, height: 100, fit: BoxFit.contain),
                const SizedBox(height: 28),
                Text(
                  'WELCOME TO OUR COMMUNITY',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Ancient Wisdom.\nA Meaningful Life.',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.heading.copyWith(
                    color: AppColors.primary,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Explore Vedic learning, yoga and meditation, '
                  'and celebrate the traditions that bring us together.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.grey,
                    fontSize: 16,
                    height: 1.7,
                  ),
                ),
                const SizedBox(height: 28),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(dialogContext).pop();
                    },
                    style: _buttonStyle(),
                    child: const Text(
                      'Explore the Foundation →',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

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
                      horizontal: isDesktop ? 48 : 24,
                      vertical: isDesktop ? 64 : 32,
                    ),
                    child: isDesktop
                        ? Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 6,
                                child: _buildIntroduction(isDesktop),
                              ),
                              const SizedBox(width: 56),
                              Expanded(flex: 5, child: _buildImage(isDesktop)),
                            ],
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildIntroduction(isDesktop),
                              const SizedBox(height: 36),
                              _buildImage(isDesktop),
                              const SizedBox(height: 24),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 20,
          runSpacing: 12,
          children: [
            _buildBulletPoint('Wisdom'),
            _buildBulletPoint('Wellness'),
            _buildBulletPoint('Community'),
          ],
        ),
        const SizedBox(height: 28),
        Text(
          'Ancient Wisdom.\nA Meaningful Life.',
          style: AppTextStyles.heading.copyWith(
            color: AppColors.primary,
            fontSize: isDesktop ? 54 : 36,
            fontWeight: FontWeight.w700,
            height: 1.15,
            letterSpacing: -0.8,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Discover Vedic learning, yoga and cultural traditions '
          'that inspire a balanced life and bring our community together.',
          style: TextStyle(color: AppColors.grey, fontSize: 17, height: 1.7),
        ),
        const SizedBox(height: 32),
        ElevatedButton(
          onPressed: widget.onBecomeMember,
          style: _buttonStyle(),
          child: const Text('Become a Member →'),
        ),
        const SizedBox(height: 32),
        Container(width: 72, height: 2, color: AppColors.primary),
        const SizedBox(height: 16),
        Text(
          'Rooted in values. Growing together.',
          style: TextStyle(
            color: AppColors.grey,
            fontSize: 14,
            fontStyle: FontStyle.italic,
            height: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _buildImage(bool isDesktop) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isDesktop ? 36 : 24),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFCF7),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFEEDFCC)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0D4A2115),
            blurRadius: 28,
            offset: Offset(0, 12),
          ),
        ],
      ),
      child: AspectRatio(
        aspectRatio: 1.2,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(
            _logoPath,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return Center(
                child: Icon(
                  Icons.image_not_supported_outlined,
                  size: 48,
                  color: AppColors.grey,
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.circle, size: 6, color: AppColors.primary),
        const SizedBox(width: 8),
        Text(
          text.toUpperCase(),
          style: AppTextStyles.navButtonActive.copyWith(
            color: AppColors.primary,
            fontSize: 11,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.5,
          ),
        ),
      ],
    );
  }

  ButtonStyle _buttonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      elevation: 0,
      padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    );
  }

  Widget _socialContainer(String title, String url) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFFFFCF7),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFEEDFCC)),
        ),
        child: TextButton(
          onPressed: () => (url),
          style: TextButton.styleFrom(
            foregroundColor: AppColors.primary,
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(title),
        ),
      ),
    );
  }
}
