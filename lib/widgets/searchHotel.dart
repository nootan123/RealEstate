import 'package:flutter/material.dart';
import 'package:realestate/screens/detail.dart';

Widget SearchHotelDetail(
    BuildContext context, String imgURL, String title, String detail) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailPage(
            imgURL: imgURL,
            title: title,
            detail: detail,
          ),
        ),
      );
    },
    child: Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.3,
              height: 115,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                image: DecorationImage(
                  image: AssetImage(imgURL),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10, top: 10, bottom: 20),
              // width: MediaQuery.of(context).size.width * 0.57,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  titleText(title, 18, Colors.black, FontWeight.bold),
                  SizedBox(
                    height: 5,
                  ),
                  titleText(detail, 12, Colors.grey, FontWeight.normal),
                  Row(
                    children: [
                      iconCount(Icons.bed, "4"),
                      SizedBox(
                        width: 10,
                      ),
                      iconCount(Icons.pool, "1"),
                      SizedBox(
                        width: 10,
                      ),
                      iconCount(Icons.hot_tub, "1"),
                    ],
                  ),
                  titleText(
                      "from \$32/month", 15, Colors.black, FontWeight.bold),
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}

Widget iconCount(IconData icon, String itemNumber) {
  return Row(
    children: [
      Icon(
        icon,
        color: Colors.grey,
      ),
      SizedBox(
        width: 5,
      ),
      Text(
        itemNumber,
        style: TextStyle(color: Colors.grey),
      )
    ],
  );
}

Widget iconContainer(IconData icon) {
  return Container(
    height: 45,
    width: 50,
    decoration: BoxDecoration(
      color: Colors.blueGrey.shade800,
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
    ),
    child: Icon(icon, color: Colors.white, size: 33),
  );
}

Widget titleText(
    String title, double titleSize, Color titleColor, FontWeight boldRNormal) {
  return Container(
    width: 220,
    child: Text(
      title,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      style: TextStyle(
          fontSize: titleSize, color: titleColor, fontWeight: boldRNormal),
    ),
  );
}
