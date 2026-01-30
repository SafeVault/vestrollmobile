enum OnboardingStatus { todo, completed }

class OnboardingStep {
  final String title;
  final OnboardingStatus status;
  final dynamic icon; // Can be IconData or Svg path

  const OnboardingStep({
    required this.title,
    required this.status,
    required this.icon,
  });
}
