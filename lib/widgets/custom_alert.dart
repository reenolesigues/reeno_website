
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void noteAlert(BuildContext context, String msg) {
  Alert(
      title: "Note",
      context: context,
      content: Text(msg, style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12),),
      buttons: [
        DialogButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            "Ok",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ]
  ).show();
}