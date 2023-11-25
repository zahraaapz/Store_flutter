import 'package:flutter/material.dart';

massageSnackbar(String title, context) {
  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      backgroundColor: Color.fromARGB(204, 27, 75, 102),
      content: SizedBox(
        height: 60,
        child: Center(
          child: Text(
            'Enter information',
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontFamily: 'Auliare'),
          ),
        ),
      )));
}