import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  List<String> categories = ["5 Star", "4 Star", "3 Star", "2 Star", "1 Star"];

  int selectedIndex = 0;
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
                  image: AssetImage('lib/assets/map.jfif'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 330.0),
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
                    child: iconContainer(Icons.location_pin),
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
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
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
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: SizedBox(
                            height: 35,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: categories.length,
                              itemBuilder: (context, index) => GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 35),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        categories[index],
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: selectedIndex == index
                                              ? Colors.black
                                              : Colors.grey,
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 7),
                                        height: 3,
                                        width: 50,
                                        color: selectedIndex == index
                                            ? Colors.deepPurple
                                            : Colors.transparent,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.45,
                          child: ListView(
                            children: [
                              HotelDetail(),
                              HotelDetail(),
                              HotelDetail(),
                              HotelDetail(),
                              SizedBox(
                                height: 30,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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

class HotelDetail extends StatelessWidget {
  const HotelDetail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/DetailPage");
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 18.0),
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.3,
              height: 130,
              decoration: BoxDecoration(
                // color: Colors.blue,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                image: DecorationImage(
                  image: AssetImage('lib/assets/hotel1.jpg'),
                  fit: BoxFit.cover,
                ),
                color: Colors.blue,
              ),
            ),
            SizedBox(width: 20),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/DetailPage");
                    },
                    child: Text("65% Off"),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(150, 30),
                      primary: Colors.deepPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  titleText(
                      "Prime Park Hotel", 18, Colors.black, FontWeight.bold),
                  SizedBox(
                    height: 5,
                  ),
                  titleText("Plot 58, Block C Hotel Motel Zone", 15,
                      Colors.grey, FontWeight.normal),
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
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
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
  return Text(
    title,
    style: TextStyle(
        fontSize: titleSize, color: titleColor, fontWeight: boldRNormal),
  );
}
