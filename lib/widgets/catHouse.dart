import 'package:flutter/material.dart';
import 'package:realestate/screens/detail.dart';

class CategoryHouse extends StatelessWidget {
  List<HotelList> hotels = [
    HotelList(
        title: "Modern",
        detail: "More than 504,326 House waiting for your rent or buy",
        imgURL: "lib/assets/hotel1.jpg"),
    HotelList(
        title: "Classic",
        detail: "This is detail for classic han 504,326 House waiting ",
        imgURL: "lib/assets/hotel2.jpg"),
    HotelList(
        title: "Other",
        detail: "This is detail for classic han 504,326 House waiting ",
        imgURL: "lib/assets/hotel3.jpg"),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      width: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: hotels.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  Container(
                    width: 200,
                    height: 150,
                    decoration: BoxDecoration(
                      // color: Colors.blue,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      image: DecorationImage(
                        image: AssetImage(hotels[index].imgURL),
                        fit: BoxFit.cover,
                      ),
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          hotels[index].title,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          hotels[index].detail,
                          style: TextStyle(color: Colors.grey),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  '/DetailPage',
                                );
                              },
                              child: Text('from \$30/month'),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blueGrey.shade800,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            Center(
                              child: Container(
                                height: 35,
                                width: 40,
                                decoration: new BoxDecoration(
                                    borderRadius: new BorderRadius.all(
                                        new Radius.circular(10.0)),
                                    color: Colors.grey[200]),
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/DetailPage');
                                  },
                                  icon: Icon(
                                    Icons.arrow_forward,
                                    color: Colors.deepPurpleAccent,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/DetailPage');
            },
          );
        },
      ),
    );
  }
}

class HotelList {
  String title;
  String detail;
  String imgURL;
  HotelList({required this.title, required this.detail, required this.imgURL});
}
