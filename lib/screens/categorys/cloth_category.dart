import 'package:flutter/material.dart';
import 'package:rika_ecomm_app/config/common.dart';
import 'package:rika_ecomm_app/model/categories_model/cloth_cat_model.dart';
import 'package:rika_ecomm_app/screens/productdetails/rollerrabbitdetails.dart';

class ClothCategory extends StatefulWidget {
  const ClothCategory({super.key});

  @override
  State<ClothCategory> createState() => _ClothCategoryState();
}

class _ClothCategoryState extends State<ClothCategory> {
 
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
                  "Cloths",textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontFamily: FontFamily.w700,
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                    ),
                    itemCount: cloths.length,
                    itemBuilder: (BuildContext context, int index) {
                      final cloth = cloths[index];
                      return ClothItem(cloth: cloth,);
                    },
                  ),
                  onDoubleTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Rollerrabbitdetails()));
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
class ClothItem extends StatefulWidget {
  final ClothCatModel cloth;

  const ClothItem({super.key, required this.cloth});

  @override
  State<ClothItem> createState() => _ClothItemState();
}

class _ClothItemState extends State<ClothItem> {
  bool isliked =false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[
        Card(
        
        color: Colors.white,
        
        elevation: 0,
       
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: AspectRatio(
                  aspectRatio: 2,
                  child: Image.asset(widget.cloth.clothImage,fit: BoxFit.fill,)
                ),
              ),
              Text(
                widget.cloth.clothTitle.toString(),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: FontFamily.w700),
              ),
              Text(
                widget.cloth.clothdesc.toString(),
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
                " ${widget.cloth.clothPrice}",textAlign: TextAlign.center,
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