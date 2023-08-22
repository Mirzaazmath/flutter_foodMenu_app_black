import 'package:flutter/material.dart';

import 'package:collection/collection.dart';

import '../Data/menudata.dart';
import 'detailscreen.dart';
import 'navbar.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor:const  Color(0xff283035),
        title: Row(
          children: [
            Expanded(
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                    height: 45,
                    width: 45,

                    child: Image.asset("assets/profile.png",fit: BoxFit.fill,),
                  ),
                ),
                title: const Text("Hi Dev_73arner",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),),
                subtitle:const  Text("All the most delicious for you",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12,color: Color(0xff9b9b9b)),),
              ),
            ),
            Container(

              height: 40,
              width: 40,
              decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(10),

                  color: Theme.of(context).scaffoldBackgroundColor,
                boxShadow: const [
                  BoxShadow(
                    color:  Color(0xff283035),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(18, 2), // changes position of shadow
                  ),
                ],
              ),
              child: Icon(Icons.menu,color: Theme.of(context).primaryColor,),
            ),
          ],
        ),

        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(20),
          child: Container(
            margin:const  EdgeInsets.only(bottom: 2),
            height: 6,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          physics:const  BouncingScrollPhysics(),
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           const  SizedBox(height: 20,),
            NavBar(),
          const   SizedBox(height: 30,),
            GridView.count(
              shrinkWrap: true,
              primary: false,

              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              childAspectRatio:1/1.5,
              crossAxisCount: 2,
              children: menuItemsList.mapIndexed((index,element)=>
                 GestureDetector(
                   onTap: (){
                     Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DetailsSCreen(element,index)));
                   },
                   child:  Container(
                     padding:const  EdgeInsets.all(10),
                     height: 250,
                     width: 200,
                     color: index==0||index==3? const Color(0xff283035):Color(0xff283035).withOpacity(0.3),
                     child: Column(
                       children: [
                         Row(mainAxisAlignment: MainAxisAlignment.end,
                           children: [
                             Icon(Icons.favorite_border,size: 27,color: Theme.of(context).primaryColor,),

                           ],
                         ),
                         Stack(
                           children: [
                             Container(
                               height: 150,
                               width: 150,
                               decoration: const BoxDecoration(
                                 color:  Color(0xff283035),

                                 shape: BoxShape.circle,
                                 boxShadow:  [
                                   BoxShadow(
                                     color: Color(0xff283035),
                                     // spreadRadius: 5,
                                     blurRadius: 20,
                                     offset: Offset(-8, -8),

                                   ),
                                   BoxShadow(
                                     //color: Color(0xff283035),
                                     color: Colors.black,
                                      spreadRadius: -15,
                                     blurRadius: 20,
                                     offset: Offset(2, 2),

                                   ),
                                 ],
                               ),
                             ),



                                Container(
                                 height: 150,
                                 width: 150,
                                    decoration:  BoxDecoration(
                                      color:const  Color(0xfff4f6f3),

                                      shape: BoxShape.circle,

                                      backgroundBlendMode: BlendMode.overlay,
                                      gradient: const LinearGradient(

                                          colors: [Colors.black,Colors.white]
                                      ),
                                      boxShadow:  [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          spreadRadius: 5,
                                          blurRadius: 9,
                                          offset: const Offset(-5, -5),

                                        ),
                                       const  BoxShadow(
                                          color: Colors.black,
                                          spreadRadius: -10,
                                          blurRadius: 10,
                                          offset: Offset(5,10),
                                        ),
                                      ],
                                    ),

                                   child: SizedBox(
                                     height: 50,
                                     width: 50,
                                     child:  FittedBox(child: Hero(
                                         tag: "$index",
                                         child: Image.asset(element.image,))),

                                 )



                             ),

                    ],
                         ),
                         const Spacer(),
                           Text(element.name,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color: Color(0xff858585)),textAlign: TextAlign.center,),
                         const Spacer(),
                       ],
                     ),
                   ),
                 )


              ).toList(),




            ),


          ],
        ),
      ),

    );
  }
}
