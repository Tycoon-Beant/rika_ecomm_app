import 'package:flutter/material.dart';
import 'package:rika_ecomm_app/config/common.dart';
import 'package:rika_ecomm_app/model/categories_model/electronic_model.dart';

class Electronicsscreen extends StatefulWidget {
  const Electronicsscreen({super.key});

  @override
  State<Electronicsscreen> createState() => _ElectronicsscreenState();
}

class _ElectronicsscreenState extends State<Electronicsscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        scrolledUnderElevation: 0.0,
        notificationPredicate: (_) => false,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 24),
          child: GestureDetector(
            child: Image.asset("assets/images/arrowback.png"),
            onTap: () {
              Navigator.pop(context, null);
            }
            ,),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: Image.asset("assets/images/search.png"),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10,bottom: 20),
                child: Text(
                  "Electronics",textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontFamily: FontFamily.w700,
                  ),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: elec.length,
                  itemBuilder: (BuildContext context, int index) {
                    final elecss = elec[index];
                    return ElecItem(elecs: elecss,);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class ElecItem extends StatefulWidget {
  final ElectronicModel elecs;

  const ElecItem({super.key, required this.elecs});

  @override
  State<ElecItem> createState() => _ElecItemState();
}

class _ElecItemState extends State<ElecItem> {
  bool isliked =false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[Card(
        
        color: Colors.white,
        // margin: EdgeInsets.all(20),
        // semanticContainer: true,
        // clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 0,
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(20),
        // ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: AspectRatio(
                  aspectRatio: 2,
                  child: Image.asset(widget.elecs.elecimage,fit: BoxFit.fill,)
                ),
              ),
              Text(
                widget.elecs.eletitle.toString(),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: FontFamily.w700),
              ),
              Text(
                widget.elecs.elecdesc.toString(),
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontFamily: FontFamily.w400
                     ),
              ),
              Text(
                " ${widget.elecs.elecprice}",textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: FontFamily.w700
                ),
              ),
            ],
          ),
        ),
      ),
      Positioned(
        top: 10,
        right: 10,
        child: 
        IconButton(
          onPressed: () {
            setState(() {
              isliked =! isliked;
            });
            },
          icon: 
           Icon(isliked ? Icons.favorite : Icons.favorite_border, 
            color: isliked ?Colors.red:Colors.black,
          ),
        )
        // Image.asset("assets/images/3x/love.png", 
        //     scale: 2,
        //  )
         )
      ] 
    );
  }
}