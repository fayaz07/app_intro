# App Intro
A light weight package that helps developers easily provide few introduction screens and describe about their app

# Usage
> Import the package to your dart file
```
import 'package:app_intro/app_intro.dart';
```

> Get ready with the stuff

Collect titles, description and relevant images for slides. Create a list of slides and pass it as a parameter
*Note: Image path must be local
```

List<Slide> slides= [
    new Slide('Title-1','Description-1','image-1-path'),
    new Slide('Title-2','Description-2','image-2-path'),
    new Slide('Title-3','Description-3','image-3-path'),
    new Slide('Title-4','Description-4','image-4-path'),
    ...
  ];
```

The user is provided with two buttons
* Terms and Conditions
* General Button(You must provide what text should be shown there)

Create a terms and conditions page for your app and you can navigate to TnC page when the user clicks on the Terms and Conditions button. Also when these intro slides are finished, user clicks on Gerneral button, write the code what you need to do at then as below.

```
VoidCallback onTermsAndConditionsButtonClick = (){
// Write your code
// Ex: Navigating to Terms and Conditions Screen
}

VoidCallback onGeneralButtonClick = (){
// Write your code
// Ex: Navigating to home screen
}
```

> Name the button

You should specify the name or text that should be shown on the button
```
String button_text = 'Login with OTP';
```

> Create an instance of SingleButtonIntro

Create an instance for SingleButtonIntro and pass the variables you just created. 
*Note: No optional parameters here 
```
SingleButtonIntro app_intro = new SingleButtonIntro(
                                    slides,
                                    onTermsAndConditionsButtonClick,
                                    button_text,
                                    onGeneralButtonClick
                                    );
```
> Attatch app_intro to root

The final step is to place the app_intro object in the body of your screen
```
void main(){
    runApp(
        MaterialApp(
          title: 'Intro Screens',
          home:_appIntro,
        )
  );
}
```

# Complete example

```
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

  String button_text = "Login with OTP";
  VoidCallback _onTnCButtonClick = (){
                                print('Terms and conditions page');
                            };

  VoidCallback _onButtonClick = (){
                                print('Login with OTP');
                            };

  SingleButtonIntro _appIntro = new SingleButtonIntro(
                                _slides, 
                                _onTnCButtonClick, 
                                button_text,
                                _onButtonClick);

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Intro Screens',
      home: _appIntro,
    )
  );
}
```

 ![SingleButtonIntro](https://raw.githubusercontent.com/fayaz07/intro_screens/master/single_button_app_intro.gif)

