class MinePageModel {
  String? name;
  String? type;
  String? price;

  MinePageModel({required this.name, required this.type, required this.price});
}

List<MinePageModel> minePageContents = [
  MinePageModel(
    name: 'Roller Rabbit',
    type: 'Vado Odelle Dress',
    price: '\$198.00',
  ),
  MinePageModel(
    name: 'endless rose',
    type: 'Bubble Elastic T-shirt',
    price: '\$50.00',
  ),
  MinePageModel(
    name: 'Theory',
    type: 'Irregular Rib Skirt',
    price: '\$345.00',
  ),
  MinePageModel(
      name: 'Madewell', type: 'Giselie Top in White Linen', price: '\$69.50'),
];
