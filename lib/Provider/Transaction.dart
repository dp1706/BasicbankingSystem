import 'package:flutter/material.dart';

class Ts{
  final Map<String,dynamic> Sender;
  final Map<String,dynamic> Receiver;
  final String date;
  final String time;
  final double amount;
  final String TransactionID;

  Ts({
    @required this.Sender,
    @required this.Receiver,
    @required this.date,
    @required this.time,
    @required this.amount,
    this.TransactionID = "",
  });
}