  import 'package:flutter/material.dart';

import '../color/color.dart';

ButtonStyle buttonModel() {
    return ButtonStyle(
                backgroundColor: const MaterialStatePropertyAll(Rang.blue),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))));
  }

    Text contentEmptyPages(String title) {
    return Text(
           title,
            textAlign: TextAlign.center,
            style: textStyle.bodyMedium,
            strutStyle: const StrutStyle(height: 2),
          );
  }

    Text titleEmtypage(String title) {
    return Text(
            title,
            style: textStyle.headlineSmall,
          );
  }

    Padding iconANDtitle(String title,IconData icon) {
    return Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(children: [
                  Icon(
                    icon,
                    color: Rang.blue,
                    size: 30,
                  ),
                  const SizedBox(width: 20),
                  Text(
                    title,
                    style:textStyle.displaySmall,
                  )
                ]),
              );
  }

 TextTheme textStyle=const TextTheme(
  displaySmall: TextStyle(
     fontFamily: 'Auliare',
       fontSize: 17,
       color: Rang.blue, 
       fontWeight: FontWeight.bold

  ),
    headlineSmall: TextStyle(
       fontFamily: 'Auliare',
       fontSize: 20,
       color: Rang.blue, 
       fontWeight: FontWeight.bold
       
 ),
headlineMedium: TextStyle(
       fontFamily: 'Auliare',
       fontSize: 17,
       color: Colors.black, 
fontWeight: FontWeight.bold
),
headlineLarge:  TextStyle(
       fontFamily: 'Auliare',
       fontSize: 14,
       color: Colors.white, 
fontWeight: FontWeight.bold

),
bodyMedium:  TextStyle(
       fontFamily: 'Auliare',
       fontSize: 14,
       color: Colors.black, 
fontWeight: FontWeight.bold

),  
bodyLarge:  TextStyle(
       fontFamily: 'Auliare',
       fontSize: 14,
       color: Rang.blue, 
fontWeight: FontWeight.bold

),
bodySmall:  TextStyle(
       fontFamily: 'Auliare',
       fontSize: 14,
       color: Rang.greylight, 
fontWeight: FontWeight.bold

),


 ); 