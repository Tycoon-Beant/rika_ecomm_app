import 'package:flutter/material.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}
String? selectedLang;
class _LanguageScreenState extends State<LanguageScreen> {
  List lang =[
    "English",
    "Britannica",
    "Bengali",
    "German",
    "Portuguese"
  ];
  
List langimg =[
  "assets/images/3x/eng.png",
  "assets/images/3x/britannica.png",
  "assets/images/3x/bengali.png",
  "assets/images/3x/german.png",
  "assets/images/3x/portuguese.png",
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Navigator.of(context).pop();
          },
          child: Image.asset("assets/images/arrowback.png")),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Language",
                hintStyle: TextStyle(color: Colors.grey),
                enabledBorder:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                )
              ),
            ),
            const SizedBox(height: 20),
            Text('Selected Language',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
            const SizedBox(height: 20),
            SizedBox(height: 600,
              child:
                  ListView.builder(
                    
                    itemCount: lang.length,
                  itemBuilder: (BuildContext context, int index) 
                  {  
                    final language = lang[index];
                    final isSelected = selectedLang== language;
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                             if (selectedLang == language) {
                                setState(() {
                                 selectedLang = null;
                               });
                            } else {
                                 setState(() {
                                     selectedLang = language;
                                  });
                              }
                          },
                          child: Container(
                            height: 100,
                            
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: const Color.fromARGB(255, 220, 219, 219),
                                  offset: Offset(5, 2),
                                  blurRadius: 1
                                )
                              ],
                              
                              borderRadius: BorderRadius.circular(20),
                              color: isSelected ? Colors.black : Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Row(
                                children: [
                                  Image.asset(langimg[index],scale: 2.5,),
                                  const SizedBox(width: 12),
                                  SizedBox(width: 150,
                                    child: Text(lang[index],style: TextStyle(fontSize: 24, color: isSelected ? Colors.white : null ),)),
                                    const SizedBox(width: 80),
                                    Icon(isSelected ? Icons.radio_button_checked : Icons.circle_outlined,
                                    color: isSelected ? Colors.white : Colors.black,)
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    );
                  },),
                
            ),
          ],
        ),
      ),
    );
  }
}
