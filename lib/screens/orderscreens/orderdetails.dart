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
      body: Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Dilevery Address",
                style: TextStyle(fontSize: 28, fontFamily: FontFamily.w700),
              ),
              const SizedBox(height: 20),
              Container(
                height: 220,
                width: 400,
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
                          Text("Street :",style: TextStyle(fontSize: 20,fontFamily: FontFamily.w700),),
                          const Text("3512 Pearl Street",style: TextStyle(color: Colors.grey, fontSize: 20,),),
                        ],
                      ),
                       Row(
                        children: [
                          Text("City :",style: TextStyle(fontSize: 20,fontFamily: FontFamily.w700),),
                          const Text("Sacramento",style: TextStyle(color: Colors.grey, fontSize: 20,),),
                        ],
                      ),
                      Row(
                        children: [
                          Text("State/Provision/Area :",style: TextStyle(fontSize: 20,fontFamily: FontFamily.w700),),
                          const Text("California",style: TextStyle(color: Colors.grey, fontSize: 20,),),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Phone number :",style: TextStyle(fontSize: 20,fontFamily: FontFamily.w700),),
                          const Text("916-299-4041",style: TextStyle(color: Colors.grey, fontSize: 20,),),
                        ],
                      ),
                      Row(
                        children: [
                          Text("ZipCode :",style: TextStyle(fontSize: 20,fontFamily: FontFamily.w700),),
                          const Text("95814",style: TextStyle(color: Colors.grey, fontSize: 20,),),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Country Calling Code :",style: TextStyle(fontSize: 20,fontFamily: FontFamily.w700),),
                          const Text("+1",style: TextStyle(color: Colors.grey, fontSize: 20,),),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Country :",style: TextStyle(fontSize: 20,fontFamily: FontFamily.w700),),
                          const Text("United States",style: TextStyle(color: Colors.grey, fontSize: 20,),),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text("Product Items", style: TextStyle(fontSize: 28,fontFamily: FontFamily.w700),),
        
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
                            Text("Roller Rabbit" ,style: TextStyle(
                              fontSize: 18,fontFamily: FontFamily.w700
                            ),),
                            const Text("Vado Odelle Dress",style: TextStyle(color: Colors.grey),),
                            Text("\$198.00" , style: TextStyle(fontFamily: FontFamily.w700,fontSize: 18),)
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
                            Text("Roller Rabbit" ,style: TextStyle(
                              fontSize: 18,fontFamily: FontFamily.w700
                            ),),
                            const Text("Vado Odelle Dress",style: TextStyle(color: Colors.grey),),
                            Text("\$198.00" , style: TextStyle(fontFamily: FontFamily.w700,fontSize: 18),)
                          ],
                        ),
                      ],
                    ),
                  ),
              ),
              Text("Promo Code",style: TextStyle(fontSize: 28,fontFamily: FontFamily.w700),),
        
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
                          Text("Add Promo Code" ,style: TextStyle(fontSize: 18,fontFamily: FontFamily.w700),),
                          Text("#rika2021",style: TextStyle(color: Colors.grey),)
                        ],
                      )
                    ],
                  ),
                ) ,
                ),
        
                const SizedBox(height: 100),
                Row(
                  children: [
                    Column(
                      children: [
                        const Text("Total Price" , style: TextStyle(color: Colors.grey),),
                        Text("\$443.00",style: TextStyle(fontSize: 24,fontFamily: FontFamily.w700),)
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
                     child: const Padding(
                       padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                       child: Text("Place order", style: TextStyle(color: Colors.white,fontSize: 20),),
                     ))
                  ],
                )
            
            ],
          ),
        ),
      ),
    );
  }
}
