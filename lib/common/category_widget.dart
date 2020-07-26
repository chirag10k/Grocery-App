import 'package:flutter/material.dart';
import 'package:groceryshop/screens/home/specific_category_screen.dart';

class CategoryWidget extends StatefulWidget {
  var list;

  CategoryWidget(this.list);

  @override
  _CategoryWidgetState createState() => _CategoryWidgetState(list: list);
}

class _CategoryWidgetState extends State<CategoryWidget> {
  var list;
  bool open = false;

  _CategoryWidgetState({this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: list.length,
      itemBuilder: (context, index){
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 1.0),
          child: ExpansionTile(
            title: Text(
              list[index].title,
              style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w300),
            ),
            children: <Widget>[
              Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: InkWell(
                  onTap: (){
                    Navigator.of(context).push(list[index].route);
                  },
                  child: Row(
                    children: <Widget>[
                      Text("All ${list[index].title}"),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
