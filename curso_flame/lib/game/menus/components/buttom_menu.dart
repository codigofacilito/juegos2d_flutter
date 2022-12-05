import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonMenu extends StatelessWidget{
  String title;
  IconData icon;
  var onPressed;
  ButtonMenu(this.title,this.icon,this.onPressed);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(padding: const EdgeInsets.symmetric(vertical: 5),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30))
        ),
        backgroundColor: Colors.pink
      ),
      onPressed: ()=>onPressed(),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(padding: const EdgeInsets.only(right: 10),child: Icon(icon),),
        Text(title,style: TextStyle(
          fontSize: 20,
          color: Colors.white
        ),)
        ],
      ),
    ),);
  }

}