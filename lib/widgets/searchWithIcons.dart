import 'package:flutter/material.dart';

Widget searchWithIcons(BuildContext context, IconData leading,
    IconData trailing, String hintText) {
  return Container(
    decoration:  BoxDecoration(
        borderRadius:  BorderRadius.all( Radius.circular(10.0)),
        color: Colors.grey[200]),
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Icon(
            leading,
            size: 23,
            color: Colors.black,
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width - 120,
          child: TextFormField(
            decoration: InputDecoration(
              prefix: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
              ),
              hintText: hintText,
              border: InputBorder.none,
            ),
          ),
        ),
        CircleAvatar(
          radius: 15,
          backgroundColor: Colors.white,
          child: Icon(
            trailing,
            size: 23,
            color: Colors.black,
          ),
        ),
      ],
    ),
  );
}
