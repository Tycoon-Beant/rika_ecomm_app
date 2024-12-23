class Onboardingmodel {
  late String image;

  late String discription;
  String subDescription;

  Onboardingmodel({required this.image, required this.discription, required this.subDescription});
}

List<Onboardingmodel> contents = [
  Onboardingmodel(

      image: 'assets/images/3x/onboardin_i.png',
      discription: "20% Discount New Arrival Product",
      subDescription: 'Publish up your selfies to make yourself more beautiful with this app.'
  ),
  Onboardingmodel(

      image: 'assets/images/3x/onboarding_ii.png',
      discription: "Take Advantage Of The Offer Shopping ",
      subDescription: 'Publish up your selfies to make yourself more beautiful with this app.'
  ),
  Onboardingmodel(

      image: 'assets/images/3x/onboarding_iii.png',
      discription: "All Types Offers Within Your Reach",
      subDescription: 'Publish up your selfies to make yourself more beautiful with this app.'
  ),
];