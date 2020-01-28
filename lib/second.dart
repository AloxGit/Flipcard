import 'package:flipcard/finalScreen.dart';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'global.dart';

class Second extends StatefulWidget {

  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> {

  Widget fCard(index){
    if(index%4==0){
      return new Card(
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text('hello'),
//      ),
      body: WillPopScope(
        onWillPop: (){
          Navigator.pop(context);
          five.clear();
          cnt=0;
          isSelected = [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false];
          return null;
        },
        child: Container(
          padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  //stops: [0.5, 1],
                  colors: [Color(0xffb06ab3), Color(0xff4568dc)]
              )
          ),
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                height: 230,
                child: Text("Choose the final\ncard",
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
                          child: fCard(five[index]),

                          onTap: () {

                            c=five[index];
                            num=c~/4+1;
                            suite=c%4;
                            cnt=0;
                            isSelected = [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false];


                            //debugPrint('$c');
                            five.remove(c);
                            five.sort();

                            void minThree( int p, int q, int r) {
                              var temp=[p, q, r];
                              int j=0;
                              for(int i=0; i<5; i++) {
                                if(i!=fdInd && i!=hInd) {
                                  copy[i]=temp[j];
                                  //debugPrint('.$i');
                                  j++;
                                }
                              }
                            }

                            void suiteDec() {
                              if(suite<fdInd) {
                                copy[suite]=five[3];
                                hInd=suite;
                              }
                              else {
                                copy[suite+1]=five[3];
                                hInd=suite+1;
                              }
                            }

                            if(num<=5) {
                              copy[num-1]=53;
                              fdInd=num-1;
                              suiteDec();
                              minThree(five[0], five[1], five[2]);
                            }
                            else if(num<=10) {
                              copy[num-6]=53;
                              fdInd=num-6;
                              suiteDec();

                              minThree(five[2], five[1], five[0]);
                            }
                            else {
                              copy[num-11]=53;
                              fdInd=num-11;
                              suiteDec();
                              minThree(five[0], five[2], five[1]);
                            }

                            //five.add(c);
                            five.insert(index, c);
                            five.remove(100);
                            for(int i=0; i<5; i++) {
                              debugPrint('-${copy[i]}=${five[i]}');
                            }
                            //five.clear();

                            //five.remove(100);
                            debugPrint('lenght is ${five.length}');
                            Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: FinalScreen()));

                          },
                        );
                      })
              )
            ],
          ),
        ),
      )
    );
  }
}
