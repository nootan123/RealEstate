import 'package:flutter/material.dart';
import 'dart:math' as math;



class AppBarwid extends StatefulWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(70);
  @override
  _AppBarwidState createState() => _AppBarwidState();
}

class _AppBarwidState extends State<AppBarwid> {
  var selectedRange = RangeValues(100.00, 540.00);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.grey[50],
      automaticallyImplyLeading: false,
      elevation: 0,
      title: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              image: DecorationImage(
                  image: AssetImage(
                    'lib/assets/profile.jpg',
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "My location",
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                  InkWell(
                    child: Container(
                      child: Icon(
                        Icons.expand_more,
                        size: 25,
                        color: Colors.black,
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/MapScreen');
                    },
                  ),
                ],
              ),
              Text(
                "Cox's Bazar, BD",
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ],
          )
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.notifications_none,
            size: 30,
            color: Colors.black,
          ),
        ),
        SizedBox(
          width: 40,
        ),
        Transform(
          transform: Matrix4.rotationY(math.pi),
          child: Icon(
            Icons.sort_rounded,
            size: 30,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

Widget boldText(String title) {
  return Text(
    title,
    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  );
}
