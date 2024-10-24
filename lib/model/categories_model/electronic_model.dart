class ElectronicModel {
late String elecimage;
late String eletitle;
late String elecdesc;
late String elecprice;

ElectronicModel({
  required this.elecimage,
  required this.eletitle,
  required this.elecdesc,
  required this.elecprice
});

}

List <ElectronicModel> elec =[
  ElectronicModel(
    elecimage: "assets/images/3x/elec1.png", 
    eletitle: "On Ear Headphone", 
    elecdesc: "Beats Solo3 Wireless Kulak", 
    elecprice: "\$ 105.00"
    ),
    ElectronicModel(
    elecimage: "assets/images/3x/elec2.png", 
    eletitle: "Apple Watch", 
    elecdesc: "Headphones 700Beats", 
    elecprice: "\$ 475.00"
    ),
    ElectronicModel(
    elecimage: "assets/images/3x/elec3.png", 
    eletitle: "Table Lamp LED", 
    elecdesc: "Lamp For Students", 
    elecprice: "\$ 40.00"
    ),
    ElectronicModel(
    elecimage: "assets/images/3x/elec4.png", 
    eletitle: "Light Bulb", 
    elecdesc: "Incadescent,light bulb", 
    elecprice: "\$ 195.00"
    ),
    ElectronicModel(
    elecimage: "assets/images/3x/elec5.png", 
    eletitle: "Nikon D90 kit", 
    elecdesc: "7D+CANON 18/200", 
    elecprice: "\$ 645.00"
    ),
    ElectronicModel(
    elecimage: "assets/images/3x/elec6.png", 
    eletitle: "glasses frame", 
    elecdesc: "Aspire Funnelspider", 
    elecprice: "\$ 695.00"
    ),
];