
import 'dart:ui';

import 'package:flutter/material.dart';

import 'Refine.dart';


void main() {
  runApp(MaterialApp( home:Explore(),
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    primarySwatch: mainAppColor,
  ),
  ));
}

MaterialColor mainAppColor = const MaterialColor(0xFF174565, <int, Color>{
  50: Color(0xFF174565),
  100: Color(0xFF174565),
  200: Color(0xFF174565),
  300: Color(0xFF174565),
  400: Color(0xFF174565),
  500: Color(0xFF174565),
  600: Color(0xFF174565),
  700: Color(0xFF174565),
  800: Color(0xFF174565),
  900: Color(0xFF174565),
});

class Explore extends StatefulWidget{

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  Map<String, dynamic> myMap = {
    'profile':["assets/images/img1.png","assets/images/img.png","assets/images/img1.png","assets/images/img.png"],
    'name': ['Ava Maura','Ema Kinski','Selena Green','Jenn Anniston'],
    'profession': ['Lawyer','Photographer','Actor','Doctor'],
    'experience': ['7','3','2','5'],
  };

  @override
  Widget build(BuildContext context) {
    var _selectedIndex=1;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.menu_rounded),
          title: const Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Explore"),
              Row(children: [
                Icon(Icons.location_on,size: 15,),
                Text("Berlin, Germany",style: TextStyle(fontSize: 15),),
              ],
              )
            ],
          ),
          actions: const [
            Icon(Icons.notifications_none_rounded)
          ],
          bottom: const TabBar(
          tabs: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text("INDIVIDUAL",style: TextStyle(fontSize: 12),),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text("PROFESSIONAL",style: TextStyle(fontSize: 12),),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text("MERCHANT",style: TextStyle(fontSize: 12),),
            ),
          ],
        )),

        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: mainAppColor,
          unselectedItemColor: mainAppColor,

          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,

          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.checklist),
              label: 'Services',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.remove_red_eye),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_pin),
              label: 'Network',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.perm_contact_cal),
              label: 'Contacts',
            ),
          ],

          currentIndex: _selectedIndex=1,
          onTap:( index) {
            setState(() {
            _selectedIndex = index;
            if(_selectedIndex==0){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Refine()));
            }
          });
          },
        ),

        body:  TabBarView(
        children: [
            screen(context),
            screen(context),
            screen(context)
          ],)
      ),
    );
  }

  Widget screen(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            child:  Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width-100,height: 30,
                  child: Theme(data: ThemeData(primarySwatch: Colors.blueGrey,primaryColor: Colors.blueGrey),
                    child: const TextField(textAlignVertical: TextAlignVertical.bottom,
                      decoration: InputDecoration(hintText: "Search",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),),
                          prefixIcon: Icon(Icons.search)),),
                  ),
                ),
                const Icon(Icons.menu,size: 30,color: Colors.blueGrey,)
              ],
            ),
          ),
          Container(height: MediaQuery.of(context).size.height,
            child: ListView.builder(
                itemCount:myMap.length,
                itemBuilder: (BuildContext context, index){
                  return Container(
                    padding: const EdgeInsets.all(10),
                    child: Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 30,top: 0,right: 10),
                            height: MediaQuery.of(context).size.width-120,
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              boxShadow: [
                                BoxShadow(color: Colors.black12,offset: Offset(0, 1,),
                                  blurRadius: 20.0,
                                ),
                              ],
                            ),
                            child:  Column(
                              children: [
                                Center(
                                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const SizedBox(height: 33,),
                                      Text("${myMap['name'][index]}",style: TextStyle(color:mainAppColor,fontSize: 15,fontWeight: FontWeight.bold),),
                                      Text("Berlin, within 2 kms",style: TextStyle(color:mainAppColor,fontSize: 15,fontWeight: FontWeight.normal),),
                                      Container(padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 0),width:150,child: SliderTheme(
                                        data: SliderTheme.of(context).copyWith(
                                            overlayShape: SliderComponentShape.noThumb,
                                            trackHeight: 10,
                                            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 5.9,elevation: 0)),
                                        child: Slider(
                                          value: 50,
                                          onChanged: (val){
                                          },
                                          min: 0,max: 100,),
                                      )),
                                      Container(width: 150,child: Row(mainAxisAlignment:MainAxisAlignment.center,children: [
                                        IconButton(onPressed: (){}, icon: const Icon(Icons.call,)),
                                        IconButton(onPressed: (){}, icon: const Icon(Icons.person_add_alt_1)),
                                      ],),)
                                    ],),
                                ),const Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("${myMap['profession'][index]} | ${myMap['experience'][index]} yrs of Experience",style: TextStyle(color:mainAppColor,fontSize: 15,fontWeight: FontWeight.bold),),
                                      Text("Hi Community! I am available at your service!!",style: TextStyle(color:mainAppColor,fontSize: 14),),

                                    ],),
                                )
                              ],
                            ),
                          ),
                          Positioned(
                              left: 0,top: 30,height: (MediaQuery.of(context).size.width-200)/1.5,
                              child: Card(child: Image.asset("${myMap['profile'][index]}"),))
                        ]),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
