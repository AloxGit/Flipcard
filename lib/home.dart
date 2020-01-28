import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:page_transition/page_transition.dart';
import 'second.dart';
import 'global.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  Widget fCard(index){
    if(index%4==0){
      return new Card(
        color: isSelected[index] ? Colors.white70 : Colors.white,
        elevation: 3.0,
        child: new Container(
          alignment: Alignment.center,
          child: new Text(' ${cnum[(index~/4)]}\n❤',
            style: TextStyle(fontSize: 22),),
        ),
      );
    }

    if(index%4==1) {
      return new Card(
        color: isSelected[index] ? Colors.white70 : Colors.white,
        elevation: 3.0,
        child: new Container(
          alignment: Alignment.center,
          child: new Text(' ${cnum[(index~/4)]}\n♦',
            style: TextStyle(fontSize: 22),),
        ),
      );
    }

    if(index%4==2) {
      return new Card(
        color: isSelected[index] ? Colors.white70 : Colors.white,
        elevation: 3.0,
        child: new Container(
          alignment: Alignment.center,
          child: new Text(' ${cnum[(index~/4)]}\n♠',
            style: TextStyle(fontSize: 22),),
        ),
      );
    }

    else {
      return new Card(
        color: isSelected[index] ? Colors.white70 : Colors.white,
        elevation: 3.0,
        child: new Container(
          alignment: Alignment.center,
          child: new Text(' ${cnum[(index~/4)]}\n♣',
            style: TextStyle(fontSize: 22),),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget gridViewSelection = GridView.builder(
        physics: const AlwaysScrollableScrollPhysics (),
        itemCount: 52,
        gridDelegate:
        new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, childAspectRatio: 0.7),
        itemBuilder: (BuildContext context, index) {
          return new GestureDetector(
            child: fCard(index),


            onTap: () {
              setState(() {
                if (isSelected[index] == false) {
                  isSelected[index] = true;
                  five.add(index);
                  cnt++;
                  print("Item Selected");
                } else {
                  isSelected[index] = false;
                  five.remove(index);
                  cnt--;
                  print("Item UnSelected");
                }
              });


              if(cnt==5) {
                five.add(100);
                debugPrint('lenght is ${five.length}');
                //Navigator.pop(context);
                Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: Second()));
              }
            },
          );
        });

    Widget overBody() {
      return NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 150.0,
              backgroundColor: Colors.teal,
              floating: true,
              //pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text("Choose any five\ncards",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontFamily: 'GoogleSans')
                  ),
                background: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      //stops: [0.5, 1],
                      colors: [Colors.lightBlueAccent, Colors.teal]
                    )
                  ),
                )
              ),
            ),
          ];
        },
        body: Container(

          padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
          color: Colors.teal,
          child: gridViewSelection,
        ),
      );
    }

    return Scaffold(
      body: overBody(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text('$cnt cards'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

