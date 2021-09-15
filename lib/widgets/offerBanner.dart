import 'package:flutter/material.dart';
import 'package:realestate/screens/detail.dart';
import 'package:realestate/service/lists.dart';

class OfferBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(
              imgURL: hotels[1].imgURL,
              title: hotels[0].title,
              detail: hotels[0].detail,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          color: Colors.blueAccent,
          image: DecorationImage(
            image: AssetImage(hotels[0].imgURL),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 15),
        height: 170,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Enjoy your weekends with family | Special offer|",
              style: TextStyle(
                fontSize: 17,
                color: Colors.white,
              ),
            ),
            Text(
              "50% off",
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
