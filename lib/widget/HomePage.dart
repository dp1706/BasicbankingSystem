import 'package:basicbankingsystem/shared/colors.dart';
import 'package:basicbankingsystem/widget/AllCustomer.dart';
import 'package:basicbankingsystem/widget/AllTransaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class MyHomePage extends StatefulWidget {

  MyHomePage({Key key,this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<dynamic> goto(Widget child) => Navigator.of(context).push(MaterialPageRoute(builder: (context) => child));

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: primary_color,
      body:Container(
        child: Column(
          children: [
                SizedBox(
                  height: height * 0.25,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Basic Banking System",
                    style: GoogleFonts.raleway(
                      textStyle: TextStyle(
                      color: secondary_color,
                      fontSize:30,
                    )
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.1,
                ),
               Container(
                  height: 250,
                  width:300,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          primary_color.withOpacity(0.6),
                          primary_color.withOpacity(0.1),
                        ],
                        begin:Alignment.bottomCenter,
                        end:Alignment.topCenter,
                      ),
                    ),
                    child:null,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    image: DecorationImage(
                      image: AssetImage("assets/images/bankBuilding.jpg"),
                      fit: BoxFit.cover,
                    )
                  ),
                ),
                SizedBox(
                  height: height * 0.15,
                ),
                Container(
                  height:50,
                  child: FractionallySizedBox(
                    widthFactor: 0.8,
                    child: ElevatedButton.icon(
                      onPressed: (){
                          goto(AllCustomer());
                      }, 
                      icon: Icon(CupertinoIcons.person_3_fill,color:Icon_color) , 
                      label: Text("View All Customer",
                      style: GoogleFonts.rajdhani(
                      textStyle: TextStyle(
                      color:text_color,
                      fontSize:16,
                         )
                      ),
                      ),
                      style: ElevatedButton.styleFrom(
                      shadowColor: Colors.white,
                      onSurface: Colors.red,
                      elevation: 3,
                      animationDuration: Duration(milliseconds: 300),
                      shape: RoundedRectangleBorder( 
                         borderRadius: BorderRadius.circular(15),
                        ),
                      )
                    ),
                  ),
                ),
                SizedBox(
                   height: height * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("OR",style: GoogleFonts.raleway(
                      textStyle: TextStyle(
                      color: secondary_color,
                    )
                    ),)
                ],
                ),
                SizedBox(
                   height: height * 0.05,
                ),
                Container(
                  height:50,
                  child: FractionallySizedBox(
                    widthFactor: 0.8,
                    child: ElevatedButton.icon(
                      onPressed: (){
                           goto(Transaction());
                      }, 
                      icon: Icon(Icons.history,color:Icon_color), 
                      label: Text("Transacation History",style: GoogleFonts.rajdhani(
                      textStyle: TextStyle(
                      color: text_color,
                      fontSize:16,
                         )
                      ),),
                      style: ElevatedButton.styleFrom(
                      shadowColor: Colors.white,
                      onSurface: Colors.red,
                      elevation: 3,
                      animationDuration: Duration(milliseconds: 300),
                      shape: RoundedRectangleBorder( 
                         borderRadius: BorderRadius.circular(15),
                        ),
                      )
                    ),
                  ),
                ),
              ],
        ),
      )
    );
  }
}