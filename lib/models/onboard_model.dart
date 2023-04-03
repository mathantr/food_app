class OnBoard {
  final String image, title, subtitle;
  OnBoard({
    required this.image,
    required this.title,
    required this.subtitle,
  });
}

List<OnBoard> onboards = [
  OnBoard(
    image: 'assets/images/onboard1.png',
    title: 'Grab your\nDelicious food!',
    subtitle: 'Delivery Food on your Phone',
  ),
  OnBoard(
      image: 'assets/images/onboard2.png',
      title: 'Online Delivery',
      subtitle:
          'A customer choosing the\nrestaurantof their choice,\nscanning the menu items'),
  OnBoard(
      image: 'assets/images/onboard3.png',
      title: 'Choose Your\nDestination',
      subtitle: 'The food is delivered\nto their desired location'),
];
