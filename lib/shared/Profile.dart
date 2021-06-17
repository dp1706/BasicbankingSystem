import 'package:basicbankingsystem/Provider/User.dart';
import 'package:basicbankingsystem/shared/colors.dart';
import 'package:basicbankingsystem/shared/colors.dart';
import 'package:basicbankingsystem/widget/TransactionScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:basicbankingsystem/Provider/Users.dart';
import 'package:google_fonts/google_fonts.dart';



class Profile extends StatefulWidget {
  final User user;
  Profile({@required this.user});
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primary_color,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom:7.0),
          child: FloatingActionButton.extended(
           splashColor: Colors.blue,
           hoverElevation: 20.0,
           icon: Icon(CupertinoIcons.add),
            label: Text("Transaction"),
            backgroundColor: primary_color,
            foregroundColor: Icon_color,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1.0, color: Icon_color),
              borderRadius: BorderRadius.circular(20),
            ),
            onPressed: (){
                ShowBottomSheet(context);
            },
          ),
        ),
        body: Stack(
          children: <Widget>[
            CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  expandedHeight: 400,
                  backgroundColor: primary_color,
                  flexibleSpace: FlexibleSpaceBar(
                    collapseMode: CollapseMode.pin,
                    background: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage("${widget.user.imageurl}"),
                            fit: BoxFit.cover,
                          )
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.bottomRight,
                                colors: [
                                  primary_color,
                                  primary_color.withOpacity(.1)
                                ]
                            )
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              FittedBox(
                                child: Text("${widget.user.name}",style:
                                TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize:40
                                ),),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  FittedBox(
                                    child: Text("${widget.user.Email}",style:
                                    TextStyle(
                                        color: Colors.grey,
                                        //fontWeight: FontWeight.bold,
                                        fontSize:16
                                    ),),
                                  ),
                                ],
                              ),
                              // SizedBox(
                              //     height:20,
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SliverList(
                    delegate: SliverChildListDelegate([
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Phone Number",style:
                            TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "${widget.user.phoneNumber}",
                              style:
                              TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Text(
                              "Account Number",style:
                            TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "${widget.user.AccountNumber}",
                              style:
                              TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Text(
                              "IFSC Code",style:
                            TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "${widget.user.IFSCCODE}",
                              style:
                              TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Text(
                              "Account Balance",style:
                            TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "\u{20B9}${widget.user.current_balance}",
                              style:
                              TextStyle(
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                      ),
                    ])
                ),
              ],
            ),
          ],
        )
    );
  }

  ShowBottomSheet(BuildContext context){
    return showModalBottomSheet<void>(
      isScrollControlled: true,
      isDismissible: false,
      enableDrag: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      context: context,
      builder: (BuildContext context) {
        return FutureBuilder(
          future:Users().getUser(),
          builder: (context , snapshot){
            if(snapshot.connectionState != ConnectionState.done && !snapshot.hasData)
              return Container(
                color:primary_color,
                child:Center(
                  child: Lottie.asset("assets/lottie/loading.json")));
            else{
              List<User> inListuser = [];
              for(int i=0;i<snapshot.data.length;i++){
                if(snapshot.data[i].AccountNumber != widget.user.AccountNumber)
                 inListuser.add(snapshot.data[i]);
              }
              return SingleChildScrollView(
                child: SafeArea(
                  child: Container(
                      color:primary_color,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(top:20)),
                          Padding(
                            padding: const EdgeInsets.only(right:10.0,top:10.0),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                      icon: Icon(Icons.cancel,color: secondary_color),
                                      iconSize: 25,
                                      onPressed: (){
                                        Navigator.pop(context);
                                      }
                                  )
                                ]
                            ),
                          ),
                          Text("Select Customer",
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(fontSize: 20,color: secondary_color
                                ),
                              )
                          ),
                          SizedBox(
                            height:MediaQuery.of(context).size.height*0.04,
                          ),
                          for(int i=0;i<inListuser.length;i++)
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: ListTile(
                                   onTap: (){
                                     print("HII");
                                   },
                                   shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                   leading: CircleAvatar(                        
                                        backgroundColor: Colors.transparent,
                                        backgroundImage: NetworkImage("${inListuser[i].imageurl}")
                                   ),
                                   title: Text("${inListuser[i].name}",
                          style: GoogleFonts.raleway(
                            textStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: text_color
                            )
                          ),
                        ),
                        //contentPadding: EdgeInsets.all(6),
                        subtitle: Text("${inListuser[i].Email}",
                        style:GoogleFonts.dosis(
                            textStyle: TextStyle(
                                  fontSize: 16,
                                  color: text_color
                            )
                        ),
                        ),
                        trailing: Padding(
                          padding: const EdgeInsets.only(right:0.0),
                          child: IconButton(
                            icon: Icon(Icons.arrow_forward,color: text_color),
                            onPressed: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => TransactionScreen(Sender: widget.user,Reciever: inListuser[i])));
                            },
                            ),
                        ),
                                ),
                              ),
                              Divider(
                                thickness: 0.3,
                                color: secondary_color,
                              )
                            ],
                          )
                        ],
                      )
                  ),
                ),
              );
            }
          }
        );
      },
    );
  }
}