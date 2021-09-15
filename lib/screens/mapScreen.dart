import 'package:flutter/material.dart';
import 'package:realestate/screens/detail.dart';
import 'package:realestate/service/lists.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  ScrollController _scrollController = new ScrollController();
  List<String> categories = ["5 Star", "4 Star", "3 Star", "2 Star", "1 Star"];
  String swipeDirection = '';

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SizedBox(
        child: Container(
          // height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/assets/map.jfif'),
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
                    initialChildSize: 0.6,
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
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 35.0),
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
                                  ///////////
                                  ///
                                  ///
                                  //
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: SizedBox(
                                      height: 35,
                                      // width: MediaQuery.of(context).size.width,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: categories.length,
                                        itemBuilder: (context, index) =>
                                            GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              selectedIndex = index;
                                            });
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                right: width * 0.1),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: <Widget>[
                                                Text(
                                                  categories[index],
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                    color:
                                                        selectedIndex == index
                                                            ? Colors.black
                                                            : Colors.grey,
                                                  ),
                                                ),
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(top: 7),
                                                  height: 3,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.1,
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
                                  // hotel list according to stars
                                  GestureDetector(
                                    onPanUpdate: (details) {
                                      swipeDirection = details.delta.dx < 0
                                          ? 'left'
                                          : 'right';
                                    },
                                    onPanEnd: (details) {
                                      // Swiping in right direction.
                                      if (swipeDirection == 'right' &&
                                          selectedIndex > 0) {
                                        setState(() {
                                          selectedIndex--;
                                          _scrollController.animateTo(
                                              width * 0.25 * selectedIndex,
                                              duration:
                                                  new Duration(seconds: 2),
                                              curve: Curves.ease);
                                          print(selectedIndex);
                                        });
                                      }

                                      // Swiping in left direction.
                                      if (swipeDirection == 'left' &&
                                          selectedIndex < 4) {
                                        setState(() {
                                          selectedIndex++;
                                          print(selectedIndex);
                                        });
                                      }
                                    },
                                    child: SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.6,
                                      child: ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        itemCount: hotels.length,
                                        itemBuilder: (context, index) {
                                          if (hotels[index].star ==
                                              selectedIndex + 1) {
                                            return HotelDetail(
                                                context,
                                                hotels[index].imgURL,
                                                hotels[index].title,
                                                hotels[index].detail);
                                          } else
                                            return Container();
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
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

Widget HotelDetail(
    BuildContext context, String imgURL, String title, String subtitle) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailPage(
            imgURL: imgURL,
            title: title,
            detail: subtitle,
          ),
        ),
      );
    },
    child: Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.26,
            height: 130,
            decoration: BoxDecoration(
              // color: Colors.blue,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              image: DecorationImage(
                image: AssetImage(imgURL),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(
                          imgURL: imgURL,
                          title: title,
                          detail: subtitle,
                        ),
                      ),
                    );
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
                titleText(title, 18, Colors.black, FontWeight.bold),
                SizedBox(
                  height: 5,
                ),
                titleText(subtitle, 15, Colors.grey, FontWeight.normal),
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
  return SizedBox(
    width: 200,
    child: Text(
      title,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      style: TextStyle(
          fontSize: titleSize, color: titleColor, fontWeight: boldRNormal),
    ),
  );
}
