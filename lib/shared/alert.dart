import 'dart:async';
import 'package:basicbankingsystem/main.dart';
import 'package:basicbankingsystem/shared/colors.dart';
import 'package:basicbankingsystem/widget/AllCustomer.dart';
import 'package:basicbankingsystem/widget/AllTransaction.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

 void showSuccessAlert(BuildContext context) {
    showDialog(context: context,
        builder: (context){
          return SingleChildScrollView(
              child : Container(
                margin: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.15),
                child: AlertDialog(
                  backgroundColor: primary_color,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  content: Form(
                    //key: _addressFormKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                              SizedBox(
                                height: 20,
                              ),
                              FittedBox(
                                child: Text("Successfully Transferred",
                                  style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(fontSize: 20,color: secondary_color
                                  ),
                                  )
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Lottie.asset("assets/lottie/success.json"),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                // padding: EdgeInsets.all(10),
                                child: FlatButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  color: Theme.of(context).accentColor,
                                  onPressed: () {
                                    Navigator.of(context).popUntil((route) => route.isFirst);
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Transaction()));
                                  },
                                  child: Text(
                                    "ok".toUpperCase(),
                                    style: GoogleFonts.rajdhani(
                                         textStyle: TextStyle(
                                         color:text_color,
                                         fontSize:20,
                                       )
                                   ),
                                  ),
                                ),
                              ),
                        ],
                      )
                  ),
                ),
              )
          );
        });
  }
