import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

double star = 1;

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.53,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/assets/hotel2.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 58.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Container(
                      height: 45,
                      width: 50,
                      decoration: new BoxDecoration(
                        borderRadius:
                            new BorderRadius.all(new Radius.circular(10.0)),
                        color: Colors.blueGrey.shade800,
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(width: 80,),
                  Padding(
                    padding: const EdgeInsets.only(right: 18.0),
                    child: Text(
                      "2/21",
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: 450,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    topLeft: Radius.circular(50),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      Center(
                        child: SizedBox(
                          width: 70,
                          child: Container(
                            height: 6,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "Jol Torongo",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Row(
                        children: [
                          RatingBar.builder(
                            initialRating: 1,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              setState(() {
                                star = rating;
                              });
                            },
                          ),
                          Text(
                            '$star',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '(53k+ review)',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Address',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Laboni Beach, Cox's Bazar ",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        "01769-107011",
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Facilities',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Row(
                        children: [
                          iconContainer(Icons.wifi),
                          SizedBox(width: 10),
                          iconContainer(Icons.hot_tub_sharp),
                          SizedBox(width: 10),
                          iconContainer(Icons.tv),
                          SizedBox(width: 10),
                          iconContainer(Icons.coffee),
                          SizedBox(width: 10),
                          iconContainer(Icons.shower)
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      titleText(
                          "Description", 20, Colors.black, FontWeight.bold),
                      SizedBox(
                        height: 6,
                      ),
                      titleText(
                          "ProcessProfilingInfo new_methods=446 is saved saved_to_disk=1 resolve_classes_delay=8000",
                          15,
                          Colors.grey,
                          FontWeight.normal),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              titleText("Start from", 15, Colors.grey,
                                  FontWeight.normal),
                              titleText("\$45.00", 25, Colors.deepPurpleAccent,
                                  FontWeight.bold)
                            ],
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(30),
                                          ),
                                        ),
                                        insetPadding: EdgeInsets.symmetric(
                                          horizontal: 20,
                                          vertical: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.30,
                                        ),
                                        content: Padding(
                                          padding: EdgeInsets.all(15),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              children: [
                                                titleText(
                                                    "Total Payment",
                                                    25,
                                                    Colors.black,
                                                    FontWeight.bold),
                                                titleText(
                                                    "\$55.00",
                                                    35,
                                                    Colors.deepPurpleAccent,
                                                    FontWeight.bold),
                                                Row(
                                                  children: [
                                                    Checkbox(
                                                      value: false,
                                                      onChanged: (val) {},
                                                    ),
                                                    titleText(
                                                        'I agree to the terms of service',
                                                        15,
                                                        Colors.grey,
                                                        FontWeight.normal)
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  child: ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      minimumSize: Size(
                                                          double.infinity, 50),
                                                      primary: Colors
                                                          .blueGrey.shade800,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                    ),
                                                    onPressed: () {},
                                                    child: Text(
                                                      "Confirm",
                                                      style: TextStyle(
                                                          fontSize: 20),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    });
                              },
                              child: titleText('Rental Now', 20, Colors.white,
                                  FontWeight.bold),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blueGrey.shade800,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget iconContainer(IconData icon) {
  return Container(
    width: 50,
    height: 50,
    decoration: BoxDecoration(
      color: Colors.deepPurpleAccent,
      borderRadius: BorderRadius.all(
        Radius.circular(5),
      ),
    ),
    child: Icon(icon, color: Colors.white, size: 33),
  );
}

Widget titleText(
    String title, double titleSize, Color titleColor, FontWeight boldRNormal) {
  return Text(
    title,
    style: TextStyle(
        fontSize: titleSize, color: titleColor, fontWeight: boldRNormal),
  );
}
