import 'package:basicbankingsystem/Provider/User.dart';
import 'package:basicbankingsystem/Provider/Users.dart';
import 'package:basicbankingsystem/main.dart';
import 'package:basicbankingsystem/shared/colors.dart';
import 'package:basicbankingsystem/widget/AllTransaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:basicbankingsystem/shared/alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class TransactionScreen extends StatefulWidget {
  
  final User Sender;
  final User Reciever;
  
  TransactionScreen({
     @required this.Sender,
     @required this.Reciever,
  });

  @override
  _TransactionScreenState createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {


  TextEditingController controller = new TextEditingController();
  final key = GlobalKey<FormState>();
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
       appBar:AppBar(
        backgroundColor: primary_color,
        elevation: 10,
        title: Text("Transaction Details",
                               style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(fontSize: 20,color: secondary_color
                 ),
          )),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(CupertinoIcons.back,color: secondary_color),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
        actions: [
            
        ],
      ),
       backgroundColor: primary_color,
       body: SingleChildScrollView(
         child: Container(
           child: Padding(
             padding: const EdgeInsets.only(right:20.0,left:20.0,bottom:20.0),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
              //  SizedBox(
              //    height:MediaQuery.of(context).size.height * 0.02,
              //  ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                    Container(
                      child: CircleAvatar(
                        radius:30,
                        backgroundColor: Colors.transparent,
                        backgroundImage: NetworkImage("${widget.Sender.imageurl}")
                      ),
                    ) ,
                    Container(
                      child:Lottie.asset("assets/lottie/to.json",
                        width:MediaQuery.of(context).size.width * 0.16,
                        height:MediaQuery.of(context).size.height * 0.16,
                      ),
                    ),
                    Container(
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.transparent,
                        backgroundImage: NetworkImage("${widget.Reciever.imageurl}")
                      ),
                    )    
               ],
               ),
              //  SizedBox(
              //    height:MediaQuery.of(context).size.height * 0.02,
              //  ),
               Text("Sender Bank Details",
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
                    richText(first: "Account Number : ",Second: "${widget.Sender.AccountNumber}"),
                    SizedBox(
                      height:8,
                    ),
                    richText(first: "IFSC Code : ",Second: "${widget.Sender.IFSCCODE}"),
                    SizedBox(
                      height:8,
                    ),
                    richText(first: "Account Balance : ",Second: "\u{20B9}${widget.Sender.current_balance}")
                  ],
                  ),

               ),
               SizedBox(
                 height:MediaQuery.of(context).size.height * 0.02,
               ),
               Text("Receiver Bank Details",
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
                    richText(first: "Account Number : ",Second: "${widget.Reciever.AccountNumber}"),
                    SizedBox(
                      height:8,
                    ),
                    richText(first: "IFSC Code : ",Second: "${widget.Reciever.IFSCCODE}"),
                    SizedBox(
                      height:8,
                    ),
                    richText(first: "Account Balance : ",Second: "\u{20B9}${widget.Reciever.current_balance}")
                  ],
                  ),

               ),
               SizedBox(
                 height:MediaQuery.of(context).size.height * 0.02,
               ),
               Text("Enter Amount to be Transfer",
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
                padding: EdgeInsets.only(bottom:10,top:10),
                width:  MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                      border: Border.all(
                        color:Colors.blue,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                child: Form(
                  key:key,
                  child: TextFormField(
                    style: TextStyle(fontSize:20,color:text_color),
                    controller: controller,
                    validator: (value) {
                        if(value.isEmpty)
                            return "Amount cannot be empty";
                        else if(double.parse(value)<1)
                            return "Minimum Amount should be \u{20B9}1";
                        else if(double.parse(value) > double.parse("${widget.Sender.current_balance}"))
                            return "Account Balance is not Enough";
                        else 
                            return null;
                    },
                    onChanged: (value) => key.currentState.validate(),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      errorStyle: TextStyle(height: 0.5,),
                      filled: true,
                      fillColor: Colors.transparent,
                      contentPadding:
                                   EdgeInsets.only(left: 15, bottom: 11, top: 10, right: 15),
                      hintText: "Enter Amount ",
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(top:5.0,left: 20.0,bottom:5.0),
                        child: Text("\u{20B9}",style: TextStyle(fontSize:30,color:secondary_color),),
                      ),
                    ),
                  ),
                ),
               ),
               SizedBox(
                 height:MediaQuery.of(context).size.height * 0.05,
               ),
               GestureDetector(
                 onTap: () async {
                      if(key.currentState.validate()) {
                         Future<bool> istransacted = Users().MakeTransaction(user1:widget.Sender,user2:widget.Reciever,amount:double.parse(controller.text));
                         controller.clear();
                         showSuccessAlert(context);
                      }
                 },
                 child: Container(
                  padding: EdgeInsets.all(10),
                  // color: primary_color,
                   width:  MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                        color: Colors.blue,
                        border: Border.all(
                          color:Colors.blue,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                  child: Center(
                    child: Text("Proceed",
                    style: GoogleFonts.rajdhani(
                          textStyle: TextStyle(
                          color:text_color,
                          fontSize:20,
                             )
                          ),
                    ),
                  ),
                 ),
               ),
             ],),
           ),
         ),
       )
    );
  }
}