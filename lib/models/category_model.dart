class CategoryModel {
  String image;
  String category;
  String products;

  CategoryModel(
      {required this.image, required this.category, required this.products});
}

List<CategoryModel> categoryContents = [
  CategoryModel(
    image: "assets/images/cart.png",
    category: "New Arrivals",
    products: "208 Product",
  ),
  CategoryModel(
      image: "assets/images/tshirt.png",
      category: "Clothes",
      products: "358 Product"),
  CategoryModel(
      image: "assets/images/bag.png",
      category: "Bags",
      products: "160 Product"),
  CategoryModel(
      image: "assets/images/shoe.png",
      category: "Shoese",
      products: "230 Product"),
  CategoryModel(
      image: "assets/images/electronic.png",
      category: "Electronics",
      products: "130 Product"),
  CategoryModel(
      image: "assets/images/ring.png",
      category: "Jewelry",
      products: "87 Product"),
];
