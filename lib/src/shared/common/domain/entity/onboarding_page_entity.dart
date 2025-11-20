import 'package:equatable/equatable.dart';
import 'package:wasli/core/core.dart';

class OnboardingPageEntity extends Equatable {
  final String description;
  final String title;
  final String image;

  const OnboardingPageEntity({
    required this.description,
    required this.title,
    required this.image,
  });
  @override
  List<Object?> get props => [description, title, image];
}

List<OnboardingPageEntity> onboardingPages = [
  OnboardingPageEntity(
    description: appLocalizer.onBoarding_desc_1,
    title: appLocalizer.onBoarding_title_1,
    image: AppIllustrations.onBoarding1,
  ),
  OnboardingPageEntity(
    description: appLocalizer.onBoarding_desc_2,
    title: appLocalizer.onBoarding_title_2,
    image: AppIllustrations.onBoarding2,
  ),
  OnboardingPageEntity(
    description: appLocalizer.onBoarding_desc_3,
    title: appLocalizer.onBoarding_title_3,
    image: AppIllustrations.onBoarding3,
  ),
];
