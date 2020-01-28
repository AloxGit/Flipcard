import 'package:flutter/material.dart';
import 'global.dart';

class FinalScreen extends StatelessWidget {

  Widget fCard(index) {
    if(index==53) {
      return new Card(
        elevation: 3.0,
        child: new Container(
          padding: EdgeInsets.all(3.0),
          alignment: Alignment.center,
          child: AspectRatio(
            aspectRatio: 0.67,
            child: Image(
              image: AssetImage('images/backcard.png'),
              fit: BoxFit.fill, // use this
            ),
          ),
        ),
      );
    }

    else {
      if (index % 4 == 0) {
        return new Card(
          elevation: 3.0,
          child: new Container(
            alignment: Alignment.center,
            child: new Text(' ${cnum[(index~/4)]}\n❤',
              style: TextStyle(fontSize: 22),),
          ),
        );
      }

      if (index % 4 == 1) {
        return new Card(
          elevation: 3.0,
          child: new Container(
            alignment: Alignment.center,
            child: new Text(' ${cnum[(index~/4)]}\n♦',
              style: TextStyle(fontSize: 22),),
          ),
        );
      }

      if (index % 4 == 2) {
        return new Card(
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
          elevation: 3.0,
          child: new Container(
            alignment: Alignment.center,
            child: new Text(' ${cnum[(index~/4)]}\n♣',
              style: TextStyle(fontSize: 22),),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        Navigator.pop(context);
        //Navigator.pop(context);
        return null;
      },
      child: Scaffold(
//      appBar: AppBar(
//        title: Text('hello'),
//      ),
          body: Container(
            padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    //stops: [1, 1],
                    colors: [Color(0xff4facfe), Color(0xff00f2fe)]
                )
            ),
            child: Column(
              children: <Widget>[
                FlatButton(
                  color: Colors.transparent,
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),
                Container(
                  alignment: Alignment.center,
                  height: 230,
                  child: Text("Show this",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'GoogleSans',
                      )
                  ),
                ),
                Container(
                  //height: 500,
                    child: GridView.builder(
                        shrinkWrap: true,
                        itemCount: 5,
                        gridDelegate:
                        new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 0.7),
                        itemBuilder: (BuildContext context, index) {
                          return new GestureDetector(
                            child: fCard(copy[index]),

                            onTap: () {

                            },
                          );
                        })
                )
              ],
            ),
          )

      ),
    );
  }
}

