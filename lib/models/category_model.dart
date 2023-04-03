class Category {
  final String image, name;

  Category({
    required this.image,
    required this.name,
  });
}

List<Category> categories = [
  Category(
      image:
          'https://freepngimg.com/thumb/burger/2-2-burger-free-download-png.png',
      name: "Burger"),
  Category(
      image: 'https://freepngimg.com/thumb/pizza/2-pizza-png-image.png',
      name: 'Pizza'),
  Category(
      image:
          'https://static.vecteezy.com/system/resources/previews/009/974/091/non_2x/cutout-danish-bread-on-transparent-background-free-png.png',
      name: 'Ice Cream'),
  Category(
      image: 'https://freepngimg.com/thumb/chocolate/7-2-chocolate-png-8.png',
      name: 'Chocolate'),
];
