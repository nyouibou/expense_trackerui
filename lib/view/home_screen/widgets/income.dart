// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Income extends StatelessWidget {
  const Income({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Icon(
                Icons.arrow_circle_up,
                // color: Colors.white,
              ),
              SizedBox(
                width: 16,
              ),
              Column(
                children: [
                  Text(
                    "Income",
                    style: TextStyle(
                        // color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "₹100000",
                    style: TextStyle(
                        // color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
