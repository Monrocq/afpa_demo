class Product {
  final String title;
  final double price;
  final String imageUrl;

  Product(
      {required this.title,
      required this.price,
      this.imageUrl =
          "https://cdn.pixabay.com/photo/2012/06/19/10/32/owl-50267_1280.jpg"});
}
