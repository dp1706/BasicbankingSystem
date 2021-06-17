import 'package:basicbankingsystem/Provider/Transaction.dart';
import 'package:basicbankingsystem/shared/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class TransactionDetails extends StatefulWidget {
  
  final Ts transaction;
  TransactionDetails({@required this.transaction});
  @override
  _TransactionDetailsState createState() => _TransactionDetailsState();
}

class _TransactionDetailsState extends State<TransactionDetails> {

  Text title_Text = new Text("Transaction Details",
                               style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(fontSize: 20,color: secondary_color

     ),
  ));

   Widget richText({String first , String Second}) => Row(
                    children: [
                      RichText(
                         text: TextSpan(
                           text: "$first",
                           style:GoogleFonts.montserrat(
                                      textStyle: TextStyle(fontSize: 15,color: Colors.black
                              ),
                             ),
                           children: [
                             TextSpan(
                               text: "$Second",
                               style:GoogleFonts.rajdhani(
                               textStyle: TextStyle(
                               color:secondary_color,
                               fontWeight: FontWeight.w700,
                                fontSize:15,
                             )
                          ),
                          ),
                           ]
                         ),
                      ),
                    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary_color,
      appBar: AppBar(
        backgroundColor: primary_color,
        elevation: 10,
        title: title_Text,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(CupertinoIcons.back,color: secondary_color),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
      ),
      body:SingleChildScrollView(
         child: Container(
           child: Padding(
             padding: const EdgeInsets.only(right:20.0,left:20.0,bottom:20.0),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                    Container(
                      child: CircleAvatar(
                        radius:30,
                        backgroundColor: Colors.transparent,
                        backgroundImage: NetworkImage("${widget.transaction.Sender["imageurl"]}")
                      ),
                    ) ,
                    Container(
                      child:Lottie.asset("assets/lottie/checkmark.json",
                        width:MediaQuery.of(context).size.width * 0.16,
                        height:MediaQuery.of(context).size.height * 0.16,
                      ),
                    ),
                    Container(
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.transparent,
                        backgroundImage: NetworkImage("${widget.transaction.Receiver["imageurl"]}")
                      ),
                    )    
               ],
               ),
               Text("Transaction Details",
               style: GoogleFonts.rajdhani(
                        textStyle: TextStyle(
                        color:text_color,
                        fontSize:20,
                           )
                        ),
               ),
               SizedBox(
                 height:MediaQuery.of(context).size.height * 0.02,
               ),
               Container(
                padding: EdgeInsets.all(20),
                width:  MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                      border: Border.all(
                        color:Colors.blue,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    richText(first: "Transaction ID : ",Second: "${widget.transaction.TransactionID}"),
                    SizedBox(
                      height:8,
                    ),
                    richText(first: "Amount : ",Second: "${widget.transaction.amount}"),
                    SizedBox(
                      height:8,
                    ),
                    richText(first: "Date-Time : ",Second: "${widget.transaction.date} : ${widget.transaction.time}"),
                    SizedBox(
                      height:8,
                    ),
                    richText(first: "Status: ",Second: "Transferred"),
                  ],
                  ),

               ),
               SizedBox(
                 height:MediaQuery.of(context).size.height * 0.02,
               ),
               Text("Sender Details",
               style: GoogleFonts.rajdhani(
                        textStyle: TextStyle(
                        color:text_color,
                        fontSize:20,
                           )
                        ),
               ),
               SizedBox(
                 height:MediaQuery.of(context).size.height * 0.02,
               ),
               Container(
                padding: EdgeInsets.all(20),
                width:  MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                      border: Border.all(
                        color:Colors.blue,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [                   
                    richText(first: "Name : ",Second: "${widget.transaction.Sender["Name"]}"),
                    SizedBox(
                      height:8,
                    ),
                    richText(first: "Account Number : ",Second: "${widget.transaction.Sender["AccountNumber"]}"),
                    SizedBox(
                      height:8,
                    ),
                    richText(first: "IFSC Code : ",Second: "${widget.transaction.Sender["IFSCCODE"]}"),
                  ],
                  ),

               ),
               SizedBox(
                 height:MediaQuery.of(context).size.height * 0.02,
               ),
               Text("Receiver Details",
               style: GoogleFonts.rajdhani(
                        textStyle: TextStyle(
                        color:text_color,
                        fontSize:20,
                           )
                        ),
               ),
               SizedBox(
                 height:MediaQuery.of(context).size.height * 0.02,
               ),
               Container(
                padding: EdgeInsets.all(20),
                width:  MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                      border: Border.all(
                        color:Colors.blue,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    richText(first: "Name : ",Second: "${widget.transaction.Receiver["Name"]}"),
                    SizedBox(
                      height:8,
                    ),
                   richText(first: "Account Number : ",Second: "${widget.transaction.Receiver["AccountNumber"]}"),
                    SizedBox(
                      height:8,
                    ),
                    richText(first: "IFSC Code : ",Second: "${widget.transaction.Receiver["IFSCCODE"]}"),
                  ],
                  ),

               ),
               SizedBox(
                 height:MediaQuery.of(context).size.height * 0.05,
               ),
             ],),
           ),
         ),
       )
    );
  }
}