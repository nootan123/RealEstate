import 'package:flutter/material.dart';
import 'package:realestate/screens/detail.dart';
import 'package:realestate/service/hotList.dart';
import 'package:realestate/service/lists.dart';

class CategoryHouse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      width: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
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
                          maxLines: 2,
                          overflow: TextOverflow.fade,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 200,
                          child: Text(
                            hotels[index].detail,
                            overflow: TextOverflow.fade,
                            maxLines: 2,
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailPage(
                                      imgURL: hotels[index].imgURL,
                                      title: hotels[index].title,
                                      detail: hotels[index].detail,
                                    ),
                                  ),
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
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DetailPage(
                                          imgURL: hotels[index].imgURL,
                                          title: hotels[index].title,
                                          detail: hotels[index].detail,
                                        ),
                                      ),
                                    );
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(
                    imgURL: hotels[index].imgURL,
                    title: hotels[index].title,
                    detail: hotels[index].detail,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
