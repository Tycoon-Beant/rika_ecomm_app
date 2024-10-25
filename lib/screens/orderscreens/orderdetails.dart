import 'package:flutter/material.dart';
import 'package:rika_ecomm_app/config/common.dart';
import 'package:rika_ecomm_app/screens/orderscreens/ordertracking.dart';

class Orderdetails extends StatefulWidget {
  const Orderdetails({super.key});

  @override
  State<Orderdetails> createState() => _OrderdetailsState();
}

class _OrderdetailsState extends State<Orderdetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset("assets/images/arrowback.png"),
      ),
      body: SingleChildScrollView(
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Dilevery Address",
                  style:  context.theme.headlineSmall,
                ),
                const SizedBox(height: 20),
                Container(
                 
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        offset: const Offset(2, 2),
                        blurRadius: 5,
                        spreadRadius: 2,
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text("Street : ",style:  context.theme.titleMedium),
                          Text("3512 Pearl Street",style: context.theme.titleSmall!.copyWith(color: Colors.grey)),
                          ],
                        ),
                         Row(
                          children: [
                            Text("City : ",style:  context.theme.titleMedium),
                             Text("Sacramento",style:context.theme.titleSmall!.copyWith(color: Colors.grey)),
                          ],
                        ),
                        Row(
                          children: [
                            Text("State/Provision/Area : ",style: context.theme.titleMedium),
                             Text("California",style: context.theme.titleSmall!.copyWith(color: Colors.grey)),
                          ],
                        ),
                        Row(
                          children: [
                            Text("Phone number : ",style:  context.theme.titleMedium),
                             Text("916-299-4041",style:context.theme.titleSmall!.copyWith(color: Colors.grey)),
                          ],
                        ),
                        Row(
                          children: [
                            Text("ZipCode : ",style:  context.theme.titleMedium),
                            Text("95814",style: context.theme.titleSmall!.copyWith(color: Colors.grey)),
                          ],
                        ),
                        Row(
                          children: [
                            Text("Country Calling Code : ",style:  context.theme.titleMedium),
                             Text("+1",style: context.theme.titleSmall!.copyWith(color: Colors.grey)),
                          ],
                        ),
                        Row(
                          children: [
                            Text("Country : ",style:  context.theme.titleMedium),
                             Text("United States",style: context.theme.titleSmall!.copyWith(color: Colors.grey)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text("Product Items", style: context.theme.titleMedium),
          
                Card(
                  color: Colors.white,
                  elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Image.asset("assets/images/3x/orderitem1.png"),
                          const SizedBox(width: 8),
                          Column(crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Roller Rabbit" ,style:context.theme.titleMedium),
                              Text("Vado Odelle Dress",style: context.theme.titleSmall!.copyWith(color: Colors.grey)),
                              Text("\$198.00" , style: context.theme.titleMedium)
                            ],
                          ),
                        ],
                      ),
                    ),
                ),
                 Card(
                  color: Colors.white,
                  elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Image.asset("assets/images/3x/orderitem2.png"),
                          const SizedBox(width: 8),
                          Column(crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Axel Arigato" ,style: context.theme.titleMedium),
                               Text("Clean 90 sneakers",style: context.theme.titleSmall!.copyWith(color: Colors.grey)),
                              Text("\$245.00" , style:context.theme.titleMedium,)
                            ],
                          ),
                        ],
                      ),
                    ),
                ),
                Text("Promo Code",style: context.theme.titleMedium),
          
                Card(
                  color: Colors.white,
                  elevation: 5,
                  child:Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Image.asset("assets/images/3x/promocode.png"),
                        const SizedBox(width: 8),
                         Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Add Promo Code" ,style: context.theme.titleMedium),
                            Text("#rika2021",style: context.theme.titleSmall!.copyWith(color: Colors.grey))
                          ],
                        )
                      ],
                    ),
                  ) ,
                  ),
          
                  const SizedBox(height: 50),
                  Row(
                    children: [
                      Column(
                        children: [
                           Text("Total Price" , style: context.theme.titleSmall!.copyWith(color: Colors.grey)),
                          Text("\$443.00",style: context.theme.titleMedium)
                        ],
                      ),
                      const SizedBox(width: 100),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32)
                          )
                        ),
                        onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Ordertracking()));
                        },
                       child: Padding(
                         padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                         child: Text("Place order", style: context.theme.titleMedium!.copyWith(color: Colors.white)),
                       ))
                    ],
                  )
              
              ],
            ),
          ),
        ),
      ),
    );
  }
}
