import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:music_app/constants.dart';

class MusicScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MusicScreen',
      theme: ThemeData.dark(),
      home: MyMusicScreen(),
    );
  }
}

class MyMusicScreen extends StatefulWidget {
  @override
  _MyMusicScreenState createState() => _MyMusicScreenState();
}

class _MyMusicScreenState extends State<MyMusicScreen> {
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;

  List<Widget> musicData = [];
  List musicJson=[];

  @override
  void initState() {
    super.initState();
    getData();
    controller.addListener(() {
      double value = controller.offset / 119;

      setState(() {
        topContainer = value;
        closeTopContainer = controller.offset > 50;
      });
    });
  }

  void getData() {
    //musicJson=music_json_data;
    for (int i = 1; i <= 10; i++) {
      musicJson.add(
        {
          "image": "image.png",
          "title": "Music$i",
          "artist": "Artist$i",
        },
      );
    }
    print(musicJson);
    List<dynamic> responseList = musicJson;
    List<Widget> listItems = [];
    responseList.forEach((element) {
      listItems.add(
        Container(
            height: 80,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        CupertinoIcons.double_music_note,
                        size: 50.0,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              element["title"],
                              style: const TextStyle(
                                  fontSize: 28, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              element["artist"],
                              style:
                                  const TextStyle(fontSize: 17, color: Colors.grey),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.play_circle_outline,
                        size: 40.0,
                      ),
                      Icon(
                        Icons.more_vert,
                        size: 40.0,
                      ),
                      // Image.asset(
                      //   "assets/images/${element["image"]}",
                      //   height: double.infinity,
                      // )
                    ],
                  ),
                  SizedBox(height: 7.0,)
                ],
              ),
            )),
      );
    });
    setState(() {
      musicData = listItems;
    });
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.orange,
        appBar: AppBar(centerTitle: true, title: Text('Music Demo')),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 150.0,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30.0,
                        ),
                        ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            controller: controller,
                            padding: EdgeInsets.all(8),
                            physics: BouncingScrollPhysics(),
                            itemCount: musicData.length,
                            itemBuilder: (BuildContext context, int index) {
                              double scale = 1.0;
                              if (topContainer > 0.5) {
                                scale = index + 0.5 - topContainer;
                                if (scale < 0) {
                                  scale = 0;
                                } else if (scale > 1) {
                                  scale = 1;
                                }
                              }
                              return  musicData[index];

                            }),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40.0),
                        topLeft: Radius.circular(40.0),
                      ),
                    ),
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

// return Opacity(
// opacity: scale,
// child: Transform(
// transform: Matrix4.identity()
// ..scale(scale, scale),
// alignment: Alignment.bottomCenter,
// child: Align(
// heightFactor: 0.7,
// alignment: Alignment.topCenter,
// child: musicData[index]),