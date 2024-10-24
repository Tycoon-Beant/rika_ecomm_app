class ClothCatModel {
  late String clothImage;
  late String clothTitle;
  late String clothPrice;
  late String clothdesc;

  ClothCatModel({
    required this.clothImage,
    required this.clothTitle,
    required this.clothdesc,
    required this.clothPrice,
  });

}
List<ClothCatModel> cloths =[
  ClothCatModel(
    clothImage: "assets/images/3x/cloth1.png", 
    clothTitle: "Roller Rabit", 
    clothdesc: "Vado Odelle Dress", 
    clothPrice: "\$ 198.00"
    ),
  ClothCatModel(
    clothImage: "assets/images/3x/cloth2.png", 
    clothTitle: "endless rose", 
    clothdesc: "Bubble Elastic T-shirt", 
    clothPrice: "\$ 50.00"
    ),
  ClothCatModel(
    clothImage: "assets/images/3x/cloth3.png", 
    clothTitle: "Theory", 
    clothdesc: "Irregular Rib Skirt", 
    clothPrice: "\$ 345.00"
    ),
  ClothCatModel(
    clothImage: "assets/images/3x/cloth4.png", 
    clothTitle: "Madewell", 
    clothdesc: "Giselle Top in White Linen", 
    clothPrice: "\$ 69.50"
    ),
  ClothCatModel(
    clothImage: "assets/images/3x/cloth5.png", 
    clothTitle: "Roller Rabit", 
    clothdesc: "Vado Odelle Dress", 
    clothPrice: "\$ 198.00"
    ),
  ClothCatModel(
    clothImage: "assets/images/3x/cloth6.png", 
    clothTitle: "Rolla's", 
    clothdesc: "Erin Datura Dress", 
    clothPrice: "\$ 119.00"
    ),

];