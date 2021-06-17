import 'package:basicbankingsystem/Provider/Users.dart';
import 'package:basicbankingsystem/shared/Profile.dart';
import 'package:basicbankingsystem/shared/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class AllCustomer extends StatefulWidget {

  @override
  _AllCustomerState createState() => _AllCustomerState();
}

class _AllCustomerState extends State<AllCustomer> {

  Text title_Text = new Text("All Customers",
                               style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(fontSize: 20,color: secondary_color

     ),
  ));

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
        actions: [
            Padding(
              padding: const EdgeInsets.only(right:8.0),
              child: IconButton(
              icon: Icon(CupertinoIcons.question_circle,color: secondary_color),
              onPressed: (){
              Navigator.of(context).pop();
          },
        ),
            ),
        ],
      ),
      body:FutureBuilder(
        future: Users().getUser(),
        builder: (context, snapshot){
          if(snapshot.connectionState != ConnectionState.done && !snapshot.hasData)
          return Center(child: Lottie.asset("assets/lottie/loading.json"));
          else{
              print(snapshot.data);
              return ListView.builder(
                  addRepaintBoundaries: false,
                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data.length,
                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                  itemBuilder: (context, index) {
                    return ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Profile(user: snapshot.data[index])));
                      },
                      leading: CircleAvatar(
                        // radius: 50,
                        backgroundColor: Colors.transparent,
                        backgroundImage: NetworkImage("${snapshot.data[index].imageurl}")
                      ),
                      title: Text("${snapshot.data[index].name}",
                        style: GoogleFonts.raleway(
                          textStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: text_color
                          )
                        ),
                      ),
                      contentPadding: EdgeInsets.all(6),
                      subtitle: Text("${snapshot.data[index].Email}",
                      style:GoogleFonts.dosis(
                          textStyle: TextStyle(
                              fontSize: 16,
                              color: text_color
                          )
                      ),
                      ),
                      trailing: Padding(
                        padding: const EdgeInsets.only(right:20.0),
                        child: Text("\u{20B9}${snapshot.data[index].current_balance}",
                          style:GoogleFonts.dancingScript(
                              textStyle: TextStyle(
                                  fontSize: 16,
                                  color: text_color
                              )
                          ),
                        ),
                      ),
                    );
                  }
              );
          }
        },
      )
    );
  }

}