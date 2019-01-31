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

