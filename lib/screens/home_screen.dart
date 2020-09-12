import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';
import '../icon_content.dart';
import '../reusable_card.dart';
import 'music_screen2.dart';

class Home extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      title: 'Music App Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Music Demo')),
      body: SingleChildScrollView(
        child: Container(
          height: 1500,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(10.0, 10.0, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: TextField(
                          decoration: kTextFieldDecoration.copyWith(
                              hintText: 'search your music')),
                    ),
                    IconButton(icon: Icon(Icons.search))
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          buildGestureDetector(text: 'MusicList1', height: 200.0),
                          buildGestureDetector(text: 'MusicList3', height: 400.0),
                          buildGestureDetector(text: 'MusicList5', height: 300.0),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          buildGestureDetector(text: 'MusicList2', height: 300.0),
                          buildGestureDetector(text: 'MusicList4', height: 400.0),
                          buildGestureDetector(text: 'MusicList6', height: 200.0),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector buildGestureDetector({String text, double height}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MusicScreen2(
              ),
            ),
          );
        });
      },
      child: ReuseableCard(
        height: height,
        colour: Colors.indigoAccent,
        cardChild: IconContent(icon: CupertinoIcons.music_note, label: text),
      ),
    );
  }
}
