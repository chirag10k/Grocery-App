import 'package:flutter/material.dart';

Color backgroundColor = Color(0xFFedf2f2);

BoxDecoration profileIconDecoration =  BoxDecoration(
  borderRadius: BorderRadius.circular(30),
  color: primaryColor1,
  boxShadow: [
    BoxShadow(
        color: primaryColor1,
        blurRadius: 5.0,
        offset: Offset(2,1)
    ),
    BoxShadow(
        color: primaryColor1,
        blurRadius: 5.0,
        offset: Offset(-2,-1)
    )
  ],
);

BoxDecoration addExpenseButtonDecoration = BoxDecoration(
    color: primaryColor1,
    boxShadow: [
      BoxShadow(
          color: primaryColor2,
          blurRadius: 2.0,
          offset: Offset(2,1)
      ),
      BoxShadow(
          color: primaryColor2,
          blurRadius: 5.0,
          offset: Offset(-2,-1)
      )
    ],
    borderRadius: BorderRadius.circular(10.0)
);

TextStyle formFieldTitleTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 40.0,
  fontWeight: FontWeight.bold,
);

InputDecoration formFieldDecoration = InputDecoration(
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.white,
    ),
  ),
);

Color primaryColor1 = Color(0xFF004e92);
Color primaryColor2 = Color(0xFF000428);

//Background gradient decoration for pages
BoxDecoration backgroundGradient = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      primaryColor1,
      primaryColor2,
    ],
  ),
);

RoundedRectangleBorder chipShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(20.0),
);

BoxDecoration addCategoryChipDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(20.0),
    gradient: LinearGradient(
      colors: [
        Colors.purple,
        Colors.pinkAccent,
      ],
    )
);

List<Color> colorsList = [
  Colors.pink[200],
  Colors.blue[200],
  Colors.cyan[200],
  Colors.lightGreen[200],
  Colors.redAccent[100],
  Colors.indigo[200],
  Colors.purple[200],
  Colors.orange[200],
  Colors.yellow[200],
  Colors.red[200],
  Colors.deepOrange[200],
  Colors.pinkAccent[100],
  Colors.teal[200],
  Colors.deepOrangeAccent[100]
];

TextStyle normalHeadingStyle = TextStyle(
  fontSize: 30,
  color: Colors.black,
  fontWeight: FontWeight.w300,
);

TextStyle boldHeadingStyle = TextStyle(
  fontSize: 30,
  color: Colors.black,
  fontWeight: FontWeight.w600,
);
