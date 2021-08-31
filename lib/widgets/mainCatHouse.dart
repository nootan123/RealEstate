import 'package:flutter/material.dart';
import 'package:realestate/widgets/catHouse.dart';

class MainCatHouse extends StatefulWidget {
  @override
  _MainCatHouseState createState() => _MainCatHouseState();
}

class _MainCatHouseState extends State<MainCatHouse> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Category",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_horiz_outlined, size: 30),
              ),
            ],
          ),
          SizedBox(
            height: 280,
            width: MediaQuery.of(context).size.width,
            child: CategoryHouse(),
          )
        ],
      ),
    );
  }
}
