class OnboardingPageView {
  final String textFirstLine;
  final String textSecondLineStart;
  final String textSecondLineMiddle;
  final String textSecondLineEnd;
  final bool? isSecond;
  final String? isLang;
  OnboardingPageView(  {
    required this.textFirstLine,
    required this.textSecondLineStart,
    required this.textSecondLineMiddle,
    required this.textSecondLineEnd,
    this.isSecond,
    this.isLang,
  });
}
