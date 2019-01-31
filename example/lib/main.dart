import 'package:flutter/material.dart';
import 'package:app_intro/app_intro.dart';

void main(){

  List<Slide> _slides= [
    new Slide(
        'Flutter',
        'Flutter is an open-source mobile application development SDK created by Google. It is used to develop applications for Android and iOS, as well as being the primary method of creating applications for Google Fuchsia.',
        'assets/icons/flutter_icon.png'),

    new Slide(
        'Android',
        'Android is a mobile operating system developed by Google. It is based on a modified version of the Linux kernel and other open source software, and is designed primarily for touchscreen mobile devices such as smartphones and tablets.',
        'assets/icons/android.png'),

    new Slide(
        'Apple',
        'Apple Inc. is an American multinational technology company headquartered in Cupertino, California, that designs, develops, and sells consumer electronics, computer software, and online services. It is considered one of the Big Four of technology along with Amazon, Google and Facebook.',
        'assets/icons/apple.png')

  ];

  String _buttonText = "Login with OTP";
  VoidCallback _onTnCButtonClick = (){
    print('Terms and conditions page');
  };

  VoidCallback _onButtonClick = (){
    print('Login with OTP');
  };

  SingleButtonIntro _appIntro = new SingleButtonIntro(
      _slides,
      _onButtonClick,
      _buttonText,
      _onTnCButtonClick);

  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Intro Screens',
        home: _appIntro,
      )
  );
}