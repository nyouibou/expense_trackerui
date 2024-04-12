// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker/controller/homescreencontrolle.dart';
import 'package:expense_tracker/view/addamount/addamount.dart';
import 'package:expense_tracker/view/home_screen/widgets/income.dart';
import 'package:expense_tracker/view/home_screen/widgets/total_in_ex_container.dart';
import 'package:expense_tracker/view/home_screen/widgets/trancaction_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var collection = FirebaseFirestore.instance.collection("transaction");
  HomeScreenController controller = HomeScreenController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(10))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Balance",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  "₹10000",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Income(),
                    SizedBox(
                      width: 16,
                    ),
                    TotalExInContainer(),
                  ],
                )
              ],
            ),
          ),
          Expanded(
              child: StreamBuilder(
            stream: collection.orderBy("date").snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    controller.calculate(snapshot.data!.docs);
                    DocumentSnapshot transactionData =
                        snapshot.data!.docs[index];
                    return TransactionCard(
                      transactionData: transactionData,
                    );
                  },
                );
              } else {
                return CircularProgressIndicator();
              }
            },
          ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddAmountScreen(),
              ));
        },
      ),
    );
  }
}
