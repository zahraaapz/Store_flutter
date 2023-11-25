import 'package:flutter/material.dart';

import '../component/text_style.dart';

Text contentEmptyPages(String title) {
  return Text(
    title,
    textAlign: TextAlign.center,
    style: textStyle.bodyMedium,
    strutStyle: const StrutStyle(height: 2),
  );
}