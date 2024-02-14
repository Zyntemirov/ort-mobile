import 'package:flutter/material.dart';
import 'package:ort_mobile/features/onboarding/widgets/story_onboarding.dart';
import 'package:ort_mobile/features/onboarding/widgets/story_pages.dart';
import 'package:ort_mobile/gen/assets.gen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StoryOnboarding(
      pages: [
        StoryPages(
          title: 'Добро пожаловать в ORT!',
          description: 'Мы рады видеть вас в нашем приложении. ',
          asset: Assets.icon.ruster.onboardingFirst.image(),
        ),
        StoryPages(
          title: 'Получайте уведомления',
          description: 'Будьте в курсе о новых тестах',
          asset: Assets.icon.ruster.onboardingSecond.image(),
        ),
        StoryPages(
          title: 'Проходите тесты',
          description: 'Пройдите тесты и получайте результаты',
          asset: Assets.icon.ruster.onboardingLast.image(),
        ),
      ],
    );
  }
}
