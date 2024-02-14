import 'package:flutter/material.dart';
import 'package:ort_mobile/shared/utils/colors.dart';
import 'package:ort_mobile/shared/utils/text_styles.dart';

class StoryPages extends StatelessWidget {
  const StoryPages({
    super.key,
    required this.title,
    required this.description,
    required this.asset,
  });

  final String title;
  final String description;
  final Widget asset;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: AppColors.bg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 80),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: AppTextStyles.boldMainText,
            ),
          ),
          SizedBox(height: 14),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              textAlign: TextAlign.center,
              description,
              style: AppTextStyles.regularText,
            ),
          ),
          Spacer(),
          Center(child: asset),
          Spacer()
        ],
      ),
    );
  }
}
