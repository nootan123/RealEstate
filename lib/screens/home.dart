import 'package:flutter/material.dart';

import 'package:flutter/rendering.dart';
import 'package:realestate/screens/mapScreen.dart';
import 'package:realestate/service/lists.dart';
import 'package:realestate/widgets/appBar.dart';
import 'package:realestate/widgets/mainCatHouse.dart';
import 'package:realestate/widgets/offerBanner.dart';
import 'package:realestate/widgets/searchHotel.dart';
import 'package:realestate/widgets/searchWithIcons.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

bool activeSearch = false;
String swipeDirection = '';

List<String> categories = ["1 Star", "2 Star", "3 Star", "4 Star", "5 Star"];

int selectedIndex = 0;

ScrollController _scrollController = new ScrollController();

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    // ScrollController _scrollController = new ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBarwid(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: new BoxDecoration(
                          borderRadius:
                              new BorderRadius.all(new Radius.circular(10.0)),
                          color: Colors.grey[200]),
                      child: Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Icon(
                              Icons.search,
                              size: 23,
                              color: Colors.black,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 160,
                            child: TextFormField(
                              onTap: () {
                                setState(() {
                                  activeSearch = true;
                                });
                              },
                              decoration: InputDecoration(
                                prefix: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                ),
                                hintText: 'Search Your Hotels',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          (activeSearch == true)
                              ? Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: CircleAvatar(
                                    radius: 10,
                                    backgroundColor: Colors.white,
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          activeSearch = false;
                                          FocusScope.of(context)
                                              .requestFocus(FocusNode());
                                        });
                                      },
                                      child: Icon(
                                        Icons.clear,
                                        size: 20,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                )
                              : Container(
                                  width: 22,
                                ),
                        ],
                      ),
                    ),
                    showModal(),
                  ],
                ),
                activeSearch == false
                    ? Column(
                        children: [
                          SizedBox(height: 20),
                          OfferBanner(),
                          MainCatHouse(),
                          //
                          //list by star
                          //
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
                                    padding:
                                        EdgeInsets.only(right: width * 0.1),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
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
                              swipeDirection =
                                  details.delta.dx < 0 ? 'left' : 'right';
                            },
                            onPanEnd: (details) {
                              // Swiping in right direction.
                              if (swipeDirection == 'right' &&
                                  selectedIndex > 0) {
                                setState(() {
                                  selectedIndex--;
                                  _scrollController.animateTo(
                                      width * 0.25 * selectedIndex,
                                      duration: new Duration(seconds: 2),
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
                              height: MediaQuery.of(context).size.height * 0.6,
                              child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: hotels.length,
                                itemBuilder: (context, index) {
                                  if (hotels[index].star == selectedIndex + 1) {
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
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 30),
                          titleText("Result For Cox's Bazar", 20, Colors.black,
                              FontWeight.bold),
                          SizedBox(height: 30),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.75,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 18.0),
                              child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: hotels.length,
                                itemBuilder: (context, index) {
                                  return SearchHotelDetail(
                                      context,
                                      hotels[index].imgURL,
                                      hotels[index].title,
                                      hotels[index].detail);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget titleText(
    String title, double titleSize, Color titleColor, FontWeight boldRNormal) {
  return Text(
    title,
    style: TextStyle(
        fontSize: titleSize, color: titleColor, fontWeight: boldRNormal),
  );
}

//
//
// Modal
class showModal extends StatefulWidget {
  const showModal({Key? key}) : super(key: key);

  @override
  _showModalState createState() => _showModalState();
}

var selectedRange = RangeValues(540, 700);

class _showModalState extends State<showModal> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return RotatedBox(
      quarterTurns: 3,
      child: IconButton(
          icon: Icon(Icons.tune_outlined, size: 25),
          onPressed: () {
            showModalBottomSheet(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40),
                  ),
                ),
                context: context,
                builder: (context) {
                  return StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                    return SizedBox(
                      height: height * 0.8,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
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
                            Container(
                              height: height * 0.5,
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 20,
                                    ),
                                    boldText('Search your location'),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    searchWithIcons(
                                        context,
                                        Icons.pin_drop_outlined,
                                        Icons.expand_more,
                                        'Yogyakarta, ID'),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    boldText("Type of house"),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    searchWithIcons(
                                        context,
                                        Icons.home_outlined,
                                        Icons.expand_more,
                                        'Type of house'),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    boldText('Filter my price'),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    SliderTheme(
                                      data: SliderThemeData(
                                        thumbShape: RoundSliderThumbShape(
                                            enabledThumbRadius: 20),
                                      ),
                                      child: RangeSlider(
                                        values: selectedRange,
                                        onChanged: (RangeValues newRange) {
                                          setState(() {
                                            selectedRange = newRange;
                                          });
                                        },
                                        min: 0.0,
                                        max: 900.0,
                                        divisions: 5,
                                        labels: RangeLabels(
                                            '\$${selectedRange.start.toString()} ',
                                            '\$${selectedRange.end}'),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        minimumSize: Size(double.infinity, 50),
                                        primary: Colors.blueGrey.shade800,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: Text(
                                        "Confirm",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                    // SizedBox(
                                    //   height: 30,
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
                });
          }),
    );
  }
}
