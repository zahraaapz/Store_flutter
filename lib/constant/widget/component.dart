  import 'package:appstore/controller/homeScreenController.dart';
import 'package:flutter/material.dart';
import '../color/color.dart';

// ButtonStyle buttonModel() {
//     return ButtonStyle(
//                 backgroundColor: const MaterialStatePropertyAll(Rang.blue),
//                 shape: MaterialStateProperty.all(RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(15))));
//   }

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
                padding: const EdgeInsets.all(8.0),
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
  labelSmall: TextStyle(
       fontFamily: 'Auliare',
       fontSize: 12,
       color: Colors.black, 
fontWeight: FontWeight.bold
) ,
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
,

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

 class ButtonWidget extends StatelessWidget {
 const ButtonWidget({
    super.key,
    this.homeScreenController,
    this.onPressed,
    this.title,
    this.iconData,
  });

 final HomeScreenController?  homeScreenController;
 final  String? title;
 final  void Function()? onPressed;
 final  IconData? iconData;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty
                .all(RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius
                            .circular(10))),
            backgroundColor:
                MaterialStateProperty.all(
                    Rang.blue)),
        onPressed: onPressed,
        child:  SizedBox(
          width: 270,
          height: 50,
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.center,
            children: [
             Icon(iconData,color: Colors.white,),
              Text(title!,style: textStyle.headlineLarge,)
            ],
          ),
        ));
  }}

  class ButtonWidgetRevesed extends StatelessWidget {
  const ButtonWidgetRevesed({
    super.key,
    this.title,
    this.onPressed,
    this.iconData
  });
final String? title;
 final Function()? onPressed;
  final  IconData? iconData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 60,
      child: ElevatedButton(
        onPressed: onPressed,
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        side: MaterialStateProperty.all(
                            const BorderSide(color: Rang.blue, width: 1.5)),
                        backgroundColor:
                            MaterialStateProperty.resolveWith((states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Rang.blue;
                          }
                          return Colors.white;
                        })),
                 
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(iconData,color: Rang.blue,),
                        Text(
                         title!,
                         style: textStyle.displaySmall,
                        ),
                      ],
                    )),
    );
  }
}
