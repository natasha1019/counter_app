import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
final Future<SharedPreferences> prefs=SharedPreferences.getInstance();
  int counter=0;

  void increment()async{
    final SharedPreferences sprefs= await prefs;
    setState(() {
      counter++;
    });
    sprefs.setInt('countervalue',counter);
  }
  void reset()async{
    final SharedPreferences sprefs= await prefs;
    setState(() {
      counter=0;
    });
    sprefs.setInt('countervalue', counter);
  }
  void getinitialvalue()async{
final SharedPreferences sprefs= await prefs;
setState(() {
  counter=sprefs.getInt('countervalue')??0;
}
);
  }
@override
void initState(){
  super.initState();
  getinitialvalue();
}
@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white10,
        height: MediaQuery.of(context).size.height,
        width:MediaQuery.of(context).size.width ,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        
          children:[
            GestureDetector(
              onTap:() => increment(),
               
            child:CircleAvatar(
              radius: 130,
              backgroundColor:Colors.lime,
               child: Text('$counter',
               style: TextStyle(
                  color: Colors.red,
                  fontSize: 90,
                  fontWeight:FontWeight.bold
                  ),
                  ),
            ),
            ),

             Align(
              alignment:Alignment.centerRight,
              child:Padding(
                padding: EdgeInsets.only(right: 30),
                child:GestureDetector(
                  onTap:() => reset(),
                   
               child:const CircleAvatar(
                radius: 50,
                backgroundColor:Colors.lime,
          
                child: Text('Reset',style: TextStyle(
                  color: Colors.red,
                  fontSize: 30,
                  fontWeight:FontWeight.bold
                  ),
                  ),
             )
                )
              )
             )
             ],
        ),
      ),
    );
  }
}