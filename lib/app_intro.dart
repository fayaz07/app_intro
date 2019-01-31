library app_intro;

import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:io';
import 'package:flutter/cupertino.dart';

//var _orientation;
double _width, _height;
List<Slide> _slides;
VoidCallback _onButtonPress,_tncButton;
String _buttonText;

class SingleButtonIntro extends StatefulWidget {

  SingleButtonIntro(List<Slide> slidesList,VoidCallback continueButtonPress,String buttonText,VoidCallback tNcButtonPress){
    _slides = slidesList;
    _onButtonPress = continueButtonPress;
    _buttonText = buttonText;
    _tncButton = tNcButtonPress;
  }

  @override
  State<StatefulWidget> createState() {
    return SingleButtonIntroState();
  }
}

class SingleButtonIntroState extends State<SingleButtonIntro> {

  static final PageController pageController = new PageController();
  static int pos = 0;

  static const _kDuration = const Duration(milliseconds: 300);
  var _dotIndicatorPlus = new Dots(
    controller: pageController,
    itemCount: _slides.length,
    onPageSelected: (int page) {
      pageController.animateToPage(page,
          duration: _kDuration, curve: Curves.decelerate);
    },
    color: Colors.blueAccent,
  );

  @override
  Widget build(BuildContext context) {

    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
//    _orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          AnimatedContainer(
            curve: Curves.bounceInOut,
            duration: Duration(milliseconds: 400),
            child: PageView.builder(
              physics: new ClampingScrollPhysics(),
              controller: pageController,
              itemBuilder: (BuildContext context, int index) {
                return _slides[index % _slides.length];
              },
              itemCount: _slides.length,
              onPageChanged: (int value) {
                setState(() {
                  pos = value;
                });
              },
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).orientation == Orientation.portrait ? _height * 2/ 10 : _height*2.30/10,
            right: 0.0,
            left: 0.0,
            child: Center(
              child: _dotIndicatorPlus,
            ),
          ),
          Positioned(
              right: _width*0.5/10,
              left: _width*0.5/10,
              bottom: _height * 0.45 / 10,
              child: _bottomMenu()),
        ],
      ),
    );
  }

  Widget _bottomMenu() {
    return Column(
      children: <Widget>[
        platformButton(
          child: SizedBox(
            width: _width*9/10,
            height: Platform.isAndroid ? _height*.7/10 : _height*.4/10,
            child: Center(
              child: Text(
                '$_buttonText',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white,fontSize: MediaQuery.of(context).orientation == Orientation.portrait? _height*0.225/10 : _height*0.32/10 ,fontStyle: FontStyle.normal,decorationColor: Colors.white),
              ),
            ),
          ),
          color: Colors.blue,
          onPressed: _onButtonPress,
        ),
        SizedBox(
          height: _height*0.25/10,
        ),
        InkWell(
          child: Text('Terms and Conditions',textAlign: TextAlign.center,style: TextStyle(fontSize: MediaQuery.of(context).orientation == Orientation.portrait ? _height*0.202/10 : _height*0.30/10),),
          onTap: _tncButton,
        )
      ],
    );
  }

  Widget platformButton({Widget child, Color color, VoidCallback onPressed}) {
    if(Platform.isIOS){
      return CupertinoButton(child: child, onPressed: onPressed,color: color,borderRadius: BorderRadius.all(Radius.circular(6.0)),);
    }else{
      return RaisedButton(child: child,onPressed: onPressed,color: color,shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6.0))),);
    }
  }
}

class Dots extends AnimatedWidget {
  // @Collin Jackson
  Dots({
    this.controller,
    this.itemCount,
    this.onPageSelected,
    this.color: Colors.white,
  }) : super(listenable: controller);

  final PageController controller;
  final int itemCount;
  final ValueChanged<int> onPageSelected;
  final Color color;
  static const double _kDotSize = 6.0;
  static const double _kMaxZoom = 1.5;
  static const double _kDotSpacing = 18.0;

  Widget _buildDot(int index) {
    double selectedNess = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((controller.page ?? controller.initialPage) - index).abs(),
      ),
    );

    double zoom = 1.0 + (_kMaxZoom - 1.0) * selectedNess;
    return new Container(
      width: _kDotSpacing,
      child: new Center(
        child: new Material(
          color: color,
          type: MaterialType.circle,
          child: new Container(
            width: _kDotSize * zoom,
            height: _kDotSize * zoom,
            child: new InkWell(
              onTap: () => onPageSelected(index),
            ),
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: new List<Widget>.generate(itemCount, _buildDot),
    );
  }
}

class Slide extends StatelessWidget {
  double _height;
  String title, description, icon;

  Slide(this.title, this.description, this.icon);

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;

    TextStyle titleStyle = new TextStyle(
        color: Colors.black87, fontSize: MediaQuery.of(context).orientation == Orientation.portrait ? _height*0.41/10 : _height*.55/10, fontWeight: FontWeight.w700);
    TextStyle desc = new TextStyle(
        color: Colors.grey, fontSize: MediaQuery.of(context).orientation == Orientation.portrait ? _height*0.25/10 : _height*0.35/10, fontWeight: FontWeight.w400);

    return Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          height: _height * 8.5 / 10,
          width: double.infinity,
          child: Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).orientation == Orientation.portrait ? _height * 1 / 10 : _height * 0.5 / 10,
                  bottom: MediaQuery.of(context).orientation == Orientation.portrait ? _height * 0.75 / 10 : _height * 0.25 / 10,
                  left: 20.0,
                  right: 20.0),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: _height*4/10,
                    child: Image.asset(icon),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    title,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    style: titleStyle,
                    textDirection: TextDirection.ltr,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  SafeArea(child: Text(
                    description,
                    textAlign: TextAlign.center,
                    style: desc,
                    maxLines: 5,
                    textDirection: TextDirection.ltr,
                  )),
                ],
              )),
        ));
  }
}


