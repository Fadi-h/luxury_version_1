import 'package:flutter/material.dart';
import 'package:luxury_version_1/helper/app.dart';

class HomeDescription {

  static description(BuildContext context) {
    return Scrollbar(
      child: Column(
        children: [
          Container(
            width: App.getDeviceWidthPercent(60, context),
            child: Text("Luxury Rent a Car Dubai",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                color: App.field,
                fontWeight: FontWeight.bold
              ),
            )
          ),

        ],
      ),
    );
  }
}