import 'package:flutter/material.dart';
class User {
  final String name;
  final String AccountNumber;
  final String IFSCCODE;
  final String phoneNumber;
  final String Email;
  final double current_balance;
  final String imageurl;
  final String customerID;

  User({
    @required this.AccountNumber,
    @required this.IFSCCODE,
    @required this.phoneNumber,
    @required this.Email,
    @required this.name,
    @required this.imageurl,
    @required this.current_balance,
    this.customerID = "",
  });

}
