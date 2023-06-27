
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multi_select_flutter/bottom_sheet/multi_select_bottom_sheet.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

import 'main.dart';

class Refine extends StatefulWidget{
  @override
  State<Refine> createState() => _RefineState();
}

class _RefineState extends State<Refine> {
  late int length;

  int _selectedIndex=0;
  var value=50.0;
  List<String> _dropdownItems = [
    'SOS - Emergency ! Need Assistance ! HELP',
    'Option 2',
    'Option 3',
    'Option 4',
  ];

  List<Map<String,bool>> _item = [
    {"Coffee":true},
    {"Business":false},
    {"Hobbies":false},
    {"Friendship":false},
    {"Movies":true},
    {"Dining":false},
    {"Dating":false},
    {"Matrimony":false}];

  TextEditingController _message= TextEditingController();

  var val;

  @override
  Widget build(BuildContext context) {

    String? _selectedItem=_dropdownItems[0];
    _message.text = "Hi Community! I met with an accident and need immediate help.";

    return Scaffold(
        appBar: AppBar(
        leading: const Icon(Icons.menu_rounded),
    title: const Column(crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text("Refine"),
    Row(children: [
    Icon(Icons.location_on,size: 15,),
    Text("Berlin, Germany",style: TextStyle(fontSize: 15),),
    ],
    )
    ],
    ),
    actions: const [
    Icon(Icons.notifications_none_rounded)
    ],),
        bottomNavigationBar:  BottomNavigationBar(
        selectedItemColor: mainAppColor,
        unselectedItemColor: mainAppColor,

        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.checklist),
            label: 'Refine',
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

        currentIndex: _selectedIndex,
        onTap:( index) {
          setState(() {
            _selectedIndex = index;
            if(_selectedIndex==0){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Refine()));
            }
          });
        },
      ),
        body: Container(
          margin: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text("Select Your Status",style: TextStyle(color: Color(0xFF174565),fontWeight: FontWeight.bold,fontSize: 19),),
                ),
                DecoratedBox(
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 0.5, style: BorderStyle.solid, color: mainAppColor),
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    ),
                  ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 0),
                child: DropdownButton<String>(
                  underline: SizedBox(),
                  value: _selectedItem,
                  elevation: 0,iconEnabledColor: mainAppColor,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedItem = newValue;
                    });
                  },
                  items: _dropdownItems.map((String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(item,style: TextStyle(color: Color(0xFF174565),fontSize: 14)),
                    );
                  }).toList(),),
              ),
            ),
                const Padding(
                  padding: EdgeInsets.only(top: 25.0,bottom: 15),
                  child: Divider(thickness: 1,),
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text("Broadcast Breif Message",style: TextStyle(color: Color(0xFF174565),fontWeight: FontWeight.bold,fontSize: 19),),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(
                        color: mainAppColor,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(
                        color: mainAppColor,width: 0.5
                      ),
                    ),
                  ),
                  style: const TextStyle(color: Color(0xFF174565)),
                    controller: _message,
                  minLines: null,
                  maxLines:  null,
                  maxLength: 250,),
                const Padding(
                  padding: EdgeInsets.only(top: 25.0,bottom: 15),
                  child: Divider(thickness: 1,),
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text("Select Nearby Distance",style: TextStyle(color: Color(0xFF174565),fontWeight: FontWeight.bold,fontSize: 19),),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      showValueIndicator: ShowValueIndicator.always,valueIndicatorColor: mainAppColor,
                      overlayColor: mainAppColor,
                        trackHeight: 1.5,
                        thumbShape: const RoundSliderThumbShape(
                          enabledThumbRadius: 4.0,
                          disabledThumbRadius: 4,
                      ),
                        valueIndicatorTextStyle: TextStyle(fontSize: 10.0,),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 8.0)
                    ),
                    child: Slider(
                      thumbColor: Colors.white,
                      min: 0,
                      max: 100.0,
                      value: value,
                      label: '${value.round()}',
                      onChanged: (val) {
                        setState(() {
                          value = val;
                        });
                      },
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text("Select Purpose",style: TextStyle(color: Color(0xFF174565),fontWeight: FontWeight.bold,fontSize: 19),),
                ),
                Container(
                  margin:EdgeInsets.only(top: 30),
                  height: MediaQuery.of(context).size.width,
                  child: GridView.builder(
                      itemCount: _item.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent:25,
                    crossAxisCount: 3,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 30.0,
                  ),

                      itemBuilder: (context,index){
                        return GestureDetector(
                          onTap: (){
                            setState(() {
                              if(_item[index][(_item[index].keys.toString().substring(1,_item[index].keys.toString().length-1))]==true)
                                _item[index][(_item[index].keys.toString().substring(1,_item[index].keys.toString().length-1))]=false;
                              else
                                _item[index][(_item[index].keys.toString().substring(1,_item[index].keys.toString().length-1))]=true;
                            });
                          },
                          child: Container(
                            alignment:Alignment.center,
                            decoration: BoxDecoration(
                                color: _item[index][(_item[index].keys.toString().substring(1,_item[index].keys.toString().length-1))]==true?mainAppColor:Colors.transparent,
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                              border: Border.all(color: mainAppColor,width: 0.5)

                            ),

                            child: Text("${_item[index].keys.toString().substring(1,_item[index].keys.toString().length-1)}",style: TextStyle(color: _item[index][(_item[index].keys.toString().substring(1,_item[index].keys.toString().length-1))]==true?Colors.white:mainAppColor),),
                          )
                        );
                      }),
                )
        ],),
          ),),
    );
  }
}