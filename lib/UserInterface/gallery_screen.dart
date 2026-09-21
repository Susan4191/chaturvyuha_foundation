import 'package:flutter/material.dart';
import '../utils/app_text_styles.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Gallery', style: AppTextStyles.heading));
  }
}
