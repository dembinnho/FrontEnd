# location_front

This repo contains a flutter front web app, it has secure-web-dev as backend

## 👷 Prerequisites

1. Install flutter on your machine
2. Install Google Chrome if it's not already in your machine
3. Launch the secure web dev backend that you can use here: add github link
4. Follow these instructions to enable flutter to connect to the localhost backend: 
        1- Go to flutter\bin\cache and remove a file named: flutter_tools.stamp
        2- Go to flutter\packages\flutter_tools\lib\src\web and open the file chrome.dart.
        3- Find '--disable-extensions'
        4- Add '--disable-web-security'

5. run "flutter run ." and select chrome as environment to run the app

## Quick information

This project is a front application linked to a node/express backend.
It is meant to run on Chrome, however you can launch it on an Android or IOS device (will not run correctly).

I used the MVC pattern, as in flutter everything is a widget and we compose widget with others to build screen.

the Lib directory contains

    --> Models (contains the used models (objects to instanciate) (Location))
    --> Utils (contains the utilitaries (for instance the image handler))
    --> Widgets (contains widgets used heavily in the app)
    --> UI (contains the app pages)
    
We used http protocol to make get and post request
