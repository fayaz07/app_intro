# App Intro
A light weight package that helps developers easily provide few introduction screens and describe about their app

[Get the library](https://pub.dartlang.org/packages/app_intro)   |   [Example](https://github.com/fayaz07/app_intro/tree/master/example) 

[![](https://img.shields.io/badge/dontate-Buy%20Me%20a%20Coffee-blueviolet)](https://www.buymeacoffee.com/fayaz) &nbsp; 
[![LinkedIn](https://img.shields.io/badge/LinkedIn-in-0e76a8)](https://www.linkedin.com/in/fayaz07) &nbsp; [![Follow](https://img.shields.io/github/followers/fayaz07?style=social)](https://github.com/fayaz07) &nbsp; [![Fork](https://img.shields.io/github/forks/fayaz07/app_intro?style=social)](https://github.com/fayaz07/app_intro/fork) &nbsp; [![Star](https://img.shields.io/github/stars/fayaz07/app_intro?style=social)](https://github.com/fayaz07/app_intro/star) &nbsp; [![Watches](https://img.shields.io/github/watchers/fayaz07/app_intro?style=social)](https://github.com/fayaz07/app_intro/) 

[![Get the library](https://img.shields.io/badge/Get%20library-pub-blue)](https://pub.dartlang.org/packages/app_intro) &nbsp; [![Example](https://img.shields.io/badge/Example-Ex-success)](https://github.com/fayaz07/app_intro/tree/master/example)



## Supported Dart Versions
**Dart SDK version >= 2.1.0**



## Demo
<img src="https://raw.githubusercontent.com/fayaz07/app_intro/master/single_button_app_intro.gif" width="350" height="620" alt="Demo" />


# Usage
> Import the package to your dart file
```dart
import 'package:app_intro/app_intro.dart';
```

> Get ready with the stuff

Collect titles, description and relevant images for slides. Create a list of slides and pass it as a parameter
*Note: Image path must be local

```dart
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

```dart
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
```dart
String button_text = 'Login with OTP';
```

> Create an instance of SingleButtonIntro

Create an instance for SingleButtonIntro and pass the variables you just created. 
*Note: No optional parameters here 
```dart
SingleButtonIntro app_intro = new SingleButtonIntro(
                                    slides,
                                    onTermsAndConditionsButtonClick,
                                    button_text,
                                    onGeneralButtonClick
                                    );
```
> Attatch app_intro to root

The final step is to place the app_intro object in the body of your screen
```dart
void main(){
    runApp(
        MaterialApp(
          title: 'Intro Screens',
          home:_appIntro,
        )
  );
}
```


