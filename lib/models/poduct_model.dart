class ProductModel {
  final String image, name, location;
  final double price, rate;

  ProductModel(
      {required this.image,
      required this.name,
      required this.location,
      required this.price,
      required this.rate});
}

List<ProductModel> productModel = [
  ProductModel(
      image:
          'https://www.freepnglogos.com/uploads/food-png/food-grass-fed-beef-foodservice-products-grass-run-farms-4.png',
      name: 'Meet',
      location: '150m',
      price: 22,
      rate: 5),
  ProductModel(
      image:
          'https://www.freepnglogos.com/uploads/food-png/download-food-png-file-png-image-pngimg-1.png',
      name: 'Bread Cheese',
      location: '80m',
      price: 15,
      rate: 4.5),
  ProductModel(
      image:
          'https://www.freepnglogos.com/uploads/food-png/food-plate-png-transparent-image-pngpix-2.png',
      name: 'Tandoori',
      location: '75m',
      price: 150,
      rate: 4.8),
  ProductModel(
      image:
          'https://www.freepnglogos.com/uploads/food-png/food-home-nanoosh-20.png',
      name: 'Rice',
      location: '20m',
      price: 88,
      rate: 3.7),
];
