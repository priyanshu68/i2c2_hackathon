class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: "Consistency is the key!!",
    image: "assets/imgs/image1.png",
    desc:
        "An app that keeps track of your professional accomplishments you strive with",
  ),
  OnboardingContents(
    title: "All organized assests in one click",
    image: "assets/imgs/image2.png",
    desc: "a detailed construction of what to do next",
  ),
  OnboardingContents(
    title: "Personalized study experience",
    image: "assets/imgs/image3.png",
    desc:
        "Take control of what you want to study and when you want to in your own time.",
  ),
];
