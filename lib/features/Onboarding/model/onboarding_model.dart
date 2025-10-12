/// A data model representing a single onboarding screen.
class OnboardingModel {
  final String
  imagePath; // Path to your asset (e.g., 'assets/images/onboarding_1.png')
  final String title;
  final String description;

  const OnboardingModel({
    required this.imagePath,
    required this.title,
    required this.description,
  });
}
