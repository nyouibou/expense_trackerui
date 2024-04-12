import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  num balance = 0;
  num income = 0;
  num expense = 0;
  // var collection = FirebaseFirestore.instance.collection("transaction");
  calculate(List<QueryDocumentSnapshot> entireData) {
    income = 0;
    expense = 0;
    var incomeList =
        entireData.where((element) => element["type"] == "income").toList();
    var expenseList =
        entireData.where((element) => element["type"] == "income").toList();
    log(incomeList.length.toString());
    log(expenseList.length.toString());
  }
}
