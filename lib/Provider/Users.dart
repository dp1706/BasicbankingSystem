import 'package:basicbankingsystem/Provider/User.dart';
import 'package:basicbankingsystem/Provider/Transaction.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Users{

  var collref = FirebaseFirestore.instance.collection("Users");
  var transactionref = FirebaseFirestore.instance.collection("Transaction");
  String transactionID = "TRANX1201";
  int _transvalue = 0;

  List<User> _user = [
    User(name:"Leanne Graham",phoneNumber:"1-770-736-8031 x56442",Email:"Sincere@april.biz",current_balance:10000.0,AccountNumber:"1111222233334441",IFSCCODE: "SBIN000694",imageurl: "https://randomuser.me/api/portraits/men/18.jpg"),
    User(name:"Ervin Howell",phoneNumber:"010-692-6593 x09125",Email:"Shanna@melissa.tv",current_balance:700.0,AccountNumber:"1111222233334442",IFSCCODE: "SBIN000695",imageurl: "https://randomuser.me/api/portraits/men/26.jpg"),
    User(name:"Clementine Bauch",phoneNumber:"1-463-123-4447",Email:"Nathan@yesenia.net",current_balance:8000.0,AccountNumber:"1111222233334443",IFSCCODE: "SBIN000696",imageurl: "https://randomuser.me/api/portraits/men/62.jpg"),
    User(name:"Patricia Lebsack",phoneNumber:"493-170-9623 x156",Email:"Julianne.OConner@kory.org",current_balance:9000.0,AccountNumber:"1111222233334444",IFSCCODE: "SBIN000697",imageurl: "https://randomuser.me/api/portraits/men/80.jpg"),
    User(name:"Chelsey Dietrich",phoneNumber:"(254)954-1289",Email:"Lucio_Hettinger@annie.ca",current_balance:1500.0,AccountNumber:"1111222233334445",IFSCCODE: "SBIN000698",imageurl: "https://randomuser.me/api/portraits/men/13.jpg"),
    User(name:"Mrs. Dennis Schulist",phoneNumber:"1-477-935-8478 x6430",Email:"Karley_Dach@jasper.info",current_balance:2000.0,AccountNumber:"1111222233334446",IFSCCODE: "SBIN000681",imageurl: "https://randomuser.me/api/portraits/men/58.jpg"),
    User(name:"Kurtis Weissnat",phoneNumber:"210.067.6132",Email:"Telly.Hoeger@billy.biz",current_balance:9000.0,AccountNumber:"1111222233334447",IFSCCODE: "SBIN000682",imageurl: "https://randomuser.me/api/portraits/men/62.jpg"),
    User(name:"Nicholas Runolfsdottir V",phoneNumber:"586.493.6943 x140",Email:"Sherwood@rosamond.me",current_balance:7000.0,AccountNumber:"1111222233334448",IFSCCODE: "SBIN000683",imageurl: "https://randomuser.me/api/portraits/men/52.jpg"),
    User(name:"Glenna Reichert",phoneNumber:"(775)976-6794 x41206",Email:"Chaim_McDermott@dana.io",current_balance:3200.0,AccountNumber:"1111222233334449",IFSCCODE: "SBIN000684",imageurl: "https://randomuser.me/api/portraits/men/44.jpg"),
    User(name:"Clementina DuBuque",phoneNumber:"024-648-3804",Email:"Rey.Padberg@karina.biz",current_balance:1200.0,AccountNumber:"1111222233334440",IFSCCODE: "SBIN000685",imageurl: "https://randomuser.me/api/portraits/men/10.jpg"),
  ];

  addUser() async{
    for(int i=0;i<_user.length;i++){
      await collref.doc("$i").set({
        "CustmerID":"$i",
        "Name":_user[i].name,
        "phoneNumber":_user[i].phoneNumber,
        "Email":_user[i].Email,
        "currentBalance":_user[i].current_balance,
        "AccountNumber":_user[i].AccountNumber,
        "IFSCCODE":_user[i].IFSCCODE,
        "ImageURL":_user[i].imageurl,
      }).catchError((onError){
        print(onError.toString());
      });
    }
  }

  Future<List<User>> getUser() async{
    List<User>loadedUser = [];
    await collref.get().then((value){
        value.docs.forEach((element) {
            loadedUser.add(User(name: element.data()["Name"],phoneNumber: element.data()["phoneNumber"],Email: element.data()["Email"],AccountNumber: element.data()["AccountNumber"],IFSCCODE: element.data()["IFSCCODE"],current_balance: element.data()["currentBalance"],imageurl: element.data()["ImageURL"],customerID: element.data()["CustmerID"]));
        });
    }).catchError((onError){
        print(onError.toString());
    });
     return loadedUser;
  }


  Future<bool> MakeTransaction({double amount,User user1,User user2}) async{

    DateTime date = DateTime.now();
    double UpdatedSenderMoney = user1.current_balance - amount;
    double UpdatedRecieverMoney = user2.current_balance + amount;

    Ts t = new Ts(TransactionID:"$transactionID${date.year}${date.month > 9 ? date.month : "0${date.month}"}${date.day > 9 ? date.day : "0${date.day}"}${date.hour > 9 ? date.hour : "0${date.hour}"}${date.minute > 9 ? date.minute : "0${date.minute}"}${date.second > 9 ? date.second : "0${date.second}"}",Sender:{
          "AccountNumber":user1.AccountNumber,
          "IFSCCODE":user1.IFSCCODE,
          "imageurl":user1.imageurl,
          "Name":user1.name
        },Receiver: {
          "AccountNumber":user2.AccountNumber,
          "IFSCCODE":user2.IFSCCODE,
          "imageurl":user2.imageurl,
          "Name":user2.name
        }, amount: amount,date:"${date.day.toString()}/${date.month.toString()}/${date.year.toString()}",time:"${date.hour.toString()}:${date.minute.toString()}:${date.second.toString()}",);

    List<Map<String,dynamic>> tobeUpdate = [{
      "id":user1.customerID,
      "value":UpdatedSenderMoney,
    },{
        "id":user2.customerID,
        "value": UpdatedRecieverMoney,
    }];
    print(_transvalue);
    bool result =  await transactionref.doc("${t.TransactionID}").set({
        "TransactionID":t.TransactionID,
        "Sender":t.Sender,
        "Receiver":t.Receiver,
        "Amount":amount,
        "Date":t.date,
        "Time":t.time,
      }).then((value){
          return true;
      }).catchError((onError){
          return false;
      });

      if(result){
        _transvalue += 1;
        print(_transvalue);
        for(int i=0;i<tobeUpdate.length;i++){
          await collref.doc(tobeUpdate[i]["id"]).update({
             "currentBalance":tobeUpdate[i]["value"],
          });
        }
      }
    return result;
  }

  Future<List<Ts>> FetchTransaction() async{
    List<Ts>loadedTransaction = [];
    await transactionref.get().then((value){
        value.docs.forEach((element) {
            loadedTransaction.add(Ts(TransactionID: element.data()["TransactionID"],Sender: element.data()["Sender"],amount: element.data()["Amount"],Receiver: element.data()["Receiver"],date: element.data()["Date"],time: element.data()["Time"]));
        });
    }).catchError((onError){
        print(onError.toString());
    });
    loadedTransaction = List.from(loadedTransaction.reversed);
     return loadedTransaction;
  }


  void printdata(){
    print("data000");
  }

}