class Categories {
  String? sId;
  String? name;
  String? owner;
  String? createdAt;
  String? updatedAt;
  dynamic iV;

  Categories(
      {this.sId,
      this.name,
      this.owner,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Categories.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    owner = json['owner'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['owner'] = this.owner;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}




// class CategoryModel {
//   String image;
//   String category;
//   String products;

//   CategoryModel(
//       {required this.image, required this.category, required this.products});
// }

// List<CategoryModel> categoryContents = [
//   CategoryModel(
//     image: "assets/images/cart.png",
//     category: "New Arrivals",
//     products: "208 Product",
//   ),
//   CategoryModel(
//       image: "assets/images/tshirt.png",
//       category: "Clothes",
//       products: "358 Product"),
//   CategoryModel(
//       image: "assets/images/bag.png",
//       category: "Bags",
//       products: "160 Product"),
//   CategoryModel(
//       image: "assets/images/shoe.png",
//       category: "Shoese",
//       products: "230 Product"),
//   CategoryModel(
//       image: "assets/images/electronic.png",
//       category: "Electronics",
//       products: "130 Product"),
//   CategoryModel(
//       image: "assets/images/ring.png",
//       category: "Jewelry",
//       products: "87 Product"),
// ];
