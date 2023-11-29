import 'package:flutter/material.dart';

extension SizedBoxExtention on double{

  SizedBox  get width=>SizedBox(width:toDouble());
  SizedBox  get height=>SizedBox(height:toDouble());



}