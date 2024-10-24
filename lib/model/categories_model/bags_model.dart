

class BagsModel {

late String bagimage;
late String bagtitle;
late String bagdesc;
late String bagprice;

BagsModel({
  required this.bagimage,
  required this.bagtitle,
  required this.bagdesc,
  required this.bagprice
});

}

List < BagsModel> bags = [
  BagsModel(
    bagimage: "assets/images/3x/bag1.png", 
    bagtitle: "The Marc Jacobs", 
    bagdesc: "Traveler Tote", 
    bagprice: "\$ 195.00"
    ),
     BagsModel(
    bagimage: "assets/images/3x/bag2.png", 
    bagtitle: "Bembien", 
    bagdesc: "Margot Medium Bag", 
    bagprice: "\$ 275.00"
    ),
     BagsModel(
    bagimage: "assets/images/3x/bag3.png", 
    bagtitle: "Herschel Supply Co.", 
    bagdesc: "Daypack Backpack", 
    bagprice: "\$ 40.00"
    ),
     BagsModel(
    bagimage: "assets/images/3x/bag4.png", 
    bagtitle: "Dangne Dover", 
    bagdesc: "Diy bag, Simple bags", 
    bagprice: "\$ 195.00"
    ),
     BagsModel(
    bagimage: "assets/images/3x/bag5.png", 
    bagtitle: "Proenza Schouler", 
    bagdesc: "Large Ruched Tote", 
    bagprice: "\$ 1,045.00"
    ),
     BagsModel(
    bagimage: "assets/images/3x/bag6.png", 
    bagtitle: "Mansur Gavriel", 
    bagdesc: "Oversized Tote", 
    bagprice: "\$ 695.00"
    ),
];