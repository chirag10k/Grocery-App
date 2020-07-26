import 'package:flutter/material.dart';
import 'package:groceryshop/models/offer_model.dart';
import 'package:groceryshop/shared/constants.dart';

class OffersScreen extends StatelessWidget {

  Color cardThemeColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: <Widget>[
            Container(
              height: 100,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back,),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Text(
                    'Offers/Promotions',
                    style: normalHeadingStyle,
                  ),
                ],
              ),
            ),
            (offerList.length > 0)
                ? ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: offerList.length,
              itemBuilder: (context, index) {
                cardThemeColor = colorsList[offerList.indexOf(offerList[index])];
                return Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(vertical: 1),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                    color: cardThemeColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              offerList[index].description,
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      RichText(
                        text: TextSpan(
                          text: 'PROMOCODE: ${offerList[index].promoCode}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: '\nValidity: ${offerList[index].validity}',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            )
                : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.play_circle_filled),
                SizedBox(width: 20,),
                Text('No Offers available yet', style: boldHeadingStyle,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
