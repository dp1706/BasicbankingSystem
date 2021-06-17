import 'package:basicbankingsystem/shared/colors.dart';
import 'package:basicbankingsystem/widget/HomePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: MyHomePage(title: 'Basic Banking System'),
        home:  SplashScreen(
          useLoader: false,
          photoSize: 150,
          loadingText: Text("By: Dwarka Prasad",
          style: GoogleFonts.rajdhani(
                        textStyle: TextStyle(
                        color:text_color,
                        fontSize:20,
                           )
                        ),
          ),
          title: Text("Basic Bank System",
          style:GoogleFonts.raleway(
                      textStyle: TextStyle(
                      color: secondary_color,
                      fontSize:30,
               )
          ),
          ),
          backgroundColor: primary_color,
          image: Image(
             image: AssetImage("assets/images/transfer.png"),
          ),
          seconds: 14,
          navigateAfterSeconds: MyHomePage(title: 'Basic Banking System'),
        ),
      );
  }
}
