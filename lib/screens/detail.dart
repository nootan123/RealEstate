import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailPage extends StatefulWidget {
  const DetailPage(
      {Key? key,
      required this.imgURL,
      required this.title,
      required this.detail})
      : super(key: key);
  final String imgURL, title, detail;
  @override
  _DetailPageState createState() => _DetailPageState();
}

double star = 1;

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    print(widget.imgURL);
    return Scaffold(
      body: SizedBox(
        child: Container(
          // height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(widget.imgURL),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
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
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: DraggableScrollableSheet(
                    initialChildSize: 0.5,
                    minChildSize: 0.1,
                    maxChildSize: 0.9,
                    builder: (BuildContext context,
                        ScrollController scrollController) {
                      return Container(
                        height: 40,
                        width: 300,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(50),
                              topLeft: Radius.circular(50),
                            ),
                          ),
                          child: SingleChildScrollView(
                            controller: scrollController,
                            child: Column(
                              children: [
                                SizedBox(
                                  width: 100,
                                  height: 50,
                                  child: ListView(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    children: [
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
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 35.0),
                                  child: SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.7,
                                    child: ListView(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      children: [
                                        SizedBox(height: 20),
                                        Text(
                                          widget.title,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
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
                                              itemPadding: EdgeInsets.symmetric(
                                                  horizontal: 4.0),
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
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              '(53k+ review)',
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          'Address',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
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
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
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
                                        titleText("Description", 20,
                                            Colors.black, FontWeight.bold),
                                        SizedBox(
                                          height: 6,
                                        ),
                                        titleText(widget.detail, 15,
                                            Colors.grey, FontWeight.normal),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              children: [
                                                titleText(
                                                    "Start from",
                                                    15,
                                                    Colors.grey,
                                                    FontWeight.normal),
                                                titleText(
                                                    "\$45.00",
                                                    25,
                                                    Colors.deepPurpleAccent,
                                                    FontWeight.bold)
                                              ],
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.5,
                                              height: 50,
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return AlertDialog(
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(
                                                              Radius.circular(
                                                                  30),
                                                            ),
                                                          ),
                                                          insetPadding:
                                                              EdgeInsets
                                                                  .symmetric(
                                                            horizontal: 20,
                                                            vertical: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.30,
                                                          ),
                                                          content: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    15),
                                                            child: Container(
                                                              height: 800,
                                                              child:
                                                                  SingleChildScrollView(
                                                                child: Column(
                                                                  children: [
                                                                    titleText(
                                                                        "Total Payment",
                                                                        25,
                                                                        Colors
                                                                            .black,
                                                                        FontWeight
                                                                            .bold),
                                                                    titleText(
                                                                        "\$55.00",
                                                                        35,
                                                                        Colors
                                                                            .deepPurpleAccent,
                                                                        FontWeight
                                                                            .bold),
                                                                    Row(
                                                                      children: [
                                                                        Checkbox(
                                                                          value:
                                                                              false,
                                                                          onChanged:
                                                                              (val) {},
                                                                        ),
                                                                        titleText(
                                                                            'I agree to the terms of service',
                                                                            15,
                                                                            Colors.grey,
                                                                            FontWeight.normal)
                                                                      ],
                                                                    ),
                                                                    SizedBox(
                                                                      width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width,
                                                                      child:
                                                                          ElevatedButton(
                                                                        style: ElevatedButton
                                                                            .styleFrom(
                                                                          minimumSize: Size(
                                                                              double.infinity,
                                                                              50),
                                                                          primary: Colors
                                                                              .blueGrey
                                                                              .shade800,
                                                                          shape:
                                                                              RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(10),
                                                                          ),
                                                                        ),
                                                                        onPressed:
                                                                            () {},
                                                                        child:
                                                                            Text(
                                                                          "Confirm",
                                                                          style:
                                                                              TextStyle(fontSize: 20),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      });
                                                },
                                                child: titleText(
                                                    'Rental Now',
                                                    20,
                                                    Colors.white,
                                                    FontWeight.bold),
                                                style: ElevatedButton.styleFrom(
                                                  primary:
                                                      Colors.blueGrey.shade800,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
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
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
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
